import 'package:json_theme/json_theme_schemas.dart';

class SliderTickMarkShapeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/slider_tick_mark_shape';

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
