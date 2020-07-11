class FontFeatureSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/font_feature';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'FontFeature',
    'type': 'object',
    'properties': {
      'feature': {
        'type': 'string',
      },
      'value': {
        'type': 'number',
      },
    },
  };
}
