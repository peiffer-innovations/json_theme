import 'package:json_theme/json_theme_schemas.dart';

class TextBaselineSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/text_baseline';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TextBaseline',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'alphabetic',
      'ideographic',
    ]),
  };
}
