import 'package:json_theme/json_theme_schemas.dart';

class ImageProviderSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/image_provider.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/painting/ImageProvider-class.html',
    'title': 'ImageProvider',
    'type': 'object',
    'additionalProperties': false,
    'required': ['type'],
    'properties': {
      'assetName': SchemaHelper.stringSchema,
      'bytes': SchemaHelper.stringSchema,
      'headers': SchemaHelper.anySchema,
      'package': SchemaHelper.stringSchema,
      'scale': SchemaHelper.numberSchema,
      'url': SchemaHelper.stringSchema,
      'type': {
        'type': 'string',
        'enum': ['asset', 'memory', 'network'],
      },
    },
  };
}
