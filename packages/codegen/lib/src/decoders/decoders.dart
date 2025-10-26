import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';

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
  'List<String>':
      (element, {required String? defaultValueCode, required String name}) =>
          "value['$name'] ${defaultValueCode == null ? '' : ' ?? $defaultValueCode'}",
  'Object': (element, {required String? defaultValueCode, required String name}) =>
      "value['$name'] ${defaultValueCode == null ? '' : ' ?? $defaultValueCode'}",
  'String': (element, {required String? defaultValueCode, required String name}) =>
      "value['$name'] ${defaultValueCode == null ? '' : ' ?? $defaultValueCode'}",
  'Widget':
      (element, {required String? defaultValueCode, required String name}) =>
          'ThemeDecoder.instance.decodeIcon(value["$name"], validate: false)',
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

  final eType = element.type
      .toString()
      .replaceAll('?', '')
      .replaceAll('<', '')
      .replaceAll('>', '')
      .replaceAll('double', 'Double')
      .replaceAll('bool', 'Bool');

  var result =
      "ThemeDecoder.instance.decode$eType(value['$name'], validate: false,)${defaultValueCode == null ? '' : '?? $defaultValueCode'}";

  if (element.type.nullabilitySuffix != NullabilitySuffix.question &&
      defaultValueCode == null) {
    result = '$result!';
  }
  final typeStr = element.type.toString().replaceAll('?', '');

  var decoded = false;
  if (paramDecoders.contains(name)) {
    decoded = true;
  }

  if (!decoded) {
    final decoder = kDecoders[typeStr];

    if (decoder != null) {
      result = decoder(element, defaultValueCode: defaultValueCode, name: name);
    } else if (typeStr.startsWith('List')) {
      final type = element.type;
      if (type is InterfaceType &&
          (type.isDartCoreList || type.isDartCoreIterable)) {
        final subtype = typeStr.replaceAll('List<', '').replaceAll('>', '');
        result =
            '''
ThemeDecoder.instance._decodeDynamicList(
        value['$name'],
        (e) => ThemeDecoder.instance.decode$subtype(e, validate: false)!,
      )
''';
      }
    }
  }

  return result;
}

String _defaultDecoder(
  FormalParameterElement element,
  String name,
  String funName,
  String? defaultValueCode,
) {
  final buf = StringBuffer();

  buf.write("$funName(value['$name'])");

  if (defaultValueCode != null) {
    buf.write(' ?? $defaultValueCode');
  }

  return buf.toString();
}
