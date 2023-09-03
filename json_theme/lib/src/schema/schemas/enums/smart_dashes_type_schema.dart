import 'package:json_theme/json_theme_schemas.dart';

class SmartDashesTypeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/smart_dashes_type.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/services/SmartDashesType-class.html',
    'title': 'SmartDashesType',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'disabled',
      'enabled',
    ]),
  };
}
