class ToolbarOptionsSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/toolbar_options';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'ToolbarOptions',
    'type': 'object',
    'properties': {
      'copy': {
        'type': 'boolean',
      },
      'cut': {
        'type': 'boolean',
      },
      'paste': {
        'type': 'boolean',
      },
      'selectAll': {
        'type': 'boolean',
      },
    },
  };
}
