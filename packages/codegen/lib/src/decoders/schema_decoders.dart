import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

typedef ParameterSchemaDecoder =
    String Function(FormalParameterElement element);

const _kNumberArraySchema = {
  'anyOf': [
    {'type': 'string'},
    {
      'type': 'array',
      'items': {'type': 'number'},
    },
  ],
};

const _kStringArraySchema = {
  'anyOf': [
    {'type': 'string'},
    {
      'type': 'array',
      'items': {'type': 'string'},
    },
  ],
};

final kSchemaDecoders = <String, ParameterSchemaDecoder>{
  'bool': (element) => 'SchemaHelper.boolSchema',
  'double': (element) => 'SchemaHelper.numberSchema',
  'Duration': (element) => 'SchemaHelper.numberSchema',
  'int': (element) => 'SchemaHelper.numberSchema',
  'List<double>': (element) => json.encode(_kNumberArraySchema),
  'List<int>': (element) => json.encode(_kNumberArraySchema),
  'List<String>': (element) => json.encode(_kStringArraySchema),
  'Object': (element) => 'SchemaHelper.anySchema',
  'String': (element) => 'SchemaHelper.stringSchema',
};

String decodeSchema(
  FormalParameterElement param,
  MapEntry<InterfaceType, bool>? override,
) {
  final typeStr = (override?.key ?? param.type).getDisplayString().replaceAll(
    '?',
    '',
  );

  final decoder = kSchemaDecoders[typeStr];
  if (decoder != null) {
    return decoder(param);
  }

  if (typeStr.startsWith('List')) {
    final type = override ?? param.type;
    if (type is InterfaceType &&
        (type.isDartCoreList || type.isDartCoreIterable)) {
      final subtype = typeStr.replaceAll('List<', '').replaceAll('>', '');
      return 'SchemaHelper.arraySchema(${subtype.replaceAll('<', '').replaceAll('>', '').replaceAll('bool', 'Bool').replaceAll('double', 'Double')}Schema.id)';
    }
  }

  return 'SchemaHelper.objectSchema(${typeStr.replaceAll('<', '').replaceAll('>', '').replaceAll('bool', 'Bool').replaceAll('double', 'Double')}Schema.id)';
}
