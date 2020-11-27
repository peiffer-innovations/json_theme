import 'package:json_theme/json_theme_schemas.dart';

class TextHeightBehaviorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/text_height_behavior.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/dart-ui/TextHeightBehavior-class.html',
    'title': 'TextHeightBehavior',
    'type': 'object',
    'properties': {
      'applyHeightToFirstAscent': SchemaHelper.boolSchema,
      'applyHeightToLastDescent': SchemaHelper.boolSchema,
    },
  };
}
