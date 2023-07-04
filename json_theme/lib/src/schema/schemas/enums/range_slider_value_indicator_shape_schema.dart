import 'package:json_theme/json_theme_schemas.dart';

class RangeSliderValueIndicatorShapeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/range_slider_value_indicator_shape.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/RangeSliderValueIndicatorShape-class.html',
    'title': 'RangeSliderValueIndicatorShape',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'paddle',
      'rectangular',
    ]),
  };
}
