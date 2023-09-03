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
      'constraints': SchemaHelper.objectSchema(BoxConstraintsSchema.id),
      'dividerColor': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'headerHintStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'headerTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'shape': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'side': SchemaHelper.objectSchema(BorderSideSchema.id),
      'surfaceTintColor': SchemaHelper.objectSchema(ColorSchema.id),
    }
  };
}
