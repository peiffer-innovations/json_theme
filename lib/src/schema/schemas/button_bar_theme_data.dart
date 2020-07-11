class ButtonBarThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/button_bar_theme_data';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'ButtonThemeData',
    'type': 'object',
    'properties': {
      'alignment': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/main_axis_alignment',
      },
      'buttonAlignedDropdown': {
        'type': 'boolean',
      },
      'buttonHeight': {
        'type': 'number',
      },
      'buttonMinWidth': {
        'type': 'number',
      },
      'buttonPadding': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/edge_insets_geometry',
      },
      'buttonTextTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/button_text_theme',
      },
      'layoutBehavior': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/button_bar_layout_behavior',
      },
      'mainAxisSize': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/main_axis_size',
      },
      'overflowDirection': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/vertical_direction',
      },
    },
  };
}
