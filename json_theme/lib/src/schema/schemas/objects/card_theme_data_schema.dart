import 'package:json_theme/json_theme_schemas.dart';

class CardThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/card_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/CardThemeData-class.html',
    'title': 'CardTheme',
    'type': 'object',
    'properties': {
      'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'margin': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'shadowColor': SchemaHelper.objectSchema(ColorSchema.id),
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'surfaceTintColor': SchemaHelper.objectSchema(ColorSchema.id),
    },
  };
}
