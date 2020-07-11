class GradientSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/gradient';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'Gradient',
    'type': 'object',
    'oneOf': [
      {
        'required': [
          'type',
        ],
        'properties': {
          'begin': {
            r'$ref':
                'https://peifferinnovations.com/json_theme/schemas/alignment',
          },
          'colors': {
            'type': 'array',
            'items': {
              r'$ref':
                  'https://peifferinnovations.com/json_theme/schemas/color',
            },
          },
          'end': {
            r'$ref':
                'https://peifferinnovations.com/json_theme/schemas/alignment',
          },
          'stops': {
            'type': 'array',
            'items': {'type': 'number'}
          },
          'tileMode': {
            r'$ref':
                'https://peifferinnovations.com/json_theme/schemas/tile_mode',
          },
          'transform': {
            r'$ref':
                'https://peifferinnovations.com/json_theme/schemas/gradient_transform',
          },
          'type': {
            'type': 'string',
            'enum': [
              'linear',
            ],
          },
        },
      },
      {
        'required': [
          'type',
        ],
        'properties': {
          'center': {
            r'$ref':
                'https://peifferinnovations.com/json_theme/schemas/alignment',
          },
          'colors': {
            'type': 'array',
            'items': {
              r'$ref':
                  'https://peifferinnovations.com/json_theme/schemas/color',
            },
          },
          'focal': {
            r'$ref':
                'https://peifferinnovations.com/json_theme/schemas/alignment',
          },
          'focalRadius': {
            'type': 'number',
          },
          'radius': {
            'type': 'number',
          },
          'stops': {
            'type': 'array',
            'items': {'type': 'number'}
          },
          'tileMode': {
            r'$ref':
                'https://peifferinnovations.com/json_theme/schemas/tile_mode',
          },
          'transform': {
            r'$ref':
                'https://peifferinnovations.com/json_theme/schemas/gradient_transform',
          },
          'type': {
            'type': 'string',
            'enum': [
              'radial',
            ]
          },
        },
      },
      {
        'required': [
          'type',
        ],
        'properties': {
          'center': {
            r'$ref':
                'https://peifferinnovations.com/json_theme/schemas/alignment',
          },
          'colors': {
            'type': 'array',
            'items': {
              r'$ref':
                  'https://peifferinnovations.com/json_theme/schemas/color',
            },
          },
          'endAngle': {
            'type': 'number',
          },
          'startAngle': {
            'type': 'number',
          },
          'stops': {
            'type': 'array',
            'items': {'type': 'number'}
          },
          'tileMode': {
            r'$ref':
                'https://peifferinnovations.com/json_theme/schemas/tile_mode',
          },
          'transform': {
            r'$ref':
                'https://peifferinnovations.com/json_theme/schemas/gradient_transform',
          },
          'type': {
            'type': 'string',
            'enum': [
              'sweep',
            ]
          },
        },
      },
    ],
  };
}
