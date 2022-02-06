import 'package:json_theme/json_theme_schemas.dart';

class MaterialStatePropertyMouseCursorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/material_state_property_mouse_cursor.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/MaterialStateProperty-class.html',
    'title': 'MaterialStatePropertyMouseCursorSchema',
    'type': 'object',
    'properties': {
      'disabled': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'dragged': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'empty': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'error': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'focused': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'hovered': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'pressed': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'scrolledUnder': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'selected': SchemaHelper.objectSchema(MouseCursorSchema.id),
    },
  };
}
