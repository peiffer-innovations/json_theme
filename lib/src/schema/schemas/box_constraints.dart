class BoxConstraintsSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/box_constraints';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'BoxConstraints',
    'additionalProperties': false,
    'properties': {
      'maxHeight': {
        'type': 'number',
      },
      'maxWidth': {
        'type': 'number',
      },
      'minHeight': {
        'type': 'number',
      },
      'minWidth': {
        'type': 'number',
      },
    },
  };
}
