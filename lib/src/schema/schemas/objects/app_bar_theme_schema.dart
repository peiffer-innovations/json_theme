import 'package:json_theme/json_theme_schemas.dart';

class AppBarThemeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/app_bar_theme';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'AppBarTheme',
    'additionalProperties': false,
    'properties': {
      'actionsIconTheme': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'brightness': SchemaHelper.objectSchema(BrightnessSchema.id),
      'centerTitle': SchemaHelper.boolSchema,
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'iconTheme': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'shadowColor': SchemaHelper.objectSchema(ColorSchema.id),
      'textTheme': SchemaHelper.objectSchema(TextThemeSchema.id),
    },
  };
}
