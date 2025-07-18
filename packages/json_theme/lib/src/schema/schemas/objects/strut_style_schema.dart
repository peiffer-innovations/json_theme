import 'package:json_theme/json_theme_schemas.dart';

class StrutStyleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/strut_style.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/painting/StrutStyle-class.html',
    'title': 'StrutStyle',
    'type': 'object',
    'properties': {
      'fontFamily': SchemaHelper.stringSchema,
      'fontFamilyFallback': {
        'type': 'array',
        'items': SchemaHelper.stringSchema,
      },
      'fontSize': SchemaHelper.numberSchema,
      'fontStyle': SchemaHelper.objectSchema(FontStyleSchema.id),
      'fontWeight': SchemaHelper.objectSchema(FontWeightSchema.id),
      'forceStrutHeight': SchemaHelper.boolSchema,
      'height': SchemaHelper.numberSchema,
      'leading': SchemaHelper.numberSchema,
      'package': SchemaHelper.stringSchema,
    },
  };
}
