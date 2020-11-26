import 'package:json_theme/json_theme_schemas.dart';

class ElevatedButtonThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/elevated_button_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'ElevatedButtonThemeData',
    'additionalProperties': false,
    'properties': {
      'style': SchemaHelper.objectSchema(ButtonStyleSchema.id),
    },
  };
}
