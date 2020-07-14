import 'package:json_theme/json_theme_schemas.dart';

class MaterialColorSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/material_color';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'MaterialColor',
    'type': 'object',
    'required': [
      'primary',
      'swatches',
    ],
    'properties': {
      'primary': SchemaHelper.objectSchema(ColorSchema.id),
      'swatches': {
        'type': 'object',
        'properties': {
          '50': SchemaHelper.objectSchema(ColorSchema.id),
          '100': SchemaHelper.objectSchema(ColorSchema.id),
          '200': SchemaHelper.objectSchema(ColorSchema.id),
          '300': SchemaHelper.objectSchema(ColorSchema.id),
          '400': SchemaHelper.objectSchema(ColorSchema.id),
          '500': SchemaHelper.objectSchema(ColorSchema.id),
          '600': SchemaHelper.objectSchema(ColorSchema.id),
          '700': SchemaHelper.objectSchema(ColorSchema.id),
          '800': SchemaHelper.objectSchema(ColorSchema.id),
          '900': SchemaHelper.objectSchema(ColorSchema.id),
        },
      },
      'leadingPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
    },
  };
}
