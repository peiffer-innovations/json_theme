import 'package:json_theme/json_theme_schemas.dart';

class ButtonBarLayoutBehaviorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/button_bar_layout_behavior.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/ButtonBarLayoutBehavior-class.html',
    'type': 'string',
    'title': 'ButtonBarLayoutBehavior',
    'oneOf': SchemaHelper.enumSchema([
      'constrained',
      'padded',
    ]),
  };
}
