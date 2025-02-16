import 'package:json_theme/json_theme_schemas.dart';

class DragStartBehaviorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/drag_start_behavior.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/gestures/DragStartBehavior-class.html',
    'type': 'string',
    'title': 'DragStartBehavior',
    'oneOf': SchemaHelper.enumSchema(['down', 'start']),
  };
}
