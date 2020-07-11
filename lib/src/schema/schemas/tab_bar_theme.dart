class TabBarThemeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/tab_bar_theme';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TabBarTheme',
    'type': 'object',
    'properties': {
      'indicatorSize': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/tab_bar_indicator_size',
      },
      'labelPadding': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/edge_insets_geometry',
      },
      'labelColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'labelStyle': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'unselectedLabelColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'unselectedLabelStyle': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
    },
  };
}
