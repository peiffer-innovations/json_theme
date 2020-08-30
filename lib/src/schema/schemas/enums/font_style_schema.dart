import 'package:json_theme/json_theme_schemas.dart';

class FontStyleSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/font_style';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'FontStyle',
    'oneOf': SchemaHelper.enumSchema([
      'italic',
      'normal',
    ]),
  };
}
