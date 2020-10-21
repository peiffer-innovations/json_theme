import 'package:json_theme/json_theme_schemas.dart';

class DataTableThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/data_table_theme_data';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'id': '$id',
    'title': 'DataTableThemeData',
    'additionalProperties': false,
    'properties': {
      'columnSpacing': SchemaHelper.numberSchema,
      'dataRowColor': SchemaHelper.objectSchema(ColorSchema.id),
      'dataRowHeight': SchemaHelper.numberSchema,
      'dataTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'dividerThickness': SchemaHelper.numberSchema,
      'headingRowColor': SchemaHelper.objectSchema(ColorSchema.id),
      'headingRowHeight': SchemaHelper.numberSchema,
      'headingTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'horizontalMargin': SchemaHelper.numberSchema,
    },
  };
}
