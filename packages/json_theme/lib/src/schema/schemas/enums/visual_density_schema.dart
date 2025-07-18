import 'package:json_theme/json_theme_schemas.dart';

class VisualDensitySchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/visual_density.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/VisualDensity-class.html',
    'title': 'VisualDensity',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'adaptivePlatformDensity',
      'comfortable',
      'compact',
      'standard',
    ]),
  };
}
