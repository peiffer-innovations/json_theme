import 'package:json_theme/json_theme_schemas.dart';

class BottomNavigationBarTypeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/bottom_navigation_bar_type.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/BottomNavigationBarType-class.html',
    'type': 'string',
    'title': 'BottomNavigationBarType',
    'oneOf': SchemaHelper.enumSchema([
      'fixed',
      'shifting',
    ]),
  };
}
