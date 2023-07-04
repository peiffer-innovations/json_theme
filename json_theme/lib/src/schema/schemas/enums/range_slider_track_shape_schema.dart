import 'package:json_theme/json_theme_schemas.dart';

class RangeSliderTrackShapeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/range_slider_track_shape.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/RangeSliderTrackShape-class.html',
    'title': 'RangeSliderTrackShape',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'rectangular',
      'rounded',
    ]),
  };
}
