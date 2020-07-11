class IconThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/icon_theme_data';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'IconThemeData',
    'type': 'object',
    'properties': {
      'color': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'opacity': {
        'type': 'number',
      },
      'size': {
        'type': 'number',
      },
    },
  };
}
