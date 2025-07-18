import 'package:json_theme/json_theme_schemas.dart';

class RangeSliderThumbShapeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/range_slider_thumb_shape.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/RangeSliderThumbShape-class.html',
    'title': 'RangeSliderThumbShape',
    'type': 'object',
    'properties': {
      'disabledThumbRadius': SchemaHelper.numberSchema,
      'elevation': SchemaHelper.numberSchema,
      'enabledThumbRadius': SchemaHelper.numberSchema,
      'pressedElevation': SchemaHelper.numberSchema,
      'type': {
        'type': 'string',
        'enum': ['round'],
      },
    },
  };
}
