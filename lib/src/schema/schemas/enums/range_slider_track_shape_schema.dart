import 'package:json_theme/json_theme_schemas.dart';

class RangeSliderTrackShapeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/range_slider_track_shape';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'RangeSliderTrackShape',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'rectangular',
      'rounded',
    ]),
  };
}
