class TextAlignSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/text_align';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TextAlign',
    'type': 'string',
    'enum': [
      'center',
      'end',
      'justify',
      'left',
      'right',
      'start',
    ],
  };
}
