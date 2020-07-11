class BrightnessSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/brightness';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'Brightness',
    'enum': [
      'dark',
      'light',
    ]
  };
}
