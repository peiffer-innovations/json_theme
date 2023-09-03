import 'package:json_theme/json_theme_schemas.dart';

class BorderStyleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/border_style.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/painting/BorderStyle-class.html',
    'type': 'string',
    'title': 'BorderStyle',
    'oneOf': SchemaHelper.enumSchema([
      'none',
      'solid',
    ]),
  };
}
