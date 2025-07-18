import 'package:json_theme/json_theme_schemas.dart';

class BlurStyleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/blur_style.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/painting/BoxShadow/blurStyle.html',
    'type': 'string',
    'title': 'BlurStyle',
    'oneOf': SchemaHelper.enumSchema(['inner', 'normal', 'outer', 'solid']),
  };
}
