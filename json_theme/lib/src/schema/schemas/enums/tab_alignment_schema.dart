import 'package:json_theme/json_theme_schemas.dart';

class TabAlignmentSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/tab_alignment.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment': 'https://api.flutter.dev/flutter/material/TabAlignment.html',
    'type': 'string',
    'title': 'TabAlignment',
    'oneOf': SchemaHelper.enumSchema([
      'center',
      'fill',
      'start',
      'startOffset',
    ]),
  };
}
