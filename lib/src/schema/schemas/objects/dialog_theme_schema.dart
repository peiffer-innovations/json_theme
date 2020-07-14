import 'package:json_theme/json_theme_schemas.dart';

class DialogThemeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/dialog_theme';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'DialogTheme',
    'type': 'object',
    'properties': {
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'contentTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'titleTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
    },
  };
}
