import 'package:json_theme/json_theme_schemas.dart';

class ExpansionTileThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/expansion_tile_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/ExpansionTileThemeData-class.html',
    'title': 'ExpansionTileThemeData',
    'type': 'object',
    'properties': {
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'childrenPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'collapsedBackgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'collapsedIconColor': SchemaHelper.objectSchema(ColorSchema.id),
      'collapsedTextColor': SchemaHelper.objectSchema(ColorSchema.id),
      'expandedAlignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'iconColor': SchemaHelper.objectSchema(ColorSchema.id),
      'textColor': SchemaHelper.objectSchema(ColorSchema.id),
      'tilePadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
    },
  };
}
