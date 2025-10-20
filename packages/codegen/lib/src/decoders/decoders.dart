import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';

typedef ParameterDecoder =
    String Function(
      FormalParameterElement element, {
      required String? defaultValueCode,
      required String name,
    });

final kDecoders = <String, ParameterDecoder>{
  'bool':
      (
        element, {
        required String? defaultValueCode,
        required String name,
      }) => element.type.nullabilitySuffix == NullabilitySuffix.question
      ? "JsonClass.maybeParseBool(value['$name'],)"
      : "JsonClass.parseBool(value['$name'], whenNull: ${defaultValueCode ?? false},)",
  'double':
      (element, {required String? defaultValueCode, required String name}) =>
          _defaultDecoder(
            element,
            name,
            (element.type.nullabilitySuffix == NullabilitySuffix.question ||
                    element.defaultValueCode != null)
                ? 'JsonClass.maybeParseDouble'
                : 'JsonClass.parseDouble',
            defaultValueCode,
          ),
  'int': (element, {required String? defaultValueCode, required String name}) =>
      _defaultDecoder(
        element,
        name,
        (element.type.nullabilitySuffix == NullabilitySuffix.question ||
                element.defaultValueCode != null)
            ? 'JsonClass.maybeParseInt'
            : 'JsonClass.parseInt',
        defaultValueCode,
      ),
  'Curve':
      (element, {required String? defaultValueCode, required String name}) =>
          _defaultDecoder(
            element,
            name,
            'CurvesValues.lookup',
            defaultValueCode,
          ),
  'DateTime':
      (element, {required String? defaultValueCode, required String name}) =>
          _defaultDecoder(
            element,
            name,
            (element.type.nullabilitySuffix == NullabilitySuffix.question ||
                    element.defaultValueCode != null)
                ? 'JsonClass.maybeParseDateTime'
                : 'JsonClass.parseDateTime',
            defaultValueCode,
          ),
  'Duration':
      (element, {required String? defaultValueCode, required String name}) =>
          _defaultDecoder(
            element,
            name,
            (element.type.nullabilitySuffix == NullabilitySuffix.question ||
                    element.defaultValueCode != null)
                ? 'JsonClass.maybeParseDurationFromMillis'
                : 'JsonClass.parseDurationFromMillis',
            defaultValueCode,
          ),
  'List<double>':
      (element, {required String? defaultValueCode, required String name}) =>
          _defaultDecoder(
            element,
            name,
            (element.type.nullabilitySuffix == NullabilitySuffix.question ||
                    element.defaultValueCode != null)
                ? 'JsonClass.maybeParseDoubleList'
                : 'JsonClass.parseDoubleList',
            defaultValueCode,
          ),
  'List<int>':
      (element, {required String? defaultValueCode, required String name}) =>
          _defaultDecoder(
            element,
            name,
            (element.type.nullabilitySuffix == NullabilitySuffix.question ||
                    element.defaultValueCode != null)
                ? 'JsonClass.maybeParseIntList'
                : 'JsonClass.parseIntList',
            defaultValueCode,
          ),
  'String': (element, {required String? defaultValueCode, required String name}) =>
      "value['$name'] ${defaultValueCode == null ? '' : ' ?? $defaultValueCode'}",
  // ...kThemeDecoders.map(
  //   (key, value) => MapEntry<String, ParameterDecoder>(
  //     key,
  //     (element, {required String? defaultValueCode, required String name}) =>
  //         _themeDecoder(element, name, value, defaultValueCode),
  //   ),
  // ),
};

String decode(
  ClassElement classElement,
  FormalParameterElement element, {
  required Map<String, String> aliases,
  required Map<String, String> defaults,
  required Iterable<String> paramDecoders,
}) {
  final name = aliases[element.name] ?? element.name!;
  var defaultValueCode =
      defaults[name] ??
      (paramDecoders.contains(name) ? null : element.defaultValueCode);
  if (defaultValueCode != null) {
    if (defaultValueCode == 'null') {
      defaultValueCode = null;
    } else if (element.type.toString().replaceAll('?', '') == 'double') {
      if (int.tryParse(defaultValueCode) != null) {
        defaultValueCode = '$defaultValueCode.0';
      }
    }
  }
  var result =
      "value['$name']${defaultValueCode == null ? '' : '?? $defaultValueCode'}";

  final typeStr = element.type.toString().replaceAll('?', '');

  var decoded = false;
  if (paramDecoders.contains(name)) {
    decoded = true;
  }

  if (!decoded) {
    final decoder = kDecoders[typeStr];

    if (decoder != null) {
      result = decoder(element, defaultValueCode: defaultValueCode, name: name);
    }
  }

  return result;
}

String themeDecoder(
  FormalParameterElement element,
  String name,
  String funName,
  String? defaultValueCode,
) {
  return '''
() {
  dynamic parsed = $funName(value['$name'], validate: false,);
  ${element.type.nullabilitySuffix == NullabilitySuffix.question && defaultValueCode != null ? '''
  if (!map.containsKey('$name')) {
    parsed ??= $defaultValueCode;
  }
''' : '''
    ${defaultValueCode == null ? '' : 'parsed ??= $defaultValueCode;'}
'''}
  ${element.type.nullabilitySuffix != NullabilitySuffix.question && defaultValueCode == null ? "if (parsed == null) { throw Exception('Null value encountered for required parameter: [$name].',); }" : ''}
  return parsed;
}()
''';
}

String _defaultDecoder(
  FormalParameterElement element,
  String name,
  String funName,
  String? defaultValueCode,
) {
  return '''
() {
  dynamic parsed = $funName(value['$name']);

  ${element.type.nullabilitySuffix == NullabilitySuffix.question && defaultValueCode != null ? '''
  if (!map.containsKey('$name')) {
    parsed ??= $defaultValueCode;
  }
''' : '''
    ${defaultValueCode == null ? '' : 'parsed ??= $defaultValueCode;'}
'''}
  ${element.type.nullabilitySuffix != NullabilitySuffix.question && defaultValueCode == null ? "if (parsed == null) { throw Exception('Null value encountered for required parameter: [$name].',); }" : ''}
  return parsed;
}()
''';
}
