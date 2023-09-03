import 'package:json_theme/json_theme_schemas.dart';

class BottomNavigationBarThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/bottom_navigation_bar_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/BottomNavigationBarThemeData-class.html',
    'type': 'object',
    'title': 'BottomNavigationBarThemeDataSchema',
    'additionalProperties': false,
    'properties': {
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'mouseCursor': SchemaHelper.objectSchema(
        MaterialStatePropertyMouseCursorSchema.id,
      ),
      'selectedIconTheme': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'selectedItemColor': SchemaHelper.objectSchema(ColorSchema.id),
      'selectedLabelStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'showSelectedLabels': SchemaHelper.boolSchema,
      'showUnselectedLabels': SchemaHelper.boolSchema,
      'type': SchemaHelper.objectSchema(BottomNavigationBarTypeSchema.id),
      'unselectedIconTheme': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'unselectedItemColor': SchemaHelper.objectSchema(ColorSchema.id),
      'unselectedLabelStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
    },
  };
}
