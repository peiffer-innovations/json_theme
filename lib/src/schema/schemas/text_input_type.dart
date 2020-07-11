class TextInputTypeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/text_input_type';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TextInputType',
    'type': 'string',
    'enum': [
      'datetime',
      'emailAddress',
      'multiline',
      'number',
      'phone',
      'text',
      'url',
      'visiblePassword',
    ],
  };
}
