import 'package:json_theme/json_theme_schemas.dart';

class DialogThemeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/dialog_theme.json';

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
