import 'package:json_theme/json_theme_schemas.dart';

class CupertinoThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/cupertino_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/cupertino/CupertinoThemeData-class.html',
    'title': 'CupertinoThemeData',
    'type': 'object',
    'properties': {
      'applyThemeToAll': SchemaHelper.boolSchema,
      'barBackgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'brightness': SchemaHelper.objectSchema(BrightnessSchema.id),
      'primaryColor': SchemaHelper.objectSchema(ColorSchema.id),
      'primaryContrastingColor': SchemaHelper.objectSchema(ColorSchema.id),
      'scaffoldBackgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'textTheme': SchemaHelper.objectSchema(CupertinoTextThemeDataSchema.id),
    },
  };
}
