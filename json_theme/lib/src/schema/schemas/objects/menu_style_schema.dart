import 'package:json_theme/json_theme_schemas.dart';

class MenuStyleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/menu_style.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/MenuStyle-class.html',
    'title': 'MenuStyle',
    'additionalProperties': false,
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'backgroundColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      'elevation': SchemaHelper.objectSchema(
        MaterialStatePropertyDoubleSchema.id,
      ),
      'fixedSize': SchemaHelper.objectSchema(
        MaterialStatePropertySizeSchema.id,
      ),
      'maximumSize': SchemaHelper.objectSchema(
        MaterialStatePropertySizeSchema.id,
      ),
      'minimumSize': SchemaHelper.objectSchema(
        MaterialStatePropertySizeSchema.id,
      ),
      'padding': SchemaHelper.objectSchema(
        MaterialStatePropertyEdgeInsetsGeometrySchema.id,
      ),
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
      'visualDensity': SchemaHelper.objectSchema(VisualDensitySchema.id),
    },
  };
}
