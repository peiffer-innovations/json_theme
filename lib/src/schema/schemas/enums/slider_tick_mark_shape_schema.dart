import 'package:json_theme/json_theme_schemas.dart';

class SliderTickMarkShapeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/slider_tick_mark_shape.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'SliderTickMarkShape',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'noTickMark',
    ]),
  };
}
