class IconDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/icon_data';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'IconData',
    'type': 'object',
    'required': [
      'codePoint',
      'fontFamily',
    ],
    'properties': {
      'codePoint': {
        'type': 'number',
      },
      'fontFamily': {
        'type': 'string',
      },
      'fontPackage': {
        'type': 'string',
      },
      'matchTextDirection': {
        'type': 'boolean',
      },
    },
  };
}
