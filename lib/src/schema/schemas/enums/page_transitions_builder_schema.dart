import 'package:json_theme/json_theme_schemas.dart';

class PageTransitionsBuilderSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/page_transitions_builder.json';

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
