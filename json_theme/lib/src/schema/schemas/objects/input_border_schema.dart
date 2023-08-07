import 'package:json_theme/json_theme_schemas.dart';

class InputBorderSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/input_border.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/InputBorder-class.html',
    'title': 'InputBorder',
    'type': 'object',
    'required': [
      'type',
    ],
    'properties': {
      'borderRadius': SchemaHelper.objectSchema(BorderRadiusSchema.id),
      'borderSide': SchemaHelper.objectSchema(BorderSideSchema.id),
      'gapPadding': SchemaHelper.numberSchema,
      'type': {
        'type': 'string',
        'enum': [
          'outline',
          'underline',
        ],
      },
    },
  };
}
