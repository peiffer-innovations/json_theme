import 'package:json_theme/json_theme_schemas.dart';

class BorderStyleSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/border_style';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'BorderStyle',
    'oneOf': SchemaHelper.enumSchema([
      'none',
      'solid',
    ]),
  };
}
