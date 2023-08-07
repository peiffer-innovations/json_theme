import 'package:json_theme/json_theme_schemas.dart';

class NavigationDrawerThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/navigation_drawer_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/NavigationDrawerThemeData-class.html',
    'title': 'NavigationDrawerThemeData',
    'type': 'object',
    'properties': {
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'iconTheme': SchemaHelper.objectSchema(
        MaterialStatePropertyIconThemeDataSchema.id,
      ),
      'indicatorColor': SchemaHelper.objectSchema(ColorSchema.id),
      'indicatorShape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'indicatorSize': SchemaHelper.objectSchema(SizeSchema.id),
      'labelTextStyle': SchemaHelper.objectSchema(
        MaterialStatePropertyTextStyleSchema.id,
      ),
      'shadowColor': SchemaHelper.objectSchema(ColorSchema.id),
      'surfaceTintColor': SchemaHelper.objectSchema(ColorSchema.id),
      'tileHeight': SchemaHelper.numberSchema
    },
  };
}
