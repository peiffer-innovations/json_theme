import 'package:json_theme/json_theme_schemas.dart';

class DrawerThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/drawer_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/DrawerThemeData-class.html',
    'title': 'DrawerThemeData',
    'type': 'object',
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'contentTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'endShape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'shadowColor': SchemaHelper.objectSchema(ColorSchema.id),
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'surfaceTintColor': SchemaHelper.objectSchema(ColorSchema.id),
      'titleTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'width': SchemaHelper.numberSchema,
    },
  };
}
