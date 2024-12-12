import 'package:json_theme/json_theme_schemas.dart';

class NavigationBarThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/navigation_bar_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/NavigationBarThemeData-class.html',
    'title': 'NavigationBarThemeData',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'height': SchemaHelper.numberSchema,
      'iconTheme': SchemaHelper.objectSchema(
        WidgetStatePropertyIconThemeDataSchema.id,
      ),
      'indicatorColor': SchemaHelper.objectSchema(ColorSchema.id),
      'indicatorShape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'labelBehavior': SchemaHelper.objectSchema(
        NavigationDestinationLabelBehaviorSchema.id,
      ),
      'labelTextStyle': SchemaHelper.objectSchema(
        WidgetStatePropertyTextStyleSchema.id,
      ),
      'overlayColor': SchemaHelper.objectSchema(
        WidgetStatePropertyColorSchema.id,
      ),
      'shadowColor': SchemaHelper.objectSchema(ColorSchema.id),
      'surfaceTintColor': SchemaHelper.objectSchema(ColorSchema.id),
    },
  };
}
