import 'package:json_theme/json_theme_schemas.dart';

class TextWidthBasisSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/text_width_basis.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/painting/TextWidthBasis-class.html',
    'title': 'TextWidthBasis',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'longestLine',
      'parent',
    ]),
  };
}
