import 'package:json_theme/json_theme_schemas.dart';

class ActionIconThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/action_icon_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/ActionIconThemeData-class.html',
    'type': 'object',
    'title': 'ActionIconThemeData',
    'additionalProperties': false,
    'properties': {
      'backButtonIconBuilder': SchemaHelper.stringSchema,
      'closeButtonIconBuilder': SchemaHelper.stringSchema,
      'drawerButtonIconBuilder': SchemaHelper.stringSchema,
      'endDrawerButtonIconBuilder': SchemaHelper.stringSchema
    },
  };
}
