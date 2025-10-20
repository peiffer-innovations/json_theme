import 'package:meta/meta_meta.dart';

@Target({TargetKind.classType})
class JsonThemeCodec {
  const JsonThemeCodec(this.mode, {this.baseSchemaUrl = 'json_theme://schema'});

  final String baseSchemaUrl;
  final CodecMode mode;
}

@Target({TargetKind.method})
class CodecIgnore {
  const CodecIgnore(this.name);

  final String name;
}

@Target({TargetKind.method})
class CodecUnencodable {
  const CodecUnencodable(this.name);

  final String name;
}

enum CodecMode { decode, encode }
