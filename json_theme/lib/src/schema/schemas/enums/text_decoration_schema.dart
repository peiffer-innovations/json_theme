import 'package:json_theme/json_theme_schemas.dart';

class TextDecorationSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/text_decoration.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/dart-ui/TextDecoration-class.html',
    'title': 'TextDecoration',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'lineThrough',
      'none',
      'overline',
      'underline',
    ]),
  };
}
