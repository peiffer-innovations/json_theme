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
        MaterialStatePropertyColorSchema.id,
      ),
      'constraints': SchemaHelper.objectSchema(BoxConstraintsSchema.id),
      'elevation': SchemaHelper.objectSchema(
        MaterialStatePropertyDoubleSchema.id,
      ),
      'hintStyle': SchemaHelper.objectSchema(
        MaterialStatePropertyTextStyleSchema.id,
      ),
      'overlayColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      'padding': SchemaHelper.objectSchema(
          MaterialStatePropertyEdgeInsetsGeometrySchema.id),
      'shadowColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      'shape': SchemaHelper.objectSchema(
        MaterialStatePropertyOutlinedBorderSchema.id,
      ),
      'side': SchemaHelper.objectSchema(
        MaterialStatePropertyBorderSideSchema.id,
      ),
      'surfaceTintColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      'textCapitalization': SchemaHelper.objectSchema(
        TextCapitalizationSchema.id,
      ),
      'textStyle': SchemaHelper.objectSchema(
        MaterialStatePropertyTextStyleSchema.id,
      ),
    }
  };
}
