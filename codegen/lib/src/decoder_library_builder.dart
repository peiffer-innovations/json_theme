// ignore_for_file: avoid_print

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:json_theme_annotation/json_theme_annotation.dart';
import 'package:source_gen/source_gen.dart';

class DecoderLibraryBuilder extends GeneratorForAnnotation<JsonThemeDecoder> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    const kDecode = 'decode';
    final name = element.name;
    if (name == null) {
      throw Exception(
        'Annotation found on unnamed location, cannot continue.',
      );
    }

    if (element is! ClassElement) {
      throw Exception('Annotation found but is ');
    }
    final methods = <String, String>{};
    for (var m in element.methods) {
      if (m.isStatic && m.name.startsWith(kDecode)) {
        final mName = m.name;
        methods[mName.substring(kDecode.length)] = '$name.$mName';
        print(mName);
      }
    }

    final buf = StringBuffer();

    buf.write('''
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
      buf.write("  '$key': '${entry.value}',\n");
    }

    buf.write('};');

    return buf.toString();
  }
}
