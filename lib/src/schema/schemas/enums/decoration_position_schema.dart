class DecorationPositionSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/decoration_position';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'DecorationPosition',
    'enum': [
      'background',
      'foreground',
    ]
  };
}
