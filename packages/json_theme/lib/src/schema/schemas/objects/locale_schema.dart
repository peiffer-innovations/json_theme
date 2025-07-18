import 'package:json_theme/json_theme_schemas.dart';

class LocaleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/locale.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment': 'https://api.flutter.dev/flutter/dart-ui/Locale-class.html',
    'title': 'Locale',
    'type': 'object',
    'properties': {
      'countryCode': SchemaHelper.stringSchema,
      'languageCode': SchemaHelper.stringSchema,
    },
  };
}
