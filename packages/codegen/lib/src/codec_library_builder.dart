// ignore_for_file: avoid_print

import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:json_theme_annotation/json_theme_annotation.dart';
import 'package:json_theme_codegen/src/decoders/decoders.dart';
import 'package:recase/recase.dart';
import 'package:source_gen/source_gen.dart';

const _ignoreChecker = TypeChecker.typeNamed(
  CodecIgnore,
  inPackage: 'json_theme_annotation',
);
const _unencodableChecker = TypeChecker.typeNamed(
  CodecUnencodable,
  inPackage: 'json_theme_annotation',
);

String? _flutterVersion;

class CodecLibraryBuilder extends GeneratorForAnnotation<JsonThemeCodec> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    try {
      if (_flutterVersion == null) {
        try {
          final result = Process.runSync('flutter', ['--version']);

          _flutterVersion = result.stdout
              .toString()
              .trim()
              .split('\n')
              .join('\n//   ');
        } catch (e) {
          _flutterVersion = '<unknown>';
        }
      }

      final codec = annotation.read('mode').objectValue.variable!.displayName;
      final schemaUrl = annotation.read('baseSchemaUrl').stringValue;

      return _process(element, codec, schemaUrl);
    } catch (e, stack) {
      print('$e');
      print('$stack');
      rethrow;
    }
  }

  String _process(Element element, String codec, String schemaUrl) {
    final decode = codec == 'decode';
    final eName = element.name;
    if (eName == null) {
      throw Exception('Annotation found on unnamed location, cannot continue.');
    }

    final name = eName.substring(1);

    if (element is! ClassElement) {
      throw Exception('Annotation found but is ${element.runtimeType}');
    }
    final methodMapperBuf = StringBuffer();
    final classBuf = StringBuffer();
    final schemaBuf = StringBuffer();

    final methods = <String, String>{};
    for (var m in element.methods) {
      if (m.isPublic && m.displayName.startsWith(codec)) {
        final mName = m.displayName;
        methods[mName.substring(codec.length)] = '$name.instance.$mName';

        if (m.isAbstract) {
          if (decode) {
            classBuf.write(_processDecodeMethod(name, m, schemaBuf, schemaUrl));
          }
        }
        print(mName);
      }
    }

    methodMapperBuf.write('''
const k${name}s = <String, String>{
''');

    for (var entry in methods.entries) {
      const msp = 'MaterialStateProperty';
      const nativeTypes = ['bool', 'int', 'double', 'num'];
      var key = entry.key;
      if (key.startsWith(msp)) {
        var type = key.substring(msp.length);
        if (nativeTypes.contains(type.toLowerCase())) {
          type = type.toLowerCase();
        }
        key = '$msp<$type>';
      }
      methodMapperBuf.write("  '$key': '${entry.value}',\n");
    }

    methodMapperBuf.write('};');

    return '''
// Dart SDK: ${Platform.version}
// Flutter SDK:
//   $_flutterVersion

// ignore_for_file: avoid_init_to_null
// ignore_for_file: deprecated_member_use
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_final_locals
// ignore_for_file: prefer_if_null_operators
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unused_local_variable

class $name extends _$name {
  factory $name() => instance;

  const $name._(): super._();

  static const instance = $name._();
$classBuf
}

$schemaBuf

$methodMapperBuf
''';
  }

  String _processDecodeMethod(
    String className,
    MethodElement method, [
    StringBuffer? schemaBuf,
    String schemaUrl = '',
  ]) {
    final element = method.returnType.element;
    final ignored = _ignoreChecker.annotationsOf(method);

    if (element is EnumElement) {
      schemaBuf?.write(_processSchemaEnum(method, element));
      kDecoders[element.displayName.replaceAll('?', '')] =
          (
            element, {
            required String? defaultValueCode,
            required String name,
          }) => themeDecoder(
            element,
            name,
            '$className.instance.${method.displayName}',
            defaultValueCode,
          );

      return _processDecodeMethodEnum(method, element, schemaUrl);
    } else if (element is ClassElement) {
      return _processDecodeMethodClass(method, element, schemaUrl);
    } else {
      throw Exception('Unknown element type: ${element.runtimeType}');
    }
  }

  String _processDecodeMethodClass(
    MethodElement method,
    ClassElement element,
    String schemaUrl,
  ) {
    final buf = StringBuffer();

    final snakeName = ReCase(element.displayName).snakeCase;
    final name = method.displayName;

    buf.writeln('''

@override
${element.displayName}? $name(dynamic value, {bool validate = true}) {
  if (value == null) {
    return null;
  }
  
  if (value is ${element.displayName}) {
    return value;
  }

  assert(
    SchemaValidator.validate(
      schemaId: '$schemaUrl/$snakeName',
      value: value,
      validate: validate,
    ),
  );

''');

    final constructor = element.constructors.first;

    buf.writeln('return ${constructor.displayName}(');
    for (final p in constructor.formalParameters) {
      final type = p.type;
      String? value;
      final typeDisplay = p.type.getDisplayString().replaceAll('?', '');
      if (type is FunctionType) {
        value = "value['${p.displayName}']";
      } else {
        final decoder = kDecoders[typeDisplay];
        if (decoder != null) {
          value = decode(
            element,
            p,
            aliases: {},
            defaults: {},
            paramDecoders: [],
          );
        } else {
          value = "value['${p.displayName}']";
        }
      }
      buf.writeln('${p.displayName}: $value,');
    }
    buf.writeln(');');

    buf.writeln('}');
    print('$buf');
    return buf.toString();
  }

  String _processDecodeMethodEnum(
    MethodElement method,
    EnumElement element,
    String schemaUrl,
  ) {
    final buf = StringBuffer();

    final snakeName = ReCase(element.displayName).snakeCase;
    final name = method.displayName;

    buf.writeln('''

@override
${element.displayName}? $name(dynamic value, {bool validate = true}) {
  if (value == null) {
    return null;
  }
  
  if (value is ${element.displayName}) {
    return value;
  }

  assert(
    SchemaValidator.validate(
      schemaId: '$schemaUrl/$snakeName',
      value: value,
      validate: validate,
    ),
  );

  switch (value.toString()) {
''');
    for (var f in element.fields) {
      if (f.displayName == 'values' || f.isPrivate) {
        continue;
      }
      buf.writeln('''
case '${f.displayName}':
return ${element.displayName}.${f.displayName};
''');
    }
    buf.write('''
default:
  throw Exception('Unknown value: "\$value" for: ${element.displayName}');
''');
    buf.writeln('}}');
    print('$buf');
    return buf.toString();
  }

  String _processSchemaClass(MethodElement method, EnumElement element) {
    final buf = StringBuffer();
    return buf.toString();
  }

  String _processSchemaEnum(MethodElement method, EnumElement element) {
    final buf = StringBuffer();

    final clazz = method.returnType.getDisplayString().replaceAll('?', '');
    final snakeCase = ReCase(clazz).snakeCase;

    final options = element.fields
        .where((e) => e.name != 'values' && e.isPublic)
        .map((e) => e.name);

    buf.write('''
class ${clazz}Schema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/$snakeCase.json';

  static final schema = {
    r'\$schema': 'http://json-schema.org/draft-07/schema#',
    r'\$id': id,
    'type': 'string',
    'title': '$clazz',
    'oneOf': SchemaHelper.enumSchema([
      '${options.join("','")}',
    ]),
  };
}
''');

    return buf.toString();
  }
}
