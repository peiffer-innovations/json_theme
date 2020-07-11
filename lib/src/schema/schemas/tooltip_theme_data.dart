class TooltipThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/tooltip_theme_data';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TooltipThemeData',
    'type': 'object',
    'properties': {
      'excludeFromSemantics': {
        'type': 'boolean',
      },
      'height': {
        'type': 'number',
      },
      'margin': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/edge_insets_geometry'
      },
      'padding': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/edge_insets_geometry'
      },
      'preferBelow': {
        'type': 'boolean',
      },
      'showDuration': {
        'type': 'number',
      },
      'verticalOffset': {
        'type': 'number',
      },
      'waitDuration': {
        'type': 'number',
      },
    },
  };
}
