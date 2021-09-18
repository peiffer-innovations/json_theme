import 'package:json_theme/json_theme_schemas.dart';

class ProgressIndicatorThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/progress_indicator_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/ProgressIndicatorThemeData-class.html',
    'title': 'ProgressIndicatorThemeData',
    'type': 'object',
    'properties': {
      'circularTrackColor': SchemaHelper.objectSchema(ColorSchema.id),
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'linearMinHeight': SchemaHelper.numberSchema,
      'linearTrackColor': SchemaHelper.objectSchema(ColorSchema.id),
      'refreshBackgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
    },
  };
}
