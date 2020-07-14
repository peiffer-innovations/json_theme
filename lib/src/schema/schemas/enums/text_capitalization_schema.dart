class TextCapitalizationSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/text_capitalization';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TextCapitalization',
    'type': 'string',
    'enum': [
      'characters',
      'none',
      'sentences',
      'words',
    ],
  };
}
