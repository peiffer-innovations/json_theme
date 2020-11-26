import 'package:json_theme/json_theme_schemas.dart';

class BottomNavigationBarThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/bottom_navigation_bar_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'BottomNavigationBarThemeDataSchema',
    'additionalProperties': false,
    'properties': {
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'selectedIconTheme': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'selectedIconColor': SchemaHelper.objectSchema(ColorSchema.id),
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
