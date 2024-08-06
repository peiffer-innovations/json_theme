import 'package:json_theme/json_theme_schemas.dart';

class ColorSchemeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/color_scheme.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/ColorScheme-class.html',
    'title': 'ColorScheme',
    'type': 'object',
    'properties': {
      'background': SchemaHelper.objectSchema(ColorSchema.id),
      'brightness': SchemaHelper.objectSchema(BrightnessSchema.id),
      'error': SchemaHelper.objectSchema(ColorSchema.id),
      'errorContainer': SchemaHelper.objectSchema(ColorSchema.id),
      'inversePrimary': SchemaHelper.objectSchema(ColorSchema.id),
      'inverseSurface': SchemaHelper.objectSchema(ColorSchema.id),
      'onBackground': SchemaHelper.objectSchema(ColorSchema.id),
      'onError': SchemaHelper.objectSchema(ColorSchema.id),
      'onErrorContainer': SchemaHelper.objectSchema(ColorSchema.id),
      'onInverseSurface': SchemaHelper.objectSchema(ColorSchema.id),
      'onPrimary': SchemaHelper.objectSchema(ColorSchema.id),
      'onPrimaryContainer': SchemaHelper.objectSchema(ColorSchema.id),
      'onSecondary': SchemaHelper.objectSchema(ColorSchema.id),
      'onSecondaryContainer': SchemaHelper.objectSchema(ColorSchema.id),
      'onSurface': SchemaHelper.objectSchema(ColorSchema.id),
      'onSurfaceVariant': SchemaHelper.objectSchema(ColorSchema.id),
      'onTertiary': SchemaHelper.objectSchema(ColorSchema.id),
      'onTertiaryContainer': SchemaHelper.objectSchema(ColorSchema.id),
      'outline': SchemaHelper.objectSchema(ColorSchema.id),
      'outlineVariant': SchemaHelper.objectSchema(ColorSchema.id),
      'primary': SchemaHelper.objectSchema(ColorSchema.id),
      'primaryContainer': SchemaHelper.objectSchema(ColorSchema.id),
      'scrim': SchemaHelper.objectSchema(ColorSchema.id),
      'secondary': SchemaHelper.objectSchema(ColorSchema.id),
      'secondaryContainer': SchemaHelper.objectSchema(ColorSchema.id),
      'shadow': SchemaHelper.objectSchema(ColorSchema.id),
      'surface': SchemaHelper.objectSchema(ColorSchema.id),
      'surfaceTint': SchemaHelper.objectSchema(ColorSchema.id),
      'JsonWidgetStateProperty': SchemaHelper.numberSchema,
      'tertiary': SchemaHelper.objectSchema(ColorSchema.id),
      'tertiaryContainer': SchemaHelper.objectSchema(ColorSchema.id)
    },
  };
}
