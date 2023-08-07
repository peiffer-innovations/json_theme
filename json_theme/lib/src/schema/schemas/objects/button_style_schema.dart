import 'package:json_theme/json_theme_schemas.dart';

class ButtonStyleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/button_style.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/ButtonStyle-class.html',
    'title': 'ButtonStyle',
    'additionalProperties': false,
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'animationDuration': SchemaHelper.numberSchema,
      'backgroundColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      'elevation': {
        'anyOf': [
          {
            'type': 'number',
          },
          {
            'type': 'string',
          },
          {
            r'$ref': MaterialStatePropertyDoubleSchema.id,
          },
        ],
      },
      'enableFeedback': SchemaHelper.boolSchema,
      'fixedSize': SchemaHelper.objectSchema(
        MaterialStatePropertySizeSchema.id,
      ),
      'foregroundColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      'iconColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      'iconSize': {
        'anyOf': [
          {
            'type': 'number',
          },
          {
            'type': 'string',
          },
          {
            r'$ref': MaterialStatePropertyDoubleSchema.id,
          },
        ],
      },
      'maximumSize': SchemaHelper.objectSchema(
        MaterialStatePropertySizeSchema.id,
      ),
      'minimumSize': SchemaHelper.objectSchema(
        MaterialStatePropertySizeSchema.id,
      ),
      'mouseCursor': SchemaHelper.objectSchema(
        MaterialStatePropertyMouseCursorSchema.id,
      ),
      'overlayColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
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
      'tapTargetSize': SchemaHelper.objectSchema(
        MaterialTapTargetSizeSchema.id,
      ),
      'textStyle': SchemaHelper.objectSchema(
        MaterialStatePropertyTextStyleSchema.id,
      ),
      'visualDensity': SchemaHelper.objectSchema(VisualDensitySchema.id),
    },
  };
}
