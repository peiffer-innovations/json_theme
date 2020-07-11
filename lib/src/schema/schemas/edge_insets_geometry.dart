class EdgeInsetsGeometrySchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/edge_insets_geometry';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'EdgeInsetsGeometry',
    'oneOf': [
      {
        'type': 'string',
      },
      {
        'type': 'number',
      },
      {
        'type': 'array',
        'array': [
          {
            'type': 'number',
          },
        ]
      },
      {
        'type': 'object',
        'properties': {
          'bottom': {
            'type': 'number',
          },
          'left': {
            'type': 'number',
          },
          'right': {
            'type': 'number',
          },
          'top': {
            'type': 'number',
          },
        },
      },
    ],
  };
}
