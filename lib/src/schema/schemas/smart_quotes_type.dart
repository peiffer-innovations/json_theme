class SmartQuotesTypeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/smart_quotes_type';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'SmartQuotesType',
    'type': 'string',
    'enum': [
      'disabled',
      'enabled',
    ],
  };
}
