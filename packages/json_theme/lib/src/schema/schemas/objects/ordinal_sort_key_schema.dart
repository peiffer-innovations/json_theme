import 'package:json_theme/json_theme_schemas.dart';

class OrdinalSortKeySchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/ordinal_sort_key.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/semantics/OrdinalSortKey-class.html',
    'title': 'OrdinalSortKey',
    'type': 'object',
    'required': ['order'],
    'properties': {
      'name': SchemaHelper.stringSchema,
      'order': SchemaHelper.numberSchema,
    },
  };
}
