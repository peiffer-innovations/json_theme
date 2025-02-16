import 'package:json_theme/json_theme_schemas.dart';

class DataTableThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/data_table_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/DataTableThemeData-class.html',
    'title': 'DataTableThemeData',
    'additionalProperties': false,
    'properties': {
      'checkboxHorizontalMargin': SchemaHelper.numberSchema,
      'columnSpacing': SchemaHelper.numberSchema,
      'dataRowCursor': SchemaHelper.objectSchema(
        WidgetStatePropertyMouseCursorSchema.id,
      ),
      'dataRowColor': SchemaHelper.objectSchema(
        WidgetStatePropertyColorSchema.id,
      ),
      'dataRowMaxHeight': SchemaHelper.numberSchema,
      'dataRowMinHeight': SchemaHelper.numberSchema,
      'dataTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'decoration': SchemaHelper.objectSchema(BoxDecorationSchema.id),
      'dividerThickness': SchemaHelper.numberSchema,
      'headingCellCursor': SchemaHelper.objectSchema(
        WidgetStatePropertyMouseCursorSchema.id,
      ),
      'headingRowAlignment': SchemaHelper.objectSchema(
        MainAxisAlignmentSchema.id,
      ),
      'headingRowColor': SchemaHelper.objectSchema(
        WidgetStatePropertyColorSchema.id,
      ),
      'headingRowHeight': SchemaHelper.numberSchema,
      'headingTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'horizontalMargin': SchemaHelper.numberSchema,
    },
  };
}
