class InputDecorationThemeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/input_decoration_theme';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'IconThemeData',
    'type': 'object',
    'properties': {
      'alignLabelWithHint': {
        'type': 'boolean',
      },
      'border': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/input_border',
      },
      'contentPadding': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/edge_insets_geometry',
      },
      'disabledBorder': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/input_border',
      },
      'enabledBorder': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/input_border',
      },
      'errorBorder': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/input_border',
      },
      'errorMaxLines': {
        'type': 'number',
      },
      'errorStyle': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'fillColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'filled': {
        'type': 'boolean',
      },
      'floatingLabelBehavior': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/floating_label_behavior',
      },
      'focusColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'focusedBorder': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/input_border',
      },
      'focusedErrorBorder': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/input_border',
      },
      'helperMaxLines': {
        'type': 'number',
      },
      'helperStyle': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'hintStyle': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'hoverColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'isDense': {
        'type': 'boolean',
      },
      'labelStyle': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'prefixStyle': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
      'suffixStyle': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
    },
  };
}
