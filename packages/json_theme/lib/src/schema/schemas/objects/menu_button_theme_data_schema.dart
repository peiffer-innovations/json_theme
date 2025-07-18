import 'package:json_theme/json_theme_schemas.dart';

class MenuButtonThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/menu_button_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/MenuButtonThemeData-class.html',
    'title': 'MenuButtonThemeData',
    'additionalProperties': false,
    'properties': {'style': SchemaHelper.objectSchema(ButtonStyleSchema.id)},
  };
}
