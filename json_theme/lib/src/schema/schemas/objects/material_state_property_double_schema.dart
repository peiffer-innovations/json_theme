import 'package:json_theme/json_theme_schemas.dart';

class MaterialStatePropertyDoubleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/material_state_property_double.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/MaterialStateProperty-class.html',
    'title': 'MaterialStatePropertyDouble',
    'type': 'object',
    'properties': {
      'disabled': SchemaHelper.numberSchema,
      'dragged': SchemaHelper.numberSchema,
      'empty': SchemaHelper.numberSchema,
      'error': SchemaHelper.numberSchema,
      'focused': SchemaHelper.numberSchema,
      'hovered': SchemaHelper.numberSchema,
      'pressed': SchemaHelper.numberSchema,
      'scrolledUnder': SchemaHelper.numberSchema,
      'selected': SchemaHelper.numberSchema,
    },
  };
}
