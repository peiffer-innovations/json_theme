import 'package:json_theme/json_theme_schemas.dart';

class BottomSheetThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/bottom_sheet_theme_data';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'BottomSheetThemeData',
    'additionalProperties': false,
    'properties': {
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'modalBackgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'modalElevation': SchemaHelper.numberSchema,
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
    },
  };
}
