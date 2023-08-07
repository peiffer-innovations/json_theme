import 'package:json_theme/json_theme_schemas.dart';

class MenuThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/menu_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/MenuThemeData-class.html',
    'title': 'MenuThemeData',
    'additionalProperties': false,
    'properties': {
      'style': SchemaHelper.objectSchema(MenuStyleSchema.id),
    },
  };
}
