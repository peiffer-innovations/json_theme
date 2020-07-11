class TargetPlatformSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/target_platform';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TargetPlatform',
    'type': 'string',
    'enum': [
      'android',
      'fuchsia',
      'iOS',
      'linux',
      'macOS',
      'windows',
    ],
  };
}
