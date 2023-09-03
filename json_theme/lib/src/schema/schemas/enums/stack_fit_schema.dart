import 'package:json_theme/json_theme_schemas.dart';

class StackFitSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/stack_fit.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/rendering/StackFit-class.html',
    'title': 'StackFit',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'expand',
      'loose',
      'passthrough',
    ]),
  };
}
