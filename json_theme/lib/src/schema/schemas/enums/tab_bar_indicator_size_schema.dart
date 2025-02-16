import 'package:json_theme/json_theme_schemas.dart';

class TabBarIndicatorSizeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/tab_bar_indicator_size.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/TabBarIndicatorSize-class.html',
    'title': 'TabBarIndicatorSize',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema(['label', 'tab']),
  };
}
