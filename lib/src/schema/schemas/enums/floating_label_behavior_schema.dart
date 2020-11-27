import 'package:json_theme/json_theme_schemas.dart';

class FloatingLabelBehaviorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/floating_label_behavior.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/FloatingLabelBehavior-class.html',
    'type': 'string',
    'title': 'FloatingLabelBehavior',
    'oneOf': SchemaHelper.enumSchema([
      'always',
      'auto',
      'never',
    ]),
  };
}
