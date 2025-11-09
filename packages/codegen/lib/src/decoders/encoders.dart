import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';

typedef ParameterEncoder =
    String Function(FormalParameterElement element, {required String name});

final kEncoders = <String, ParameterEncoder>{
  'bool': (element, {required String name}) => 'value.$name',
  'double': (element, {required String name}) =>
      'value.$name == double.infinity ? null : value.$name',
  'int': (element, {required String name}) => 'value.$name',
  'DateTime': (element, {required String name}) =>
      'value.$name.millisecondsSinceEpoch',
  'Duration': (element, {required String name}) =>
      element.type.nullabilitySuffix == NullabilitySuffix.question
      ? 'value.$name?.inMilliseconds'
      : 'value.$name.inMilliseconds',
  'List<double>': (element, {required String name}) => 'value.$name',
  'List<int>': (element, {required String name}) => 'value.$name',
  'List<String>': (element, {required String name}) => 'value.$name',
  'Object': (element, {required String name}) => 'value.$name',
  'String': (element, {required String name}) => 'value.$name',
  'Widget': (element, {required String name}) =>
      'ThemeDecoder.instance.encodeIcon(value.$name)',
};

String encode(
  ClassElement classElement,
  FormalParameterElement element, {
  required Map<String, String> aliases,
  required InterfaceType? override,
}) {
  if (override != null) {
    print('override');
  }
  final name = aliases[element.name] ?? element.name!;

  final type = override ?? element.type;
  final eType = type
      .toString()
      .replaceAll('?', '')
      .replaceAll('<', '')
      .replaceAll('>', '')
      .replaceAll('double', 'Double')
      .replaceAll('bool', 'Bool');

  var result = 'ThemeEncoder.instance.encode$eType(value.$name)';

  final typeStr = type.toString().replaceAll('?', '');

  final encoder = kEncoders[typeStr];

  if (encoder != null) {
    result = encoder(element, name: name);
  } else if (typeStr.startsWith('List')) {
    if (type is InterfaceType &&
        (type.isDartCoreList || type.isDartCoreIterable)) {
      final subtype = typeStr.replaceAll('List<', '').replaceAll('>', '');
      result =
          '''
_encodeList(value.$name,
        (e) => ThemeEncoder.instance.encode$subtype(e)!,
      )
''';
    }
  }

  return result;
}
