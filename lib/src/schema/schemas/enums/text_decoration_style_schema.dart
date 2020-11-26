import 'package:json_theme/json_theme_schemas.dart';

class TextDecorationStyleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/text_decoration_style.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TextDecorationStyle',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'dashed',
      'dotted',
      'double',
      'solid',
      'wavy',
    ]),
  };
}
