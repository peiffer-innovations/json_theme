class TextThemeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/text_theme';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TextTheme',
    'type': 'object',
    'properties': {
      'bodyText1': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'bodyText2': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'button': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'caption': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'headline1': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'headline2': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'headline3': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'headline4': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'headline5': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'headline6': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'overline': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'subtitle1': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'subtitle2': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
    },
  };
}
