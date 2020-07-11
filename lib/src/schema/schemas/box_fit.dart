class BoxFitSchema {
  static const id = 'https://peifferinnovations.com/json_theme/schemas/box_fit';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'BoxFit',
    'enum': [
      'contain',
      'cover',
      'fill',
      'fitHeight',
      'fitWidth',
      'none',
      'scaleDown',
    ]
  };
}
