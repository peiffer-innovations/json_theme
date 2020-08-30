import 'package:json_theme/json_theme_schemas.dart';

class RangeSliderValueIndicatorShapeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/range_slider_value_indicator_shape';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'RangeSliderValueIndicatorShape',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'paddle',
      'rectangular',
    ]),
  };
}
