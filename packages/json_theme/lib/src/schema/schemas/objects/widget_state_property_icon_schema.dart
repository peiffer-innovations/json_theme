import 'package:json_theme/json_theme_schemas.dart';

class WidgetStatePropertyIconSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/widget_state_property_icon.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Icon-class.html',
    'title': 'WidgetStatePropertyIcon',
    'type': 'object',
    'properties': {
      'disabled': SchemaHelper.objectSchema(IconSchema.id),
      'dragged': SchemaHelper.objectSchema(IconSchema.id),
      'empty': SchemaHelper.objectSchema(IconSchema.id),
      'error': SchemaHelper.objectSchema(IconSchema.id),
      'focused': SchemaHelper.objectSchema(IconSchema.id),
      'hovered': SchemaHelper.objectSchema(IconSchema.id),
      'pressed': SchemaHelper.objectSchema(IconSchema.id),
      'scrolledUnder': SchemaHelper.objectSchema(IconSchema.id),
      'selected': SchemaHelper.objectSchema(IconSchema.id),
    },
  };
}
