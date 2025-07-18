import 'package:json_theme/json_theme_schemas.dart';

class ButtonStyleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/button_style.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/ButtonStyle-class.html',
    'title': 'ButtonStyle',
    'additionalProperties': false,
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'animationDuration': SchemaHelper.numberSchema,
      'backgroundColor': SchemaHelper.objectSchema(
        WidgetStatePropertyColorSchema.id,
      ),
      'elevation': {
        'anyOf': [
          {'type': 'number'},
          {'type': 'string'},
          {r'$ref': WidgetStatePropertyDoubleSchema.id},
        ],
      },
      'enableFeedback': SchemaHelper.boolSchema,
      'fixedSize': SchemaHelper.objectSchema(WidgetStatePropertySizeSchema.id),
      'foregroundColor': SchemaHelper.objectSchema(
        WidgetStatePropertyColorSchema.id,
      ),
      'iconAlignment': SchemaHelper.objectSchema(IconAlignmentSchema.id),
      'iconColor': SchemaHelper.objectSchema(WidgetStatePropertyColorSchema.id),
      'iconSize': {
        'anyOf': [
          {'type': 'number'},
          {'type': 'string'},
          {r'$ref': WidgetStatePropertyDoubleSchema.id},
        ],
      },
      'maximumSize': SchemaHelper.objectSchema(
        WidgetStatePropertySizeSchema.id,
      ),
      'minimumSize': SchemaHelper.objectSchema(
        WidgetStatePropertySizeSchema.id,
      ),
      'mouseCursor': SchemaHelper.objectSchema(
        WidgetStatePropertyMouseCursorSchema.id,
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
      'tapTargetSize': SchemaHelper.objectSchema(
        MaterialTapTargetSizeSchema.id,
      ),
      'textStyle': SchemaHelper.objectSchema(
        WidgetStatePropertyTextStyleSchema.id,
      ),
      'visualDensity': SchemaHelper.objectSchema(VisualDensitySchema.id),
    },
  };
}
