import 'package:json_theme/json_theme_schemas.dart';

class PopupMenuThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/popup_menu_theme_data';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'PopupMenuThemeDataSchema',
    'type': 'object',
    'properties': {
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'textStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
    },
  };
}
