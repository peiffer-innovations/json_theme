import 'package:json_theme/json_theme_schemas.dart';

class MaterialTypeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/material_type.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/MaterialType-class.html',
    'title': 'MaterialType',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'button',
      'canvas',
      'card',
      'circle',
      'transparency',
    ]),
  };
}
