class StrutStyleSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/strut_style';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'StrutStyle',
    'type': 'object',
    'properties': {
      'fontFamily': {
        'type': 'string',
      },
      'fontFamilyFallback': {
        'type': 'array',
        'items': {
          'type': 'string',
        },
      },
      'fontSize': {
        'type': 'number',
      },
      'fontStyle': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/font_style',
      },
      'fontWeight': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/font_weight',
      },
      'forceStrutHeight': {
        'type': 'boolean',
      },
      'height': {
        'type': 'number',
      },
      'leading': {
        'type': 'number',
      },
      'package': {
        'type': 'string',
      },
    },
  };
}
