import 'package:json_theme/json_theme_schemas.dart';

class ColorFilterSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/color_filter.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/ColorFiltered-class.html',
    'title': 'ColorFilter',
    'oneOf': [
      {
        'type': 'string',
      },
      {
        'type': 'object',
        'oneOf': [
          {
            'required': [
              'type',
            ],
            'properties': {
              'type': {
                'type': 'string',
                'enum': [
                  'linearToSrgbGamma',
                  'srgbToLinearGamma',
                ]
              },
            },
          },
          {
            'required': [
              'matrix',
              'type',
            ],
            'properties': {
              'matrix': {
                'oneOf': [
                  {'type': 'string'},
                  {
                    'type': 'array',
                    'items': SchemaHelper.numberSchema,
                  },
                ],
              },
              'mode': SchemaHelper.objectSchema(BlendModeSchema.id),
              'type': {
                'type': 'string',
                'enum': [
                  'matrix',
                ]
              },
            },
          },
          {
            'required': [
              'color',
              'mode',
              'type',
            ],
            'properties': {
              'color': SchemaHelper.objectSchema(ColorSchema.id),
              'mode': SchemaHelper.objectSchema(BlendModeSchema.id),
              'type': {
                'type': 'string',
                'enum': [
                  'mode',
                ]
              },
            },
          },
        ],
      },
    ],
  };
}
