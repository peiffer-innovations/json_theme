class LocaleSchema {
  static const id = 'https://peifferinnovations.com/json_theme/schemas/locale';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'Locale',
    'type': 'object',
    'properties': {
      'countryCode': {
        'type': 'string',
      },
      'languageCode': {
        'type': 'string',
      },
    },
  };
}
