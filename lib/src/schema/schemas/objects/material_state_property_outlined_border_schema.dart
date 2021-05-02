import 'package:json_theme/json_theme_schemas.dart';

class MaterialStatePropertyOutlinedBorderSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/material_state_property_outlined_border.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/MaterialStateProperty-class.html',
    'title': 'MaterialStatePropertyOutlinedBorderSchema',
    'type': 'object',
    'properties': {
      'disabled': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'dragged': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'empty': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'error': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'focused': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'hovered': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'pressed': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'selected': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
    },
  };
}
