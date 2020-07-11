class RectSchema {
  static const id = 'https://peifferinnovations.com/json_theme/schemas/rect';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'Rect',
    'type': 'object',
    'oneOf': [
      {
        'required': [
          'center',
          'height',
          'width',
          'type',
        ],
        'properties': {
          'center': {
            'type': 'object',
            'required': [
              'dx',
              'dy',
            ],
            'additionaProperties': false,
            'properties': {
              'dx': {
                'type': 'number',
              },
              'dy': {
                'type': 'number',
              },
            },
          },
          'height': {
            'type': 'number',
          },
          'width': {
            'type': 'number',
          },
          'type': {
            'type': 'string',
            'enum': [
              'center',
            ],
          },
        },
      },
      {
        'required': [
          'center',
          'radius',
          'type',
        ],
        'properties': {
          'center': {
            'type': 'object',
            'additionalProperties': false,
            'required': [
              'dx',
              'dy',
            ],
            'properties': {
              'dx': {
                'type': 'number',
              },
              'dy': {
                'type': 'number',
              },
            },
          },
          'type': {
            'type': 'string',
            'enum': [
              'circle',
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
              'largest',
            ],
          },
        },
      },
      {
        'required': [
          'bottom',
          'left',
          'right',
          'top',
          'type',
        ],
        'properties': {
          'bottom': {
            'type': 'number',
          },
          'left': {
            'type': 'number',
          },
          'right': {
            'type': 'number',
          },
          'top': {
            'type': 'number',
          },
          'type': {
            'type': 'string',
            'enum': [
              'ltrb',
            ],
          },
        },
      },
      {
        'required': [
          'height',
          'left',
          'top',
          'width',
          'type',
        ],
        'properties': {
          'height': {
            'type': 'number',
          },
          'left': {
            'type': 'number',
          },
          'top': {
            'type': 'number',
          },
          'width': {
            'type': 'number',
          },
          'type': {
            'type': 'string',
            'enum': [
              'ltwh',
            ],
          },
        },
      },
      {
        'required': ['a', 'b', 'type'],
        'properties': {
          'a': {
            'type': 'object',
            'additionalProperties': false,
            'required': [
              'dx',
              'dy',
            ],
            'properties': {
              'dx': {
                'type': 'number',
              },
              'dy': {
                'type': 'number',
              },
            },
          },
          'b': {
            'type': 'object',
            'additionalProperties': false,
            'required': [
              'dx',
              'dy',
            ],
            'properties': {
              'dx': {
                'type': 'number',
              },
              'dy': {
                'type': 'number',
              },
            },
          },
          'type': {
            'type': 'string',
            'enum': [
              'points',
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
      },
    ],
  };
}
