import 'package:json_theme/json_theme_schemas.dart';

class IconThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/icon_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/IconThemeData-class.html',
    'title': 'IconThemeData',
    'type': 'object',
    'properties': {
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'fill': SchemaHelper.numberSchema,
      'grade': SchemaHelper.numberSchema,
      'opacity': SchemaHelper.numberSchema,
      'opticalSize': SchemaHelper.numberSchema,
      'shadows': SchemaHelper.arraySchema(ShadowSchema.id),
      'size': SchemaHelper.numberSchema,
      'weight': SchemaHelper.numberSchema,
    },
  };
}
