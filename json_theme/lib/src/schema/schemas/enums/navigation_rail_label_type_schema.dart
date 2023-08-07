import 'package:json_theme/json_theme_schemas.dart';

class NavigationRailLabelTypeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/navigation_rail_label_type.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/NavigationRailLabelType-class.html',
    'title': 'NavigationRailLabelType',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'all',
      'none',
      'selected',
    ]),
  };
}
