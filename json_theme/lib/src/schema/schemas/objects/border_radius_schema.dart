import 'package:json_theme/json_theme_schemas.dart';

class BorderRadiusSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/border_radius.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/painting/BorderRadius-class.html',
    'title': 'BorderRadius',
    'oneOf': [
      {'type': 'string'},
      {'type': 'number'},
      {
        'type': 'object',
        'oneOf': [
          {
            'required': ['radius', 'type'],
            'properties': {
              'radius': SchemaHelper.objectSchema(RadiusSchema.id),
              'type': {
                'type': 'string',
                'enum': ['all'],
              },
            },
          },
          {
            'required': ['radius', 'type'],
            'properties': {
              'radius': SchemaHelper.numberSchema,
              'type': {
                'type': 'string',
                'enum': ['circular'],
              },
            },
          },
          {
            'required': ['type'],
            'properties': {
              'left': SchemaHelper.objectSchema(RadiusSchema.id),
              'right': SchemaHelper.objectSchema(RadiusSchema.id),
              'type': {
                'type': 'string',
                'enum': ['horizontal'],
              },
            },
          },
          {
            'required': ['type'],
            'properties': {
              'bottomLeft': SchemaHelper.objectSchema(RadiusSchema.id),
              'bottomRight': SchemaHelper.objectSchema(RadiusSchema.id),
              'topLeft': SchemaHelper.objectSchema(RadiusSchema.id),
              'topRight': SchemaHelper.objectSchema(RadiusSchema.id),
              'type': {
                'type': 'string',
                'enum': ['only'],
              },
            },
          },
          {
            'required': ['type'],
            'properties': {
              'bottom': SchemaHelper.objectSchema(RadiusSchema.id),
              'top': SchemaHelper.objectSchema(RadiusSchema.id),
              'type': {
                'type': 'string',
                'enum': ['vertical'],
              },
            },
          },
        ],
      },
    ],
  };
}
