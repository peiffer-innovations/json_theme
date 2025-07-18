import 'package:json_theme/json_theme_schemas.dart';

class AlignmentSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/alignment.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/painting/Alignment-class.html',
    'title': 'Alignment',
    'oneOf': [
      {'type': 'string'},
      {
        'type': 'object',
        'required': ['x', 'y'],
        'properties': {
          'x': SchemaHelper.numberSchema,
          'y': SchemaHelper.numberSchema,
        },
      },
    ],
  };
}
