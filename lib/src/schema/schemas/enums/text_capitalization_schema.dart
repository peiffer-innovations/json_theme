import 'package:json_theme/json_theme_schemas.dart';

class TextCapitalizationSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/text_capitalization.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/services/TextCapitalization-class.html',
    'title': 'TextCapitalization',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'characters',
      'none',
      'sentences',
      'words',
    ]),
  };
}
