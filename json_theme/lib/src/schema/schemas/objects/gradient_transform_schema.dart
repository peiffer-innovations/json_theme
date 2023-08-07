import 'package:json_theme/json_theme_schemas.dart';

class GradientTransformSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/gradient_transform.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/painting/GradientTransform-class.html',
    'title': 'GradientTransform',
    'type': 'object',
    'properties': {
      'radians': SchemaHelper.numberSchema,
    },
  };
}
