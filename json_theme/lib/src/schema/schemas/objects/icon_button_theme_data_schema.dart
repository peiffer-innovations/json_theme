import 'package:json_theme/json_theme_schemas.dart';

class IconButtonThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/icon_button_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/IconButtonThemeData-class.html',
    'title': 'IconButtonThemeData',
    'additionalProperties': false,
    'properties': {
      'style': SchemaHelper.objectSchema(ButtonStyleSchema.id),
    },
  };
}
