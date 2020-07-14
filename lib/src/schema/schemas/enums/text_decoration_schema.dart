class TextDecorationSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/text_decoration';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TextDecoration',
    'type': 'string',
    'enum': [
      'lineThrough',
      'none',
      'overline',
      'underline',
    ],
  };
}
