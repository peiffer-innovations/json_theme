import 'package:json_theme/json_theme_schemas.dart';

class ScrollViewKeyboardDismissBehaviorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/scroll_view_keyboard_dismiss_behavior.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/ScrollViewKeyboardDismissBehavior-class.html',
    'type': 'string',
    'title': 'ScrollViewKeyboardDismissBehavior',
    'oneOf': SchemaHelper.enumSchema([
      'manual',
      'onDrag',
    ]),
  };
}
