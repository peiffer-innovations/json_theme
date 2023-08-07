import 'package:json_theme/json_theme_schemas.dart';

class ShadowSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/shadow.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment': 'https://api.flutter.dev/flutter/dart-ui/Shadow-class.html',
    'title': 'Shadow',
    'type': 'object',
    'required': [
      'color',
    ],
    'properties': {
      'blurRadius': SchemaHelper.numberSchema,
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'offset': SchemaHelper.objectSchema(OffsetSchema.id),
    },
  };
}
