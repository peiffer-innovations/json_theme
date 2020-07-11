class ScrollPhysicsSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/scroll_physics';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'ScrollPhysics',
    'type': 'object',
    'properties': {
      'parent': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/scroll_physics',
      },
      'type': {
        'type': 'string',
        'enum': [
          'always',
          'bouncing',
          'clamping',
          'fixedExtent',
          'never',
          'page',
        ],
      },
    },
  };
}
