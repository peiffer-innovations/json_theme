class BoxDecorationSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/box_decoration';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'BoxDecoration',
    'additionalProperties': false,
    'properties': {
      'backgroundBlendMode': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/blend_mode',
      },
      'border': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/box_border',
      },
      'borderRadius': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/border_radius',
      },
      'boxShadow': {
        'type': 'array',
        'items': {
          r'$ref':
              'https://peifferinnovations.com/json_theme/schemas/box_shadow',
        },
      },
      'color': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'gradient': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/gradient',
      },
      'shape': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/box_shape',
      },
    },
  };
}
