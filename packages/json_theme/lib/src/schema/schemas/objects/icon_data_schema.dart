import 'package:json_theme/json_theme_schemas.dart';

class IconDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/icon_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/IconData-class.html',
    'title': 'IconData',
    'type': 'object',
    'required': ['codePoint', 'fontFamily'],
    'properties': {
      'codePoint': SchemaHelper.numberSchema,
      'fontFamily': SchemaHelper.stringSchema,
      'fontFamilyFallback': {
        'anyOf': [
          {'type': 'string'},
          {
            'type': 'array',
            'items': {'type': 'string'},
          },
        ],
      },
      'fontPackage': SchemaHelper.stringSchema,
      'matchTextDirection': SchemaHelper.boolSchema,
    },
  };
}
