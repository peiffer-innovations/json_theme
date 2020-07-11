class RadiusSchema {
  static const id = 'https://peifferinnovations.com/json_theme/schemas/radius';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'Radius',
    'type': 'object',
    'oneOf': [
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
          'x',
          'y',
          'type',
        ],
        'properties': {
          'x': {
            'type': 'number',
          },
          'y': {
            'type': 'number',
          },
          'type': {
            'type': 'string',
            'enum': [
              'elliptical',
            ],
          },
        },
      },
      {
        'required': [
          'type',
        ],
        'properties': {
          'type': {
            'type': 'string',
            'enum': [
              'zero',
            ],
          },
        },
      }
    ],
  };
}
