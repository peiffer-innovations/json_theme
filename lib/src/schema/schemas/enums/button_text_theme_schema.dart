class ButtonTextThemeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/button_text_theme';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'ButtonTextTheme',
    'enum': [
      'accent',
      'normal',
      'primary',
    ]
  };
}
