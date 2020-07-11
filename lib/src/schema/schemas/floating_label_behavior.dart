class FloatingLabelBehaviorSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/floating_label_behavior';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'FloatingLabelBehavior',
    'enum': [
      'always',
      'auto',
      'never',
    ]
  };
}
