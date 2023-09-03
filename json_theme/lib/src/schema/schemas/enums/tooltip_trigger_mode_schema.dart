import 'package:json_theme/json_theme_schemas.dart';

class TooltipTriggerModeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/tooltip_trigger_mode.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/TooltipTriggerMode-class.html',
    'title': 'TooltipTriggerMode',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'longPress',
      'manual',
      'tap',
    ]),
  };
}
