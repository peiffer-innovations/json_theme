import 'package:json_theme/json_theme_schemas.dart';

class TextButtonThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/text_button_theme_data';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'id': '$id',
    'title': 'TextButtonThemeData',
    'additionalProperties': false,
    'properties': {
      'style': SchemaHelper.objectSchema(ButtonStyleSchema.id),
    },
  };
}
