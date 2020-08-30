import 'package:json_theme/json_theme_schemas.dart';

class TextCapitalizationSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/text_capitalization';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
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
