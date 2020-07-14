class FlexFitSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/flex_fit';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'FlexFit',
    'enum': [
      'loose',
      'tight',
    ]
  };
}
