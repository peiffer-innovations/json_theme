import 'package:json_theme/json_theme_schemas.dart';

class TextAlignVerticalSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/text_align_vertical';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TextAlignVertical',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'bottom',
      'center',
      'top',
    ]),
  };
}
