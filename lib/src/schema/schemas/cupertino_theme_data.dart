class CupertinoThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/cupertino_theme_data';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'CupertinoThemeData',
    'type': 'object',
    'properties': {
      'barBackgroundColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'brightness': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/brightness',
      },
      'primaryColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'primaryContrastingColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'scaffoldBackgroundColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'textTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/cupertino_text_theme_data',
      },
    },
  };
}
