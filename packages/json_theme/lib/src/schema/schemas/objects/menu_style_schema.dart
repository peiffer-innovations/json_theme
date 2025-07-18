import 'package:json_theme/json_theme_schemas.dart';

class MenuStyleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/menu_style.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/MenuStyle-class.html',
    'title': 'MenuStyle',
    'additionalProperties': false,
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'backgroundColor': SchemaHelper.objectSchema(
        WidgetStatePropertyColorSchema.id,
      ),
      'elevation': SchemaHelper.objectSchema(
        WidgetStatePropertyDoubleSchema.id,
      ),
      'fixedSize': SchemaHelper.objectSchema(WidgetStatePropertySizeSchema.id),
      'maximumSize': SchemaHelper.objectSchema(
        WidgetStatePropertySizeSchema.id,
      ),
      'minimumSize': SchemaHelper.objectSchema(
        WidgetStatePropertySizeSchema.id,
      ),
      'padding': SchemaHelper.objectSchema(
        WidgetStatePropertyEdgeInsetsGeometrySchema.id,
      ),
      'shadowColor': SchemaHelper.objectSchema(
        WidgetStatePropertyColorSchema.id,
      ),
      'shape': SchemaHelper.objectSchema(
        WidgetStatePropertyOutlinedBorderSchema.id,
      ),
      'side': SchemaHelper.objectSchema(WidgetStatePropertyBorderSideSchema.id),
      'surfaceTintColor': SchemaHelper.objectSchema(
        WidgetStatePropertyColorSchema.id,
      ),
      'visualDensity': SchemaHelper.objectSchema(VisualDensitySchema.id),
    },
  };
}
