class FloatingActionButtonLocationSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/floating_action_button_location';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'FloatingActionButtonLocation',
    'enum': [
      'centerDocked',
      'centerFloat',
      'endDocked',
      'endFloat',
      'endTop',
      'miniStartTop',
      'startTop',
    ]
  };
}
