class MainAxisAlignmentSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/main_axis_alignment';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'MainAxisAlignment',
    'type': 'string',
    'enum': [
      'center',
      'end',
      'spaceAround',
      'spaceBetween',
      'spaceEvenly',
      'start',
    ],
  };
}
