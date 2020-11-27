import 'package:json_theme/json_theme_schemas.dart';

class VerticalDirectionSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/vertical_direction.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/painting/VerticalDirection-class.html',
    'title': 'VerticalDirection',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'down',
      'up',
    ]),
  };
}
