import 'package:json_theme/json_theme_schemas.dart';

class TableColumnWidthSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/table_column_width.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/rendering/TableColumnWidth-class.html',
    'type': 'object',
    'title': 'TableColumnWidth',
    'additionalProperties': false,
    'required': ['type'],
    'properties': {
      'a': SchemaHelper.objectSchema(TableColumnWidthSchema.id),
      'b': SchemaHelper.objectSchema(TableColumnWidthSchema.id),
      'type': {
        'type': 'string',
        'enum': ['fixed', 'flex', 'fraction', 'intrinsic', 'max', 'min'],
      },
      'value': SchemaHelper.numberSchema,
    },
  };
}
