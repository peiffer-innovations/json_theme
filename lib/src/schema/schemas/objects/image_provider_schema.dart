import 'package:json_theme/json_theme_schemas.dart';

class ImageProviderSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/image_provider';

  static final schemas = {
    '$id#asset': {
      r'$schema': 'http://json-schema.org/draft-06/schema#',
      r'$id': '$id#asset',
      'title': 'ImageProvider',
      'type': 'object',
      'additionalProperties': false,
      'required': [
        'assetName',
        'type',
      ],
      'properties': {
        'assetName': SchemaHelper.stringSchema,
        'package': SchemaHelper.stringSchema,
        'type': {
          'type': 'string',
          'enum': [
            'asset',
          ],
        },
      },
    },
    '$id#memory': {
      r'$schema': 'http://json-schema.org/draft-06/schema#',
      r'$id': '$id#memory',
      'title': 'ImageProvider',
      'type': 'object',
      'additionalProperties': false,
      'required': [
        'bytes',
        'type',
      ],
      'properties': {
        'bytes': SchemaHelper.stringSchema,
        'scale': SchemaHelper.numberSchema,
        'type': {
          'type': 'string',
          'enum': [
            'memory',
          ],
        },
      },
    },
    '$id#network': {
      r'$schema': 'http://json-schema.org/draft-06/schema#',
      r'$id': '$id#network',
      'title': 'ImageProvider',
      'type': 'object',
      'additionalProperties': false,
      'required': [
        'type',
        'url',
      ],
      'properties': {
        'headers': SchemaHelper.anySchema,
        'scale': SchemaHelper.numberSchema,
        'type': {
          'type': 'string',
          'enum': [
            'memory',
          ],
        },
        'url': SchemaHelper.stringSchema,
      },
    },
  };
}
