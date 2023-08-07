import 'package:json_theme/json_theme_schemas.dart';

class Matrix4Schema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/matrix4.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/vector_math_64/Matrix4-class.html',
    'title': 'Matrix4',
    'type': 'array',
    'items': SchemaHelper.numberSchema,
  };
}
