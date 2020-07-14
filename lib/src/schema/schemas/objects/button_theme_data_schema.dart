import 'package:json_theme/json_theme_schemas.dart';

class ButtonThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/button_theme_data';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'ButtonThemeData',
    'type': 'object',
    'properties': {
      'alignedDropdown': SchemaHelper.boolSchema,
      'buttonColor': SchemaHelper.objectSchema(ColorSchema.id),
      'colorScheme': SchemaHelper.objectSchema(ColorSchemeSchema.id),
      'disabledColor': SchemaHelper.objectSchema(ColorSchema.id),
      'focusColor': SchemaHelper.objectSchema(ColorSchema.id),
      'height': SchemaHelper.numberSchema,
      'hoverColor': SchemaHelper.objectSchema(ColorSchema.id),
      'layoutBehavior':
          SchemaHelper.objectSchema(ButtonBarLayoutBehaviorSchema.id),
      'materialTapTargetSize':
          SchemaHelper.objectSchema(MaterialTapTargetSizeSchema.id),
      'minWidth': SchemaHelper.numberSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'splashColor': SchemaHelper.objectSchema(ColorSchema.id),
      'textTheme': SchemaHelper.objectSchema(ButtonTextThemeSchema.id),
    },
  };
}
