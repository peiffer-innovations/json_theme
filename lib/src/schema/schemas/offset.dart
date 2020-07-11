class OffsetSchema {
  static const id = 'https://peifferinnovations.com/json_theme/schemas/offset';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'Offset',
    'type': 'object',
    'required': [
      'dx',
      'dy',
    ],
    'properties': {
      'dx': {
        'type': 'number',
      },
      'dy': {
        'type': 'number',
      },
    },
  };
}
