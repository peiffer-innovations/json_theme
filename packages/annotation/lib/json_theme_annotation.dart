import 'package:meta/meta_meta.dart';

@Target({TargetKind.classType})
class JsonThemeCodec {
  const JsonThemeCodec(this.mode, {this.baseSchemaUrl = 'json_theme://schema'});

  final String baseSchemaUrl;
  final CodecMode mode;
}

@Target({TargetKind.method})
class CodecDefaultValue {
  const CodecDefaultValue(this.name, this.value);

  final String name;
  final String value;
}

@Target({TargetKind.method})
class CodecEnum {
  const CodecEnum();
}

@Target({TargetKind.method})
class CodecParamType {
  const CodecParamType(this.name, this.type, {this.nullable = false});

  final String name;
  final bool nullable;
  final Type type;
}

@Target({TargetKind.method})
class CodecIgnore {
  /// Annotaion to instruct the code generator to completely ignore the
  /// parameter with the given name and to not try to ignore or decode it.
  const CodecIgnore(this.name);

  final String name;
}

@Target({TargetKind.method})
class CodecSchema {
  /// Annotaion to instruct the schema to be generated for this method even
  /// though it is not abstract.
  const CodecSchema();
}

@Target({TargetKind.method})
class CodecUnencodable {
  /// Annotaion to instruct the code generator that the named parameter cannot
  /// be encoded and to only attempt to use the value directly rather than
  /// trying to process it string a string.
  const CodecUnencodable(this.name);

  final String name;
}

enum CodecMode { decode, encode }
