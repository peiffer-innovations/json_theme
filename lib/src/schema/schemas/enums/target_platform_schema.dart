import 'package:json_theme/json_theme_schemas.dart';

class TargetPlatformSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/target_platform.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TargetPlatform',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'android',
      'fuchsia',
      'iOS',
      'linux',
      'macOS',
      'windows',
    ]),
  };
}
