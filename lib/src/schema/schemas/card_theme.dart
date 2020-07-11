class CardThemeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/card_theme';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'CardTheme',
    'type': 'object',
    'properties': {
      'clipBehavior': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/clip',
      },
      'color': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'elevation': {
        'type': 'number',
      },
      'margin': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/edge_insets_geometry',
      },
      'shadowColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'shape': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/shape_border',
      },
    },
  };
}
