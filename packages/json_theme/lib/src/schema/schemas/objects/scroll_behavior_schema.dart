import 'package:json_theme/json_theme_schemas.dart';

class ScrollBehaviorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/scroll_behavior.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/ScrollBehavior-class.html',
    'title': 'ScrollBehavior',
    'type': 'object',
    'properties': {
      'androidOverscrollIndicator': SchemaHelper.objectSchema(
        AndroidOverscrollIndicatorSchema.id,
      ),
    },
  };
}
