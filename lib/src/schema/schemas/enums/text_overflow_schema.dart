import 'package:json_theme/json_theme_schemas.dart';

class TextOverflowSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/text_overflow';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
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
