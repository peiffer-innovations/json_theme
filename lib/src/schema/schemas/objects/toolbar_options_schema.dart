import 'package:json_theme/json_theme_schemas.dart';

class ToolbarOptionsSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/toolbar_options';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'ToolbarOptions',
    'type': 'object',
    'properties': {
      'copy': SchemaHelper.boolSchema,
      'cut': SchemaHelper.boolSchema,
      'paste': SchemaHelper.boolSchema,
      'selectAll': SchemaHelper.boolSchema,
    },
  };
}
