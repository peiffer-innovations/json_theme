class ToggleButtonsThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/toggle_buttons_theme_data';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'ToggleButtonsThemeData',
    'type': 'object',
    'properties': {
      'borderColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'borderRadius': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/border_radius',
      },
      'borderWidth': {
        'type': 'number',
      },
      'color': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'constraints': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/box_constraints',
      },
      'disabledBorderColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'disabledColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'fillColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'focusColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'highlightColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'hoverColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'selectedBorderColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'selectedColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'splashColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'textStyle': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
    },
  };
}
