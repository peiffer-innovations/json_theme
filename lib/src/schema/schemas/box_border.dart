class BoxBorderSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/box_border';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'BoxConstraints',
    'additionalProperties': false,
    'properties': {
      'bottom': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/border_side',
      },
      'left': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/border_side',
      },
      'right': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/border_side',
      },
      'top': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/border_side',
      },
    },
  };
}
