class ButtonThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/button_theme_data';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'ButtonThemeData',
    'type': 'object',
    'properties': {
      'alignedDropdown': {
        'type': 'boolean',
      },
      'buttonColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'colorScheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/color_scheme',
      },
      'disabledColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'focusColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'height': {
        'type': 'number',
      },
      'hoverColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'layoutBehavior': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/button_bar_layout_behavior',
      },
      'materialTapTargetSize': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/material_tap_target_size',
      },
      'minWidth': {
        'type': 'number',
      },
      'padding': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/edge_insets_geometry',
      },
      'shape': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/shape_border',
      },
      'splashColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'textTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/button_text_theme',
      },
    },
  };
}
