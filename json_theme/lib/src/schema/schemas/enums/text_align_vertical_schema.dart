import 'package:json_theme/json_theme_schemas.dart';

class TextAlignVerticalSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/text_align_vertical.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/painting/TextAlignVertical-class.html',
    'title': 'TextAlignVertical',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'bottom',
      'center',
      'top',
    ]),
  };
}
