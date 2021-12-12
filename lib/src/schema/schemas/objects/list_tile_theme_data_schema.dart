import 'package:json_theme/json_theme_schemas.dart';

class ListTileThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/list_tile_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/ListTileThemeData-class.html',
    'title': 'ListTileThemeData',
    'type': 'object',
    'properties': {
      'contentPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'dense': SchemaHelper.boolSchema,
      'enableFeedback': SchemaHelper.boolSchema,
      'horizontalTitleGap': SchemaHelper.numberSchema,
      'iconColor': SchemaHelper.objectSchema(ColorSchema.id),
      'minLeadingWidth': SchemaHelper.numberSchema,
      'minVerticalPadding': SchemaHelper.numberSchema,
      'selectedColor': SchemaHelper.objectSchema(ColorSchema.id),
      'selectedTileColor': SchemaHelper.objectSchema(ColorSchema.id),
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'style': SchemaHelper.objectSchema(ListTileStyleSchema.id),
      'textColor': SchemaHelper.objectSchema(ColorSchema.id),
      'tileColor': SchemaHelper.objectSchema(ColorSchema.id),
    },
  };
}
