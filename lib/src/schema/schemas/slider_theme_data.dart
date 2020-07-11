class SliderThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/slider_theme_data';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'SliderThemeDataThemeData',
    'type': 'object',
    'required': [],
    'properties': {
      'activeTickMarkColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'activeTrackColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'disabledActiveTickMarkColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'disabledActiveTrackColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'disabledInactiveTickMarkColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'disabledInactiveTrackColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'disabledThumbColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'inactiveTickMarkColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'inactiveTrackColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'minThumbSeparation': {
        'type': 'number',
      },
      'overlappingShapeStrokeColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'overlayColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'overlayShape': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/slider_component_shape',
      },
      'rangeThumbShape': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/range_slider_thumb_shape',
      },
      'rangeTickMarkShape': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/range_slider_tick_mark_shape',
      },
      'rangeTrackShape': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/range_slider_track_shape',
      },
      'rangeValueIndicatorShape': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/range_slider_value_indicator_shape',
      },
      'showValueIndicator': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/show_value_indicator',
      },
      'thumbColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'thumbShape': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/slider_component_shape',
      },
      'trackHeight': {
        'type': 'number',
      },
      'trackShape': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/slider_track_shape',
      },
      'valueIndicatorColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'valueIndicatorShape': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/slider_component_shape',
      },
      'valueIndicatorTextStyle': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_style',
      },
    },
  };
}
