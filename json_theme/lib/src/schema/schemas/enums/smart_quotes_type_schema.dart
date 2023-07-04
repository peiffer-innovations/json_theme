import 'package:json_theme/json_theme_schemas.dart';

class SmartQuotesTypeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/smart_quotes_type.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/services/SmartQuotesType-class.html',
    'title': 'SmartQuotesType',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'disabled',
      'enabled',
    ]),
  };
}
