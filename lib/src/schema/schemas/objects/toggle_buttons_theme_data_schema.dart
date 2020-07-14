import 'package:json_theme/json_theme_schemas.dart';

class ToggleButtonsThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/toggle_buttons_theme_data';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'ToggleButtonsThemeData',
    'type': 'object',
    'properties': {
      'borderColor': SchemaHelper.objectSchema(ColorSchema.id),
      'borderRadius': SchemaHelper.objectSchema(BorderRadiusSchema.id),
      'borderWidth': SchemaHelper.numberSchema,
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'constraints': SchemaHelper.objectSchema(BoxConstraintsSchema.id),
      'disabledBorderColor': SchemaHelper.objectSchema(ColorSchema.id),
      'disabledColor': SchemaHelper.objectSchema(ColorSchema.id),
      'fillColor': SchemaHelper.objectSchema(ColorSchema.id),
      'focusColor': SchemaHelper.objectSchema(ColorSchema.id),
      'highlightColor': SchemaHelper.objectSchema(ColorSchema.id),
      'hoverColor': SchemaHelper.objectSchema(ColorSchema.id),
      'selectedBorderColor': SchemaHelper.objectSchema(ColorSchema.id),
      'selectedColor': SchemaHelper.objectSchema(ColorSchema.id),
      'splashColor': SchemaHelper.objectSchema(ColorSchema.id),
      'textStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
    },
  };
}
