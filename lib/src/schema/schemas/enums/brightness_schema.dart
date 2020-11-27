import 'package:json_theme/json_theme_schemas.dart';

class BrightnessSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/brightness.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/dart-ui/Brightness-class.html',
    'type': 'string',
    'title': 'Brightness',
    'oneOf': SchemaHelper.enumSchema([
      'dark',
      'light',
    ]),
  };
}
