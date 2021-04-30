import 'package:json_theme/json_theme_schemas.dart';

class CheckboxThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/checkbox_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/CheckboxThemeData-class.html',
    'title': 'CheckboxThemeDataSchema',
    'type': 'object',
    'properties': {
      'checkColor': SchemaHelper.objectSchema(ColorSchema.id),
      'fillColor': SchemaHelper.objectSchema(ColorSchema.id),
      'materialTapTargetSize': SchemaHelper.objectSchema(
        MaterialTapTargetSizeSchema.id,
      ),
      'mouseCursor': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'overlayColor': SchemaHelper.objectSchema(ColorSchema.id),
      'splashRadius': SchemaHelper.numberSchema,
      'visualDensity': SchemaHelper.objectSchema(VisualDensitySchema.id),
    },
  };
}
