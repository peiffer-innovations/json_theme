import 'package:json_theme/json_theme_schemas.dart';

class EdgeInsetsGeometrySchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/edge_insets_geometry.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/painting/EdgeInsetsGeometry-class.html',
    'title': 'EdgeInsetsGeometry',
    'anyOf': [
      {r'$ref': EdgeInsetsSchema.id},
      {r'$ref': EdgeInsetsDirectionalSchema.id},
    ],
  };
}
