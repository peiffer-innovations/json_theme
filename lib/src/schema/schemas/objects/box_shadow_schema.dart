import 'package:json_theme/json_theme_schemas.dart';

class BoxShadowSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/box_shadow.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/painting/BoxShadow-class.html',
    'type': 'object',
    'title': 'BoxShadow',
    'additionalProperties': false,
    'properties': {
      'blurRadius': SchemaHelper.numberSchema,
      'blurStyle': SchemaHelper.objectSchema(BlurStyleSchema.id),
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'offset': SchemaHelper.objectSchema(OffsetSchema.id),
      'spreadRadius': SchemaHelper.numberSchema,
    },
  };
}
