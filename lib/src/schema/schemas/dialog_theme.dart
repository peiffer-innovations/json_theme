class DialogThemeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/dialog_theme';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'DialogTheme',
    'type': 'object',
    'properties': {
      'backgroundColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'contentTextStyle': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'elevation': {
        'type': 'number',
      },
      'shape': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/shape_border',
      },
      'titleTextStyle': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
    },
  };
}
