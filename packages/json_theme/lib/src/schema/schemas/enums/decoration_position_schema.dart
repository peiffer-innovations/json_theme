import 'package:json_theme/json_theme_schemas.dart';

class DecorationPositionSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/decoration_position.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/rendering/DecorationPosition-class.html',
    'type': 'string',
    'title': 'DecorationPosition',
    'oneOf': SchemaHelper.enumSchema(['background', 'foreground']),
  };
}
