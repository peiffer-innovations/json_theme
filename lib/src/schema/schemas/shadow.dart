class ShadowSchema {
  static const id = 'https://peifferinnovations.com/json_theme/schemas/shadow';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'Shadow',
    'type': 'object',
    'required': [
      'color',
    ],
    'properties': {
      'blurRadius': {
        'type': 'number',
      },
      'color': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'offset': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/offset',
      },
    },
  };
}
