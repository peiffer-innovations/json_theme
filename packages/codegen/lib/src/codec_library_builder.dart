// ignore_for_file: avoid_print

import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:json_theme_annotation/json_theme_annotation.dart';
import 'package:json_theme_codegen/src/decoders/decoders.dart';
import 'package:json_theme_codegen/src/decoders/encoders.dart';
import 'package:json_theme_codegen/src/decoders/schema_decoders.dart';
import 'package:recase/recase.dart';
import 'package:source_gen/source_gen.dart';

const _enumChecker = TypeChecker.typeNamed(
  CodecEnum,
  inPackage: 'json_theme_annotation',
);

const _ignoreChecker = TypeChecker.typeNamed(
  CodecIgnore,
  inPackage: 'json_theme_annotation',
);

const _codecSchemaChecker = TypeChecker.typeNamed(
  CodecSchema,
  inPackage: 'json_theme_annotation',
);

const _codecDefaultValueChecker = TypeChecker.typeNamed(
  CodecDefaultValue,
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
    final schemaEnumBuf = StringBuffer();
    final schemaMapBuf = StringBuffer();
    final schemaBuf = StringBuffer();

    final methods = <String, String>{};
    for (var m in element.methods) {
      if (m.isPublic && m.displayName.startsWith(codec)) {
        final mName = m.displayName;
        methods[mName.substring(codec.length)] = '$name.instance.$mName';

        if (decode) {
          final processed = _processDecodeMethod(
            name,
            m,
            schemaBuf: schemaBuf,
            schemaEnumBuf: schemaEnumBuf,
            schemaMapBuf: schemaMapBuf,
            schemaUrl: schemaUrl,
          );
          if (processed != null) {
            classBuf.write(processed);
          }
        } else {
          final processed = _processEncodeMethod(name, m);
          if (processed != null) {
            classBuf.write(processed);
          }
        }
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

    final schemas = codec == 'encode'
        ? ''
        : '''
$schemaBuf

class Schemas {
  Schemas._();

static final enums = List<String>.unmodifiable([
$schemaEnumBuf
]);

static final all = Map<String, Map<String, Object>>.unmodifiable({
..._kCustomSchemas,
$schemaMapBuf
});
}
''';

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
// ignore_for_file: unreachable_switch_default
// ignore_for_file: unused_local_variable

class $name extends _$name {
  factory $name() => instance;

  const $name._(): super._();

  static const instance = $name._();
$classBuf
}

$schemas

$methodMapperBuf
''';
  }

  String? _processDecodeMethod(
    String className,
    MethodElement method, {
    required StringBuffer schemaEnumBuf,
    required StringBuffer schemaMapBuf,
    StringBuffer? schemaBuf,
    String schemaUrl = '',
  }) {
    final element = method.returnType.element;

    final defaultValues = Map.fromEntries(
      _codecDefaultValueChecker
          .annotationsOf(method)
          .map(
            (a) => MapEntry<String, String>(
              ConstantReader(a).read('name').stringValue,
              ConstantReader(a).read('value').stringValue,
            ),
          ),
    );

    final enumLike = _enumChecker.annotationsOf(method).isNotEmpty;
    final ignored = _ignoreChecker
        .annotationsOf(method)
        .map((a) => ConstantReader(a).read('name').stringValue);
    final schemaOnly = _codecSchemaChecker.annotationsOf(method).isNotEmpty;
    final unencodable = _unencodableChecker
        .annotationsOf(method)
        .map((a) => ConstantReader(a).read('name').stringValue);

    if (!schemaOnly && !method.isAbstract) {
      return null;
    }

    if (element is EnumElement || (element is InstanceElement && enumLike)) {
      final instance = element as InstanceElement;
      schemaBuf?.write(
        _processSchemaEnum(
          method,
          instance,
          ignored: ignored,
          schemaEnumBuf: schemaEnumBuf,
          schemaMapBuf: schemaMapBuf,
          unencodable: unencodable,
        ),
      );

      if (!schemaOnly) {
        return _processDecodeMethodEnum(
          method,
          element,
          schemaUrl,
          ignored: ignored,
          unencodable: unencodable,
        );
      } else {
        return null;
      }
    } else if (element is ClassElement) {
      schemaBuf?.write(
        _processSchemaClass(
          method,
          element,
          ignored: ignored,
          schemaMapBuf: schemaMapBuf,
          unencodable: unencodable,
        ),
      );

      if (!schemaOnly) {
        return _processDecodeMethodClass(
          method,
          element,
          schemaUrl,
          defaultValues: defaultValues,
          ignored: ignored,
          unencodable: unencodable,
        );
      } else {
        return null;
      }
    } else {
      throw Exception(
        'Unknown element type: ${element.runtimeType} named ${element?.displayName} on method ${method.name}',
      );
    }
  }

  String _processDecodeMethodClass(
    MethodElement method,
    ClassElement element,
    String schemaUrl, {
    required Map<String, String> defaultValues,
    required Iterable<String> ignored,
    required Iterable<String> unencodable,
  }) {
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

      if (ignored.contains(p.displayName)) {
        continue;
      }
      if (type is FunctionType || unencodable.contains(p.displayName)) {
        value = "value['${p.displayName}']";
      } else {
        value = decode(
          element,
          p,
          aliases: {},
          defaults: defaultValues,
          paramDecoders: [],
        );
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
    InstanceElement element,
    String schemaUrl, {
    required Iterable<String> ignored,
    required Iterable<String> unencodable,
  }) {
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
      if (f.displayName == 'values' ||
          f.isPrivate ||
          !f.isStatic ||
          ignored.contains(f.displayName)) {
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

  String? _processEncodeMethod(
    String className,
    MethodElement method, {
    String schemaUrl = '',
  }) {
    final element = method.formalParameters.first.type.element!;

    final defaultValues = Map.fromEntries(
      _codecDefaultValueChecker
          .annotationsOf(method)
          .map(
            (a) => MapEntry<String, String>(
              ConstantReader(a).read('name').stringValue,
              ConstantReader(a).read('value').stringValue,
            ),
          ),
    );

    final enumLike = _enumChecker.annotationsOf(method).isNotEmpty;
    final ignored = _ignoreChecker
        .annotationsOf(method)
        .map((a) => ConstantReader(a).read('name').stringValue);
    final unencodable = _unencodableChecker
        .annotationsOf(method)
        .map((a) => ConstantReader(a).read('name').stringValue);

    if (!method.isAbstract) {
      return null;
    }

    if (element is EnumElement || (element is InterfaceElement && enumLike)) {
      return _processEncodeMethodEnum(
        method,
        element as InterfaceElement,
        schemaUrl,
        ignored: ignored,
        unencodable: unencodable,
      );
    } else if (element is ClassElement) {
      return _processEncodeMethodClass(
        method,
        element,
        schemaUrl,
        defaultValues: defaultValues,
        ignored: ignored,
        unencodable: unencodable,
      );
    } else {
      throw Exception(
        'Unknown element type: ${element.runtimeType} named ${element.displayName} on method ${method.name}',
      );
    }
  }

  String _processEncodeMethodClass(
    MethodElement method,
    ClassElement element,
    String schemaUrl, {
    required Map<String, String> defaultValues,
    required Iterable<String> ignored,
    required Iterable<String> unencodable,
  }) {
    final buf = StringBuffer();

    final name = method.displayName;

    final returnType = method.returnType.getDisplayString().replaceAll('?', '');

    buf.writeln('''

@override
$returnType? $name(${element.displayName}? value) {
  if (value == null) {
    return null;
  }
''');

    final constructor = element.constructors.first;

    buf.writeln('return {');
    for (final p in constructor.formalParameters) {
      final type = p.type;
      String? value;

      if (ignored.contains(p.displayName) ||
          type is FunctionType ||
          unencodable.contains(p.displayName)) {
        continue;
      }
      value = encode(element, p, aliases: {});

      buf.writeln("'${p.displayName}': $value,");
    }
    buf.writeln('};');

    buf.writeln('}');
    print('$buf');
    return buf.toString();
  }

  String _processEncodeMethodEnum(
    MethodElement method,
    InterfaceElement element,
    String schemaUrl, {
    required Iterable<String> ignored,
    required Iterable<String> unencodable,
  }) {
    final buf = StringBuffer();

    final name = method.displayName;
    final returnType = method.returnType.getDisplayString().replaceAll('?', '');

    buf.writeln('''

@override
$returnType? $name(${element.displayName}? value) {
  if (value == null) {
    return null;
  }

  switch (value) {
''');
    for (var f in element.fields) {
      if (f.displayName == 'values' ||
          f.isPrivate ||
          !f.isStatic ||
          ignored.contains(f.displayName) ||
          unencodable.contains(f.displayName)) {
        continue;
      }

      buf.writeln('''
    case ${element.displayName}.${f.displayName}:
      return '${f.displayName}';
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

  String _processSchemaClass(
    MethodElement method,
    ClassElement element, {
    required Iterable<String> ignored,
    required StringBuffer schemaMapBuf,
    required Iterable<String> unencodable,
  }) {
    final buf = StringBuffer();

    final clazz = method.returnType
        .getDisplayString()
        .replaceAll('?', '')
        .replaceAll('<', '')
        .replaceAll('>', '');
    final snakeCase = ReCase(clazz).snakeCase;

    final constructor = element.constructors.first;

    final properties = constructor.formalParameters
        .where((p) => !ignored.contains(p.displayName))
        .map(
          (e) =>
              "'${e.name}': ${unencodable.contains(e.name) || e.type is FunctionType ? 'SchemaHelper.stringSchema' : decodeSchema(e)}",
        );

    schemaMapBuf.writeln('${clazz}Schema.id: ${clazz}Schema.schema,');

    buf.write('''
class ${clazz}Schema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/$snakeCase.json';

  static final schema = {
    r'\$schema': 'http://json-schema.org/draft-07/schema#',
    r'\$id': id,
    'type': 'object',
    'title': '$clazz',
    'additionalProperties': false,
    'properties': {
      ${properties.join(',')},
    },
  };
}
''');

    return buf.toString();
  }

  String _processSchemaEnum(
    MethodElement method,
    InstanceElement element, {
    required Iterable<String> ignored,
    required StringBuffer schemaEnumBuf,
    required StringBuffer schemaMapBuf,
    required Iterable<String> unencodable,
  }) {
    final buf = StringBuffer();

    final clazz = method.returnType.getDisplayString().replaceAll('?', '');
    final snakeCase = ReCase(clazz).snakeCase;

    final options = element.fields
        .where(
          (e) =>
              e.name != 'values' &&
              e.isPublic &&
              e.isStatic &&
              !ignored.contains(e.name),
        )
        .map((e) => e.name);

    schemaEnumBuf.writeln('${clazz}Schema.id,');
    schemaMapBuf.writeln('${clazz}Schema.id: ${clazz}Schema.schema,');

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
