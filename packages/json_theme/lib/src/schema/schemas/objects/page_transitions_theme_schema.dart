import 'package:json_theme/json_theme_schemas.dart';

class PageTransitionsThemeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/page_transitions_theme.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/PageTransitionsTheme-class.html',
    'title': 'PageTransitionsTheme',
    'type': 'object',
    'properties': {'builders': SchemaHelper.anySchema},
  };
}
