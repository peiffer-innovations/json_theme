class FloatingActionButtonThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/floating_action_button_theme_data';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'FloatingActionButtonThemeData',
    'type': 'object',
    'properties': {
      'backgroundColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'disabledElevation': {
        'type': 'number',
      },
      'elevation': {
        'type': 'number',
      },
      'focusColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'focusElevation': {
        'type': 'number',
      },
      'foregroundColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'highlightElevation': {
        'type': 'number',
      },
      'hoverColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'hoverElevation': {
        'type': 'number',
      },
      'shape': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/shape_border',
      },
      'splashColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
    },
  };
}
