class NavigationRailLabelTypeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/navigation_rail_label_type';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'NavigationRailLabelType',
    'type': 'string',
    'enum': [
      'all',
      'none',
      'selected',
    ],
  };
}
