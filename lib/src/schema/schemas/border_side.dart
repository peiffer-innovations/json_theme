class BorderSideSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/border_side';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'BorderSideSchema',
    'additionalProperties': false,
    'properties': {
      'color': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'style': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/border_style',
      },
      'width': {
        r'$id': '#/properties/width',
        'type': 'number',
      },
    },
  };
}
