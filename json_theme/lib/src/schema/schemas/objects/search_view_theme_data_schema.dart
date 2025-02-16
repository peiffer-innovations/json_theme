import 'package:json_theme/json_theme_schemas.dart';

class SearchViewThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/search_view_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/SearchViewThemeData-class.html',
    'title': 'SearchViewThemeData',
    'additionalProperties': false,
    'properties': {
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'barPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'constraints': SchemaHelper.objectSchema(BoxConstraintsSchema.id),
      'dividerColor': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'headerHeight': SchemaHelper.numberSchema,
      'headerHintStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'headerTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'shape': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'shrinkWrap': SchemaHelper.boolSchema,
      'side': SchemaHelper.objectSchema(BorderSideSchema.id),
      'surfaceTintColor': SchemaHelper.objectSchema(ColorSchema.id),
    },
  };
}
