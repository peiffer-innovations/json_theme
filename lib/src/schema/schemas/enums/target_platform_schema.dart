import 'package:json_theme/json_theme_schemas.dart';

class TargetPlatformSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/target_platform';

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
