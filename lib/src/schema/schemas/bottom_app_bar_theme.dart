class BottomAppBarThemeScheme {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/bottom_app_bar_theme';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'BottomAppBarTheme',
    'additionalProperties': false,
    'properties': {
      'color': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'elevation': {
        r'$id': '#/properties/elevation',
        'type': 'number',
      },
      'shape': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/notched_shape',
      },
    },
  };
}
