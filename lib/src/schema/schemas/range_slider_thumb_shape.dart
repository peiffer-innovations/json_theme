class RangeSliderThumbShapeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/range_slider_thumb_shape';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'RangeSliderThumbShape',
    'type': 'object',
    'properties': {
      'disabledThumbRadius': {
        'type': 'number',
      },
      'enabledThumbRadius': {
        'type': 'number',
      },
      'type': {
        'type': 'string',
        'enum': [
          'round',
        ]
      },
    },
  };
}
