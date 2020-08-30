import 'package:json_theme/json_theme_schemas.dart';

class TextDecorationStyleSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/text_decoration_style';

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
