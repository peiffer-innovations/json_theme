class FontStyleSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/font_style';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'FontStyle',
    'enum': [
      'italic',
      'normal',
    ]
  };
}
