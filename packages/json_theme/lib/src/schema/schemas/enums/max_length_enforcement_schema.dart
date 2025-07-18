import 'package:json_theme/json_theme_schemas.dart';

class MaxLengthEnforcementSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/max_length_enforcement.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/services/MaxLengthEnforcement-class.html',
    'title': 'MaxLengthEnforcement',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'enforced',
      'none',
      'truncateAfterCompositionEnds',
    ]),
  };
}
