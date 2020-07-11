class ColorSchemeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/color_scheme';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'ColorScheme',
    'type': 'object',
    'properties': {
      'background': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'brightness': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/brightness',
      },
      'error': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'onBackground': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'onError': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'onPrimary': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'onSecondary': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'onSurface': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'primary': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'primaryVariant': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'secondary': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'secondaryVariant': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'surface': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
    },
  };
}
