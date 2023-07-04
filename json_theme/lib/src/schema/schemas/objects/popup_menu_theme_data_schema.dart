import 'package:json_theme/json_theme_schemas.dart';

class PopupMenuThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/popup_menu_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/PopupMenuThemeData-class.html',
    'title': 'PopupMenuThemeData',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'enableFeedback': SchemaHelper.boolSchema,
      'labelTextStyle': SchemaHelper.objectSchema(
        MaterialStatePropertyTextStyleSchema.id,
      ),
      'mouseCursor': SchemaHelper.objectSchema(
        MaterialStatePropertyMouseCursorSchema.id,
      ),
      'position': SchemaHelper.objectSchema(PopupMenuPositionSchema.id),
      'shadowColor': SchemaHelper.objectSchema(ColorSchema.id),
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'surfaceTintColor': SchemaHelper.objectSchema(ColorSchema.id),
      'textStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
    },
  };
}
