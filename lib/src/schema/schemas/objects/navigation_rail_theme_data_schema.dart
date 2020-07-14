import 'package:json_theme/json_theme_schemas.dart';

class NavigationRailThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/navigation_rail_theme_data';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'NavigationRailThemeDataSchema',
    'type': 'object',
    'properties': {
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'groupAlignment': SchemaHelper.numberSchema,
      'labelType': SchemaHelper.objectSchema(NavigationRailLabelTypeSchema.id),
      'selectedIconTheme': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'selectedLabelTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'unselectedIconTheme': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'unselectedLabelTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
    },
  };
}
