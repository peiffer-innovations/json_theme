import 'package:json_theme/json_theme_schemas.dart';

class BottomNavigationBarLandscapeLayoutSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/bottom_navigation_bar_landscape_layout.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/BottomNavigationBarLandscapeLayout-class.html',
    'type': 'string',
    'title': 'BottomNavigationBarLandscapeLayout',
    'oneOf': SchemaHelper.enumSchema([
      'centered',
      'linear',
      'spread',
    ]),
  };
}
