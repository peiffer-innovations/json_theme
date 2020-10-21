import 'package:json_theme/json_theme_schemas.dart';

class PageTransitionsThemeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/page_transitions_theme';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'PageTransitionsTheme',
    'type': 'object',
    'properties': {
      'builders': SchemaHelper.anySchema,
    },
  };
}
