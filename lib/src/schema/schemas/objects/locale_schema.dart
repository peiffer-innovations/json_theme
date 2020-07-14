import 'package:json_theme/json_theme_schemas.dart';

class LocaleSchema {
  static const id = 'https://peifferinnovations.com/json_theme/schemas/locale';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'Locale',
    'type': 'object',
    'properties': {
      'countryCode': SchemaHelper.stringSchema,
      'languageCode': SchemaHelper.stringSchema,
    },
  };
}
