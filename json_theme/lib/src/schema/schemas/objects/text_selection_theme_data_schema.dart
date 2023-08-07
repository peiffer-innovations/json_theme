import 'package:json_theme/json_theme_schemas.dart';

class TextSelectionThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/text_selection_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/TextSelectionThemeData-class.html',
    'title': 'TextSelectionThemeData',
    'additionalProperties': false,
    'properties': {
      'cursorColor': SchemaHelper.objectSchema(ColorSchema.id),
      'selectionColor': SchemaHelper.objectSchema(ColorSchema.id),
      'selectionHandleColor': SchemaHelper.objectSchema(ColorSchema.id),
    },
  };
}
