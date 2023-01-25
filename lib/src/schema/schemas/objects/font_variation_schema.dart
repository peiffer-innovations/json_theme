import 'package:json_theme/json_theme_schemas.dart';

class FontVariationSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/font_variation.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/dart-ui/FontVariation-class.html',
    'type': 'object',
    'title': 'FontVariation',
    'additionalProperties': false,
    'required': [
      'axis',
      'value',
    ],
    'properties': {
      'axis': SchemaHelper.stringSchema,
      'value': SchemaHelper.numberSchema,
    },
  };
}
