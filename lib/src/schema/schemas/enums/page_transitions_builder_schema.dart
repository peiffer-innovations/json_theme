import 'package:json_theme/json_theme_schemas.dart';

class PageTransitionsBuilderSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/page_transitions_builder';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'PageTransitionsBuilder',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'cupertino',
      'fadeUpwards',
      'openUpwards',
      'zoom',
    ]),
  };
}
