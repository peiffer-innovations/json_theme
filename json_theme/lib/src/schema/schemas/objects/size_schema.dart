import 'package:json_theme/json_theme_schemas.dart';

class SizeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/size.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment': 'https://api.flutter.dev/flutter/dart-ui/Size-class.html',
    'title': 'Size',
    'additionalProperties': false,
    'required': ['height', 'width'],
    'properties': {
      'height': SchemaHelper.numberSchema,
      'width': SchemaHelper.numberSchema,
    },
  };
}
