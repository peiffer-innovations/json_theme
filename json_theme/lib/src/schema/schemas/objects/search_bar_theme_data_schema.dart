import 'package:json_theme/json_theme_schemas.dart';

class SearchBarThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/search_bar_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/SearchBarThemeData-class.html',
    'title': 'SearchBarThemeData',
    'additionalProperties': false,
    'properties': {
      'backgroundColor': SchemaHelper.objectSchema(
        WidgetStatePropertyColorSchema.id,
      ),
      'constraints': SchemaHelper.objectSchema(BoxConstraintsSchema.id),
      'elevation': SchemaHelper.objectSchema(
        WidgetStatePropertyDoubleSchema.id,
      ),
      'hintStyle': SchemaHelper.objectSchema(
        WidgetStatePropertyTextStyleSchema.id,
      ),
      'overlayColor': SchemaHelper.objectSchema(
        WidgetStatePropertyColorSchema.id,
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
      'textCapitalization': SchemaHelper.objectSchema(
        TextCapitalizationSchema.id,
      ),
      'textStyle': SchemaHelper.objectSchema(
        WidgetStatePropertyTextStyleSchema.id,
      ),
    },
  };
}
