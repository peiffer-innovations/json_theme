class BoxShapeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/box_shape';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'BoxShape',
    'enum': [
      'circle',
      'rectangle',
    ]
  };
}
