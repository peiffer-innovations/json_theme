import 'package:json_theme/json_theme_schemas.dart';

class MaterialStatePropertyTextStyleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/material_state_property_text_style.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/MaterialStateProperty-class.html',
    'title': 'MaterialStatePropertyTextStyle',
    'type': 'object',
    'properties': {
      'disabled': SchemaHelper.objectSchema(TextStyleSchema.id),
      'dragged': SchemaHelper.objectSchema(TextStyleSchema.id),
      'empty': SchemaHelper.objectSchema(TextStyleSchema.id),
      'error': SchemaHelper.objectSchema(TextStyleSchema.id),
      'focused': SchemaHelper.objectSchema(TextStyleSchema.id),
      'hovered': SchemaHelper.objectSchema(TextStyleSchema.id),
      'pressed': SchemaHelper.objectSchema(TextStyleSchema.id),
      'scrolledUnder': SchemaHelper.objectSchema(TextStyleSchema.id),
      'selected': SchemaHelper.objectSchema(TextStyleSchema.id),
    },
  };
}
