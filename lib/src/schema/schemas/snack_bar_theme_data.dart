class SnackBarThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/snack_bar_theme_data';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'SnackBarThemeData',
    'type': 'object',
    'properties': {
      'actionTextColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'backgroundColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'behavior': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/snack_bar_behavior',
      },
      'contentTextStyle': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'disabledActionTextColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'elevation': {
        'type': 'number',
      },
      'shape': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/shape_border',
      },
    },
  };
}
