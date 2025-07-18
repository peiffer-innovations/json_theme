import 'package:json_theme/json_theme_schemas.dart';

class RadioThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/radio_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/RadioThemeData-class.html',
    'title': 'RadioThemeDataSchema',
    'type': 'object',
    'properties': {
      'fillColor': SchemaHelper.objectSchema(WidgetStatePropertyColorSchema.id),
      'materialTapTargetSize': SchemaHelper.objectSchema(
        MaterialTapTargetSizeSchema.id,
      ),
      'mouseCursor': SchemaHelper.objectSchema(
        WidgetStatePropertyMouseCursorSchema.id,
      ),
      'overlayColor': SchemaHelper.objectSchema(
        WidgetStatePropertyColorSchema.id,
      ),
      'splashRadius': SchemaHelper.numberSchema,
      'visualDensity': SchemaHelper.objectSchema(VisualDensitySchema.id),
    },
  };
}
