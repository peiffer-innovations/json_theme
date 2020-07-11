class BorderRadiusSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/border_radius';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'BorderRadius',
    'oneOf': [
      {
        'type': 'string',
      },
      {
        'type': 'number',
      },
      {
        'type': 'object',
        'oneOf': [
          {
            'required': [
              'radius',
              'type',
            ],
            'properties': {
              'radius': {
                r'$ref':
                    'https://peifferinnovations.com/json_theme/schemas/radius',
              },
              'type': {
                'type': 'string',
                'enum': [
                  'all',
                ]
              },
            },
          },
          {
            'required': [
              'radius',
              'type',
            ],
            'properties': {
              'radius': {
                'type': 'number',
              },
              'type': {
                'type': 'string',
                'enum': [
                  'circular',
                ],
              },
            },
          },
          {
            'required': [
              'type',
            ],
            'properties': {
              'left': {
                r'$ref':
                    'https://peifferinnovations.com/json_theme/schemas/radius',
              },
              'right': {
                r'$ref':
                    'https://peifferinnovations.com/json_theme/schemas/radius',
              },
              'type': {
                'type': 'string',
                'enum': [
                  'horizontal',
                ],
              },
            },
          },
          {
            'required': ['type'],
            'properties': {
              'bottomLeft': {
                r'$ref':
                    'https://peifferinnovations.com/json_theme/schemas/radius',
              },
              'bottomRight': {
                r'$ref':
                    'https://peifferinnovations.com/json_theme/schemas/radius',
              },
              'topLeft': {
                r'$ref':
                    'https://peifferinnovations.com/json_theme/schemas/radius',
              },
              'topRight': {
                r'$ref':
                    'https://peifferinnovations.com/json_theme/schemas/radius',
              },
              'type': {
                'type': 'string',
                'enum': [
                  'only',
                ]
              },
            },
          },
          {
            'required': [
              'type',
            ],
            'properties': {
              'bottom': {
                r'$ref':
                    'https://peifferinnovations.com/json_theme/schemas/radius',
              },
              'top': {
                r'$ref':
                    'https://peifferinnovations.com/json_theme/schemas/radius',
              },
              'type': {
                'type': 'string',
                'enum': [
                  'vertical',
                ]
              },
            },
          },
        ],
      },
    ],
  };
}
