class NavigationRailThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/navigation_rail_theme_data';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'NavigationRailThemeDataSchema',
    'type': 'object',
    'properties': {
      'backgroundColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'elevation': {
        'type': 'number',
      },
      'groupAlignment': {
        'type': 'number',
      },
      'labelType': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/navigation_rail_label_type',
      },
      'selectedIconTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/icon_theme_data',
      },
      'selectedLabelTextStyle': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'unselectedIconTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/icon_theme_data',
      },
      'unselectedLabelTextStyle': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
    },
  };
}
