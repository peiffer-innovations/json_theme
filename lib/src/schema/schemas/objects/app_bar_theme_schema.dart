import 'package:json_theme/json_theme_schemas.dart';

class AppBarThemeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/app_bar_theme.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/AppBarTheme-class.html',
    'type': 'object',
    'title': 'AppBarTheme',
    'additionalProperties': false,
    'properties': {
      'actionsIconTheme': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'centerTitle': SchemaHelper.boolSchema,
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'foregroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'iconTheme': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'scrolledUnderElevation': SchemaHelper.numberSchema,
      'shadowColor': SchemaHelper.objectSchema(ColorSchema.id),
      'systemOverlayStyle':
          SchemaHelper.objectSchema(SystemUiOverlayStyleSchema.id),
      'titleSpacing': SchemaHelper.numberSchema,
      'titleTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'toolbarHeight': SchemaHelper.numberSchema,
      'toolbarTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
    },
  };
}
