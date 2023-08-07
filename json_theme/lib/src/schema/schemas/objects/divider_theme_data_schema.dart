import 'package:json_theme/json_theme_schemas.dart';

class DividerThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/divider_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/DividerThemeData-class.html',
    'title': 'DividerThemeData',
    'type': 'object',
    'properties': {
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'endIndent': SchemaHelper.numberSchema,
      'indent': SchemaHelper.numberSchema,
      'space': SchemaHelper.numberSchema,
      'thickness': SchemaHelper.numberSchema,
    },
  };
}
