import 'package:json_theme/json_theme_schemas.dart';

class BottomAppBarThemeScheme {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/bottom_app_bar_theme.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/BottomAppBarTheme-class.html',
    'type': 'object',
    'title': 'BottomAppBarTheme',
    'additionalProperties': false,
    'properties': {
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'shape': SchemaHelper.objectSchema(NotchedShapeSchema.id),
    },
  };
}
