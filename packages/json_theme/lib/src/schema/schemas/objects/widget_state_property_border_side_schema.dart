import 'package:json_theme/json_theme_schemas.dart';

class WidgetStatePropertyBorderSideSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/widget_state_property_border_side.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'WidgetStatePropertyBorderSide',
    'type': 'object',
    'properties': {
      'disabled': SchemaHelper.objectSchema(BorderSideSchema.id),
      'dragged': SchemaHelper.objectSchema(BorderSideSchema.id),
      'empty': SchemaHelper.objectSchema(BorderSideSchema.id),
      'error': SchemaHelper.objectSchema(BorderSideSchema.id),
      'focused': SchemaHelper.objectSchema(BorderSideSchema.id),
      'hovered': SchemaHelper.objectSchema(BorderSideSchema.id),
      'pressed': SchemaHelper.objectSchema(BorderSideSchema.id),
      'scrolledUnder': SchemaHelper.objectSchema(BorderSideSchema.id),
      'selected': SchemaHelper.objectSchema(BorderSideSchema.id),
    },
  };
}
