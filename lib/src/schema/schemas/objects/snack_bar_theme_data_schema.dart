import 'package:json_theme/json_theme_schemas.dart';

class SnackBarThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/snack_bar_theme_data';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'SnackBarThemeData',
    'type': 'object',
    'properties': {
      'actionTextColor': SchemaHelper.objectSchema(ColorSchema.id),
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'behavior': SchemaHelper.objectSchema(SnackBarBehaviorSchema.id),
      'contentTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'disabledActionTextColor': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
    },
  };
}
