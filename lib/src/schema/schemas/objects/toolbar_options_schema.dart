import 'package:json_theme/json_theme_schemas.dart';

class ToolbarOptionsSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/toolbar_options.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/ToolbarOptions-class.html',
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
