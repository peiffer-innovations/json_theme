import 'package:json_theme/json_theme_schemas.dart';

class WidgetStatePropertyBoolSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/widget_state_property_bool.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'type': 'object',
    'properties': {
      'disabled': SchemaHelper.boolSchema,
      'dragged': SchemaHelper.boolSchema,
      'empty': SchemaHelper.boolSchema,
      'error': SchemaHelper.boolSchema,
      'focused': SchemaHelper.boolSchema,
      'hovered': SchemaHelper.boolSchema,
      'pressed': SchemaHelper.boolSchema,
      'scrolledUnder': SchemaHelper.boolSchema,
      'selected': SchemaHelper.boolSchema,
    },
  };
}
