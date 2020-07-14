class ClipSchema {
  static const id = 'https://peifferinnovations.com/json_theme/schemas/clip';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'Clip',
    'enum': [
      'antiAlias',
      'antiAliasWithSaveLayer',
      'hardEdge',
      'none',
    ]
  };
}
