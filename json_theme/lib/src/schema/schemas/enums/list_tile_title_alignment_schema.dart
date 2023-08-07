import 'package:json_theme/json_theme_schemas.dart';

class ListTileTitleAlignmentSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/list_tile_title_alignment.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/ListTileTitleAlignment.html',
    'title': 'ListTileTitleAlignment',
    'oneOf': SchemaHelper.enumSchema([
      'bottom',
      'center',
      'threeLine',
      'titleHeight',
      'top',
    ]),
  };
}
