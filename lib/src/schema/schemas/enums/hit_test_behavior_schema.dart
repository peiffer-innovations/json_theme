class HitTestBehaviorSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/hit_test_behavior';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'HitTestBehavior',
    'enum': [
      'deferToChild',
      'opaque',
      'translucent',
    ]
  };
}
