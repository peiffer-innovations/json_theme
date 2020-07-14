import 'package:json_theme/json_theme_schemas.dart';

class RangeSliderTickMarkShapeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/range_slider_tick_mark_shape';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
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
