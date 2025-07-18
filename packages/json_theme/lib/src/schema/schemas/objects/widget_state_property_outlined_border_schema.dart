import 'package:json_theme/json_theme_schemas.dart';

class WidgetStatePropertyOutlinedBorderSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/widget_state_property_outlined_border.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'WidgetStatePropertyOutlinedBorder',
    'type': 'object',
    'properties': {
      'disabled': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'dragged': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'empty': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'error': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'focused': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'hovered': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'pressed': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'scrolledUnder': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'selected': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
    },
  };
}
