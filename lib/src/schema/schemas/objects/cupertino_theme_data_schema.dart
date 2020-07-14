import 'package:json_theme/json_theme_schemas.dart';

class CupertinoThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/cupertino_theme_data';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'CupertinoThemeData',
    'type': 'object',
    'properties': {
      'barBackgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'brightness': SchemaHelper.objectSchema(BrightnessSchema.id),
      'primaryColor': SchemaHelper.objectSchema(ColorSchema.id),
      'primaryContrastingColor': SchemaHelper.objectSchema(ColorSchema.id),
      'scaffoldBackgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'textTheme': SchemaHelper.objectSchema(CupertinoTextThemeDataSchema.id),
    },
  };
}
