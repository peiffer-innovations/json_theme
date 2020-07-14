import 'package:json_theme/json_theme_schemas.dart';

class BottomAppBarThemeScheme {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/bottom_app_bar_theme';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
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
