import 'package:json_theme/json_theme_schemas.dart';

class MaterialBannerThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/material_banner_theme_data';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'MaterialBannerThemeData',
    'type': 'object',
    'properties': {
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'contentTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'leadingPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
    },
  };
}
