import 'package:json_theme/json_theme_schemas.dart';

class RadioThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/radio_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/RadioThemeData-class.html',
    'title': 'RadioThemeDataSchema',
    'type': 'object',
    'properties': {
      'fillColor':
          SchemaHelper.objectSchema(MaterialStatePropertyColorSchema.id),
      'materialTapTargetSize': SchemaHelper.objectSchema(
        MaterialTapTargetSizeSchema.id,
      ),
      'mouseCursor': SchemaHelper.objectSchema(
        MaterialStatePropertyMouseCursorSchema.id,
      ),
      'overlayColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      'splashRadius': SchemaHelper.numberSchema,
      'visualDensity': SchemaHelper.objectSchema(VisualDensitySchema.id),
    },
  };
}
