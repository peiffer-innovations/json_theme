import 'package:json_theme/json_theme_schemas.dart';

class OutlinedButtonThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/outlined_button_theme_data';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'id': '$id',
    'title': 'OutlinedButtonThemeData',
    'additionalProperties': false,
    'properties': {
      'style': SchemaHelper.objectSchema(ButtonStyleSchema.id),
    },
  };
}
