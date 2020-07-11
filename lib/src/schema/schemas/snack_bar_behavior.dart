class SnackBarBehaviorSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/snack_bar_behavior';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'SnackBarBehavior',
    'type': 'string',
    'enum': [
      'fixed',
      'floating',
    ],
  };
}
