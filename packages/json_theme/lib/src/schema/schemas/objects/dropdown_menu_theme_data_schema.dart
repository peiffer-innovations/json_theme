import 'package:json_theme/json_theme_schemas.dart';

class DropdownMenuThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/dropdown_menu_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/DropdownMenuThemeData-class.html',
    'title': 'DropdownMenuThemeData',
    'type': 'object',
    'properties': {
      'inputDecorationTheme': SchemaHelper.objectSchema(
        InputDecorationThemeDataSchema.id,
      ),
      'menuStyle': SchemaHelper.objectSchema(MenuStyleSchema.id),
      'textStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
    },
  };
}
