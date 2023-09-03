import 'package:json_theme/json_theme_schemas.dart';

class SystemUiOverlayStyleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/system_ui_overlay_style.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/services/SystemUiOverlayStyle-class.html',
    'title': 'SystemUiOverlayStyle',
    'oneOf': [
      ...SchemaHelper.enumSchema(
        [
          'dark',
          'light',
        ],
      ),
      {
        'type': 'object',
        'properties': {
          'statusBarBrightness': SchemaHelper.objectSchema(BrightnessSchema.id),
          'statusBarColor': SchemaHelper.objectSchema(ColorSchema.id),
          'statusBarIconBrightness':
              SchemaHelper.objectSchema(BrightnessSchema.id),
          'systemNavigationBarColor': SchemaHelper.objectSchema(ColorSchema.id),
          'systemNavigationBarContrastEnforced': SchemaHelper.boolSchema,
          'systemNavigationBarDividerColor':
              SchemaHelper.objectSchema(ColorSchema.id),
          'systemNavigationBarIconBrightness':
              SchemaHelper.objectSchema(BrightnessSchema.id),
          'systemStatusBarContrastEnforced': SchemaHelper.boolSchema,
        },
      },
    ],
  };
}
