import 'package:json_theme/json_theme_schemas.dart';

class BadgeThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/badge_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/BadgeThemeData-class.html',
    'title': 'BadgeThemeData',
    'additionalProperties': false,
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentGeometrySchema.id),
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'largeSize': SchemaHelper.numberSchema,
      'offset': SchemaHelper.objectSchema(OffsetSchema.id),
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'smallSize': SchemaHelper.numberSchema,
      'textColor': SchemaHelper.objectSchema(ColorSchema.id),
      'textStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
    },
  };
}
