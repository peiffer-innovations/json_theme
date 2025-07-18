import 'package:json_theme/json_theme_schemas.dart';

class WidgetStatePropertyColorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/widget_state_property_color.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'WidgetStatePropertyColor',
    'type': 'object',
    'properties': {
      'disabled': SchemaHelper.objectSchema(ColorSchema.id),
      'dragged': SchemaHelper.objectSchema(ColorSchema.id),
      'empty': SchemaHelper.objectSchema(ColorSchema.id),
      'error': SchemaHelper.objectSchema(ColorSchema.id),
      'focused': SchemaHelper.objectSchema(ColorSchema.id),
      'hovered': SchemaHelper.objectSchema(ColorSchema.id),
      'pressed': SchemaHelper.objectSchema(ColorSchema.id),
      'scrolledUnder': SchemaHelper.objectSchema(ColorSchema.id),
      'selected': SchemaHelper.objectSchema(ColorSchema.id),
    },
  };
}
