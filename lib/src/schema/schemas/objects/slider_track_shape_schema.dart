import 'package:json_theme/json_theme_schemas.dart';

class SliderTrackShapeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/slider_track_shape.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/SliderTrackShape-class.html',
    'title': 'SliderTrackShape',
    'type': 'object',
    'required': [
      'type',
    ],
    'properties': {
      'disabledThumbGapWidth': SchemaHelper.numberSchema,
      'type': {
        'type': 'string',
        'enum': [
          'rectangular',
          'rounded',
        ]
      }
    },
  };
}
