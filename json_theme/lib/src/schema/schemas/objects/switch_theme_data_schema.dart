import 'package:json_theme/json_theme_schemas.dart';

class SwitchThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/switch_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/SwitchThemeData-class.html',
    'title': 'SwitchThemeDataSchema',
    'type': 'object',
    'properties': {
      'materialTapTargetSize': SchemaHelper.objectSchema(
        MaterialTapTargetSizeSchema.id,
      ),
      'mouseCursor': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'overlayColor': SchemaHelper.objectSchema(
        WidgetStatePropertyColorSchema.id,
      ),
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'splashRadius': SchemaHelper.numberSchema,
      'thumbColor': SchemaHelper.objectSchema(
        WidgetStatePropertyColorSchema.id,
      ),
      'trackColor': SchemaHelper.objectSchema(
        WidgetStatePropertyColorSchema.id,
      ),
      'trackOutlineColor': SchemaHelper.objectSchema(
        WidgetStatePropertyColorSchema.id,
      ),
      'trackOutlineWidth': SchemaHelper.numberSchema,
    },
  };
}
