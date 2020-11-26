import 'package:json_theme/json_theme_schemas.dart';

class ColorSchemeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/color_scheme.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'ColorScheme',
    'type': 'object',
    'properties': {
      'background': SchemaHelper.objectSchema(ColorSchema.id),
      'brightness': SchemaHelper.objectSchema(BrightnessSchema.id),
      'error': SchemaHelper.objectSchema(ColorSchema.id),
      'onBackground': SchemaHelper.objectSchema(ColorSchema.id),
      'onError': SchemaHelper.objectSchema(ColorSchema.id),
      'onPrimary': SchemaHelper.objectSchema(ColorSchema.id),
      'onSecondary': SchemaHelper.objectSchema(ColorSchema.id),
      'onSurface': SchemaHelper.objectSchema(ColorSchema.id),
      'primary': SchemaHelper.objectSchema(ColorSchema.id),
      'primaryVariant': SchemaHelper.objectSchema(ColorSchema.id),
      'secondary': SchemaHelper.objectSchema(ColorSchema.id),
      'secondaryVariant': SchemaHelper.objectSchema(ColorSchema.id),
      'surface': SchemaHelper.objectSchema(ColorSchema.id),
    },
  };
}
