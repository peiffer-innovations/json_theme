import 'package:json_theme/json_theme_schemas.dart';

class RectSchema {
  static const id = 'https://peifferinnovations.com/json_theme/schemas/rect';

  static final schema = {
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
              'dx': SchemaHelper.numberSchema,
              'dy': SchemaHelper.numberSchema,
            },
          },
          'height': SchemaHelper.numberSchema,
          'width': SchemaHelper.numberSchema,
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
              'dx': SchemaHelper.numberSchema,
              'dy': SchemaHelper.numberSchema,
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
          'bottom': SchemaHelper.numberSchema,
          'left': SchemaHelper.numberSchema,
          'right': SchemaHelper.numberSchema,
          'top': SchemaHelper.numberSchema,
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
          'height': SchemaHelper.numberSchema,
          'left': SchemaHelper.numberSchema,
          'top': SchemaHelper.numberSchema,
          'width': SchemaHelper.numberSchema,
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
              'dx': SchemaHelper.numberSchema,
              'dy': SchemaHelper.numberSchema,
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
              'dx': SchemaHelper.numberSchema,
              'dy': SchemaHelper.numberSchema,
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
