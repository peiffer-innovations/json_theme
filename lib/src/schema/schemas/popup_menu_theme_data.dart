class PopupMenuThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/popup_menu_theme_data';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'PopupMenuThemeDataSchema',
    'type': 'object',
    'properties': {
      'color': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'elevation': {
        'type': 'number',
      },
      'shape': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/shape_border',
      },
      'textStyle': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
    },
  };
}
