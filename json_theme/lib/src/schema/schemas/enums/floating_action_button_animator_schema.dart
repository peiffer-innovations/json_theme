import 'package:json_theme/json_theme_schemas.dart';

class FloatingActionButtonAnimatorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/floating_action_button_animator.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/FloatingActionButtonAnimator-class.html',
    'type': 'string',
    'title': 'FloatingActionButtonAnimator',
    'oneOf': SchemaHelper.enumSchema(['noAnimation', 'scaling']),
  };
}
