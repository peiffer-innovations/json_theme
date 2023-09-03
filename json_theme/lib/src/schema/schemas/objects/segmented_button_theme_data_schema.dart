import 'package:json_theme/json_theme_schemas.dart';

class SegmentedButtonThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/segmented_button_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/SegmentedButtonThemeData-class.html',
    'title': 'SearchViewThemeData',
    'additionalProperties': false,
    'properties': {
      'selectedIcon': SchemaHelper.objectSchema(IconSchema.id),
      'style': SchemaHelper.objectSchema(ButtonStyleSchema.id),
    }
  };
}
