class SliderTrackShapeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/slider_track_shape';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'SliderTrackShapeSchema',
    'type': 'object',
    'required': [
      'type',
    ],
    'properties': {
      'disabledThumbGapWidth': {
        'type': 'number',
      },
      'type': {
        'type': 'string',
        'enum': [
          'rectangular',
          'rounded',
        ]
      }
    },
  };
}
