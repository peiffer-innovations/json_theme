class MaterialColorSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/material_color';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'MaterialColor',
    'type': 'object',
    'required': [
      'primary',
      'swatches',
    ],
    'properties': {
      'primary': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'swatches': {
        'type': 'object',
        'properties': {
          '50': {
            r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
          },
          '100': {
            r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
          },
          '200': {
            r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
          },
          '300': {
            r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
          },
          '400': {
            r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
          },
          '500': {
            r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
          },
          '600': {
            r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
          },
          '700': {
            r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
          },
          '800': {
            r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
          },
          '900': {
            r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
          },
        },
      },
      'leadingPadding': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/edge_insets_geometry',
      },
      'padding': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/edge_insets_geometry',
      },
    },
  };
}
