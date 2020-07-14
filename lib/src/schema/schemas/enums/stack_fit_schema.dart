class StackFitSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/stack_fit';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'StackFit',
    'type': 'string',
    'enum': [
      'expand',
      'loose',
      'passthrough',
    ],
  };
}
