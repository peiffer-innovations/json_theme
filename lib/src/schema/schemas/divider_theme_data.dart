class DividerThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/divider_theme_data';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'DividerThemeData',
    'type': 'object',
    'properties': {
      'color': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'endIndent': {
        'type': 'number',
      },
      'indent': {
        'type': 'number',
      },
      'space': {
        'type': 'number',
      },
      'thickness': {
        'type': 'number',
      },
    },
  };
}
