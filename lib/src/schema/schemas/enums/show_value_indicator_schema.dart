class ShowValueIndicatorSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/show_value_indicator';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'ShowValueIndicator',
    'enum': [
      'always',
      'never',
      'onlyForContinuous',
      'onlyForDiscrete',
    ]
  };
}
