import 'package:json_theme/json_theme_schemas.dart';

class TextDirectionSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/text_direction.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/dart-ui/TextDirection-class.html',
    'title': 'TextDirection',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'ltr',
      'rtl',
    ]),
  };
}
