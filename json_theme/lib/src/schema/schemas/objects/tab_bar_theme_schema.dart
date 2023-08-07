import 'package:json_theme/json_theme_schemas.dart';

class TabBarThemeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/tab_bar_theme.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/TabBarTheme-class.html',
    'title': 'TabBarTheme',
    'type': 'object',
    'properties': {
      'dividerColor': SchemaHelper.objectSchema(ColorSchema.id),
      'indicatorColor': SchemaHelper.objectSchema(ColorSchema.id),
      'indicatorSize': SchemaHelper.objectSchema(TabBarIndicatorSizeSchema.id),
      'labelPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'labelColor': SchemaHelper.objectSchema(ColorSchema.id),
      'labelStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'mouseCursor': SchemaHelper.objectSchema(
        MaterialStatePropertyMouseCursorSchema.id,
      ),
      'overlayColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      'splashFactory': SchemaHelper.objectSchema(
        InteractiveInkFeatureFactorySchema.id,
      ),
      'unselectedLabelColor': SchemaHelper.objectSchema(ColorSchema.id),
      'unselectedLabelStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
    },
  };
}
