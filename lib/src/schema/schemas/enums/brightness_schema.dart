import 'package:json_theme/json_theme_schemas.dart';

class BrightnessSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/brightness';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'Brightness',
    'oneOf': SchemaHelper.enumSchema([
      'dark',
      'light',
    ]),
  };
}
