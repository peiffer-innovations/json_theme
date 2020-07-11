class TextStyleSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/text_style';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TextStyle',
    'type': 'object',
    'properties': {
      'backgroundColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'color': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'decoration': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/text_decoration',
      },
      'decorationColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'decorationStyle': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/text_decoration_style',
      },
      'decorationThickness': {
        'type': 'number',
      },
      'fontFamily': {
        'type': 'string',
      },
      'fontFamilyFallback': {
        'type': 'array',
        'items': {
          'type': 'string',
        },
      },
      'fontFeatures': {
        'type': 'array',
        'items': {
          r'$ref':
              'https://peifferinnovations.com/json_theme/schemas/font_feature',
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
      'height': {
        'type': 'number',
      },
      'inherit': {
        'type': 'boolean',
      },
      'letterSpacking': {
        'type': 'number',
      },
      'locale': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/locale',
      },
      'package': {
        'type': 'string',
      },
      'shadows': {
        'type': 'array',
        'items': {
          r'$ref': 'https://peifferinnovations.com/json_theme/schemas/shadow',
        },
      },
      'textBaseline': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/text_baseline',
      },
      'wordSpacing': {
        'type': 'number',
      },
    },
  };
}
