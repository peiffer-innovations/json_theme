import 'package:json_theme/json_theme_schemas.dart';

class RangeSliderTickMarkShapeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/range_slider_tick_mark_shape.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/RangeSliderTickMarkShape-class.html',
    'title': 'RangeSliderTickMarkShape',
    'type': 'object',
    'properties': {
      'tickMarkRadius': SchemaHelper.numberSchema,
      'type': {
        'type': 'string',
        'enum': [
          'round',
        ]
      },
    },
  };
}
