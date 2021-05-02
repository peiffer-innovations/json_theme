import 'package:json_theme/json_theme_schemas.dart';

class DataTableThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/data_table_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/DataTableThemeData-class.html',
    'title': 'DataTableThemeData',
    'additionalProperties': false,
    'properties': {
      'columnSpacing': SchemaHelper.numberSchema,
      'dataRowColor':
          SchemaHelper.objectSchema(MaterialStatePropertyColorSchema.id),
      'dataRowHeight': SchemaHelper.numberSchema,
      'dataTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'dividerThickness': SchemaHelper.numberSchema,
      'headingRowColor':
          SchemaHelper.objectSchema(MaterialStatePropertyColorSchema.id),
      'headingRowHeight': SchemaHelper.numberSchema,
      'headingTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'horizontalMargin': SchemaHelper.numberSchema,
    },
  };
}
