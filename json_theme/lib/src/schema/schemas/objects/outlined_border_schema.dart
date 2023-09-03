import 'package:json_theme/json_theme_schemas.dart';

class OutlinedBorderSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/outlined_border.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/painting/OutlinedBorder-class.html',
    'title': 'OutlinedBorder',
    'type': 'object',
    'properties': {
      'borderRadius': SchemaHelper.objectSchema(BorderRadiusSchema.id),
      'borderSide': SchemaHelper.objectSchema(BorderSideSchema.id),
      'type': {
        'type': 'string',
        'enum': [
          'beveled',
          'circle',
          'rectangle',
          'rounded',
          'stadium',
        ],
      },
    },
  };
}
