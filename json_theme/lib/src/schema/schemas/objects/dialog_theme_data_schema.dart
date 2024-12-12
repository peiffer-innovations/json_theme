import 'package:json_theme/json_theme_schemas.dart';

class DialogThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/dialog_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/DialogThemeData-class.html',
    'title': 'DialogThemeData',
    'type': 'object',
    'properties': {
      'actionsPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'barrierColor': SchemaHelper.objectSchema(ColorSchema.id),
      'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
      'contentTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'iconCoor': SchemaHelper.objectSchema(ColorSchema.id),
      'shadowColor': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'surfaceTintColor': SchemaHelper.objectSchema(ColorSchema.id),
      'titleTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
    },
  };
}
