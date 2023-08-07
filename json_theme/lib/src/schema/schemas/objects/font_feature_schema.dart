import 'package:json_theme/json_theme_schemas.dart';

class FontFeatureSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/font_feature.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    'title': 'FontFeature',
    r'$comment':
        'https://api.flutter.dev/flutter/dart-ui/FontFeature-class.html',
    'type': 'object',
    'properties': {
      'feature': SchemaHelper.stringSchema,
      'value': SchemaHelper.numberSchema,
    },
  };
}
