import 'package:json_theme/json_theme_schemas.dart';

class GradientSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/gradient.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment': 'https://api.flutter.dev/flutter/painting/Gradient-class.html',
    'title': 'Gradient',
    'type': 'object',
    'oneOf': [
      {
        'required': ['type'],
        'properties': {
          'begin': SchemaHelper.objectSchema(AlignmentSchema.id),
          'colors': SchemaHelper.arraySchema(ColorSchema.id),
          'end': SchemaHelper.objectSchema(AlignmentSchema.id),
          'stops': {'type': 'array', 'items': SchemaHelper.numberSchema},
          'tileMode': SchemaHelper.objectSchema(TileModeSchema.id),
          'transform': SchemaHelper.objectSchema(GradientTransformSchema.id),
          'type': {
            'type': 'string',
            'enum': ['linear'],
          },
        },
      },
      {
        'required': ['type'],
        'properties': {
          'center': SchemaHelper.objectSchema(AlignmentSchema.id),
          'colors': SchemaHelper.arraySchema(ColorSchema.id),
          'focal': SchemaHelper.objectSchema(AlignmentSchema.id),
          'focalRadius': SchemaHelper.numberSchema,
          'radius': SchemaHelper.numberSchema,
          'stops': {'type': 'array', 'items': SchemaHelper.numberSchema},
          'tileMode': SchemaHelper.objectSchema(TileModeSchema.id),
          'transform': SchemaHelper.objectSchema(GradientTransformSchema.id),
          'type': {
            'type': 'string',
            'enum': ['radial'],
          },
        },
      },
      {
        'required': ['type'],
        'properties': {
          'center': SchemaHelper.objectSchema(AlignmentSchema.id),
          'colors': SchemaHelper.arraySchema(ColorSchema.id),
          'endAngle': SchemaHelper.numberSchema,
          'startAngle': SchemaHelper.numberSchema,
          'stops': {'type': 'array', 'items': SchemaHelper.numberSchema},
          'tileMode': SchemaHelper.objectSchema(TileModeSchema.id),
          'transform': SchemaHelper.objectSchema(GradientTransformSchema.id),
          'type': {
            'type': 'string',
            'enum': ['sweep'],
          },
        },
      },
    ],
  };
}
