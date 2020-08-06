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
      'centerTop',
      'endDocked',
      'endFloat',
      'endTop',
      'miniCenterDocked',
      'miniCenterFloat',
      'miniCenterTop',
      'miniEndDocked',
      'miniEndFloat',
      'miniEndTop',
      'miniStartDocked',
      'miniStartFloat',
      'miniStartTop',
      'startDocked',
      'startFloat',
      'startTop',
    ]
  };
}
