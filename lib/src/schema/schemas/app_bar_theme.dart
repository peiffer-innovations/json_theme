class AppBarThemeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/app_bar_theme';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'AppBarTheme',
    'additionalProperties': false,
    'properties': {
      'actionsIconTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/icon_theme_data',
      },
      'brightness': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/brightness',
      },
      'color': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'elevation': {
        'type': 'number',
      },
      'iconTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/icon_theme_data',
      },
      'textTheme': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_theme',
      },
    },
  };
}
