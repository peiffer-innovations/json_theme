import 'package:json_theme/json_theme_schemas.dart';

class ChipThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/chip_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'ChipThemeData',
    'type': 'object',
    'properties': {
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'brightness': SchemaHelper.objectSchema(BrightnessSchema.id),
      'checkmarkColor': SchemaHelper.objectSchema(ColorSchema.id),
      'deleteIconColor': SchemaHelper.objectSchema(ColorSchema.id),
      'disabledColor': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'pressElevation': SchemaHelper.numberSchema,
      'secondaryLabelStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'secondaryLabelColor': SchemaHelper.objectSchema(ColorSchema.id),
      'selectedColor': SchemaHelper.objectSchema(ColorSchema.id),
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'selectedShadowColor': SchemaHelper.objectSchema(ColorSchema.id),
      'shadowColor': SchemaHelper.objectSchema(ColorSchema.id),
      'showCheckmark': SchemaHelper.boolSchema,
    },
  };
}
