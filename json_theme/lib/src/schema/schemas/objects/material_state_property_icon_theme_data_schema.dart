import 'package:json_theme/json_theme_schemas.dart';

class MaterialStatePropertyIconThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/material_state_property_icon_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/IconThemeData-class.html',
    'title': 'MaterialStatePropertyIconThemeData',
    'type': 'object',
    'properties': {
      'disabled': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'dragged': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'empty': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'error': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'focused': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'hovered': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'pressed': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'scrolledUnder': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'selected': SchemaHelper.objectSchema(IconThemeDataSchema.id),
    },
  };
}
