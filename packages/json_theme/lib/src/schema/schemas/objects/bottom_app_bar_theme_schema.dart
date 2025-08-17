import 'package:json_theme/json_theme_schemas.dart';

class BottomAppBarThemeDataScheme {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/bottom_app_bar_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/BottomAppBarThemeData-class.html',
    'type': 'object',
    'title': 'BottomAppBarThemeData',
    'additionalProperties': false,
    'properties': {
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'height': SchemaHelper.numberSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'shadowColor': SchemaHelper.objectSchema(ColorSchema.id),
      'shape': SchemaHelper.objectSchema(NotchedShapeSchema.id),
      'surfaceTintColor': SchemaHelper.objectSchema(ColorSchema.id),
    },
  };
}
