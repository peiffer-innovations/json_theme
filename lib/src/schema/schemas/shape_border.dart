class ShapeBorderSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/shape_border';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'ShapeBorder',
    'type': 'object',
    'properties': {
      'borderRadius': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/border_radius',
      },
      'borderSide': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/border_side',
      },
      'type': {
        'type': 'string',
        'enum': [
          'circle',
          'rectangle',
          'rounded',
        ],
      },
    },
  };
}
