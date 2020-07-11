class BottomSheetThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/bottom_sheet_theme_data';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'BottomSheetThemeData',
    'additionalProperties': false,
    'properties': {
      'backgroundColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'clipBehavior': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/clip',
      },
      'elevation': {
        r'$id': '#/properties/elevation',
        'type': 'number',
      },
      'modalBackgroundColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'modalElevation': {
        r'$id': '#/properties/elevation',
        'type': 'number',
      },
      'shape': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/shape_border',
      },
    },
  };
}
