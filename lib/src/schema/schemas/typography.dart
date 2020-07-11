class TypographySchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/typography';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'Typography',
    'type': 'object',
    'properties': {
      'black': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_theme',
      },
      'dense': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_theme',
      },
      'englishLike': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_theme',
      },
      'platform': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_theme',
      },
      'tall': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_theme',
      },
      'white': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_theme',
      },
    },
  };
}
