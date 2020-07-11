class ChipThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/chip_theme_data';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'ChipThemeData',
    'type': 'object',
    'properties': {
      'backgroundColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'brightness': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/brightness',
      },
      'checkmarkColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'deleteIconColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'disabledColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'elevation': {
        'type': 'number',
      },
      'padding': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/edge_insets_geometry',
      },
      'pressElevation': {
        'type': 'number',
      },
      'secondaryLabelStyle': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'secondaryLabelColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'selectedColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'shape': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/shape_border',
      },
      'selectedShadowColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'shadowColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'showCheckmark': {
        'type': 'boolean',
      },
    },
  };
}
