import 'package:json_theme/json_theme_schemas.dart';

class TextOverflowSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/text_overflow.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/rendering/TextOverflow-class.html',
    'title': 'TextOverflow',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'clip',
      'ellipsis',
      'fade',
      'visible',
    ]),
  };
}
