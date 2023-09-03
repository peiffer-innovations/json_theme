import 'package:json_theme/json_theme_schemas.dart';

class RadiusSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/radius.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment': 'https://api.flutter.dev/flutter/dart-ui/Radius-class.html',
    'title': 'Radius',
    'oneOf': [
      SchemaHelper.numberSchema,
      {
        'type': 'object',
        'additionalProperties': false,
        'required': [
          'radius',
          'type',
        ],
        'properties': {
          'radius': SchemaHelper.numberSchema,
          'type': {
            'type': 'string',
            'enum': [
              'circular',
            ],
          },
        },
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'required': [
          'x',
          'y',
          'type',
        ],
        'properties': {
          'x': SchemaHelper.numberSchema,
          'y': SchemaHelper.numberSchema,
          'type': {
            'type': 'string',
            'enum': [
              'elliptical',
            ],
          },
        },
      },
      {
        'type': 'object',
        'additionalProperties': false,
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
