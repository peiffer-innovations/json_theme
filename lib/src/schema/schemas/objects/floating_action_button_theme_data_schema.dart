import 'package:json_theme/json_theme_schemas.dart';

class FloatingActionButtonThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/floating_action_button_theme_data';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'FloatingActionButtonThemeData',
    'type': 'object',
    'properties': {
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'disabledElevation': SchemaHelper.numberSchema,
      'elevation': SchemaHelper.numberSchema,
      'focusColor': SchemaHelper.objectSchema(ColorSchema.id),
      'focusElevation': SchemaHelper.numberSchema,
      'foregroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'highlightElevation': SchemaHelper.numberSchema,
      'hoverColor': SchemaHelper.objectSchema(ColorSchema.id),
      'hoverElevation': SchemaHelper.numberSchema,
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'splashColor': SchemaHelper.objectSchema(ColorSchema.id),
    },
  };
}
