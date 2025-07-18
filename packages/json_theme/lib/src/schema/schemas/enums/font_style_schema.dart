import 'package:json_theme/json_theme_schemas.dart';

class FontStyleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/font_style.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment': 'https://api.flutter.dev/flutter/dart-ui/FontStyle-class.html',
    'type': 'string',
    'title': 'FontStyle',
    'oneOf': SchemaHelper.enumSchema(['italic', 'normal']),
  };
}
