// ignore_for_file: avoid_print

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:json_theme_annotation/json_theme_annotation.dart';
import 'package:source_gen/source_gen.dart';

class CodecLibraryBuilder extends GeneratorForAnnotation<JsonThemeCodec> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final codec = annotation.read('name').stringValue;
    return _process(element, codec);
  }

  String _process(Element element, String codec) {
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
      if (m.isStatic && m.displayName.startsWith(codec)) {
        final mName = m.displayName;
        methods[mName.substring(codec.length)] = '$name.$mName';

        if (m.isAbstract) {
          classBuf.write(_processMethod(m));
          schemaBuf.write(_processSchema(m));
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
class $name extends _$name {
  factory $name() => instance;

  const $name._(): super._();

  static const instance = $name._();
$classBuf
}

$methodMapperBuf
''';
  }

  String _processMethod(MethodElement method) {
    final buf = StringBuffer();

    final name = method.displayName;
    final isEnum = method.returnType.isDartCoreEnum;

    if (!isEnum) {
      throw Exception('Encountered non-enum method in codec');
    }

    final element = method.returnType.element;
    if (element is! EnumElement) {
      throw Exception('Encountered non-enum method in codec');
    }

    buf.writeln();

    return buf.toString();
  }

  String _processSchema(MethodElement method) {
    final buf = StringBuffer();
    final name = method.displayName;
    return buf.toString();
  }
}
