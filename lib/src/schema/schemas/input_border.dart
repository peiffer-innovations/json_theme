class InputBorderSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/input_border';

  static const schemas = {
    '$id#circular': {
      r'$schema': 'http://json-schema.org/draft-06/schema#',
      r'$id': '$id#circular',
      'title': 'InputBorder',
      'type': 'object',
      'required': [
        'radius',
        'type',
      ],
      'properties': {
        'borderRadius': {
          r'$ref':
              'https://peifferinnovations.com/json_theme/schemas/border_radius',
        },
        'borderSide': {
          r'$ref':
              'https://peifferinnovations.com/json_theme/schemas/border_side',
        },
        'gapPadding': {'type': 'number'},
        'type': {
          'type': 'string',
          'enum': [
            'outline',
          ],
        },
      },
    },
    '$id#elliptical': {
      r'$schema': 'http://json-schema.org/draft-06/schema#',
      r'$id': '$id#elliptical',
      'title': 'InputBorder',
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
            'underline',
          ],
        },
      },
    },
  };
}
