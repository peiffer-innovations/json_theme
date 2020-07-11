class BoxShadowSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/box_shadow';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'BoxShadow',
    'additionalProperties': false,
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
      'spreadRadius': {
        'type': 'number',
      },
    },
  };
}
