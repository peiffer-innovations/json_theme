import 'package:json_theme/json_theme_schemas.dart';

class MaterialStatePropertySizeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/material_state_property_size.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/MaterialStateProperty-class.html',
    'title': 'MaterialStatePropertySize',
    'type': 'object',
    'properties': {
      'disabled': SchemaHelper.objectSchema(SizeSchema.id),
      'dragged': SchemaHelper.objectSchema(SizeSchema.id),
      'empty': SchemaHelper.objectSchema(SizeSchema.id),
      'error': SchemaHelper.objectSchema(SizeSchema.id),
      'focused': SchemaHelper.objectSchema(SizeSchema.id),
      'hovered': SchemaHelper.objectSchema(SizeSchema.id),
      'pressed': SchemaHelper.objectSchema(SizeSchema.id),
      'selected': SchemaHelper.objectSchema(SizeSchema.id),
    },
  };
}
