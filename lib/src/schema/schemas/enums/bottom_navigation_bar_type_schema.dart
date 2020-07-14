class BottomNavigationBarTypeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/bottom_navigation_bar_type';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'BottomNavigationBarType',
    'enum': [
      'fixed',
      'shifting',
    ]
  };
}
