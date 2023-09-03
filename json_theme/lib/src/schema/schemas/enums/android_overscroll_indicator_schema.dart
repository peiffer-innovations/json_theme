import 'package:json_theme/json_theme_schemas.dart';

class AndroidOverscrollIndicatorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/android_overscroll_indicator.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/AndroidOverscrollIndicator-class.html',
    'type': 'string',
    'title': 'AndroidOverscrollIndicator',
    'oneOf': SchemaHelper.enumSchema([
      'glow',
      'stretch',
    ]),
  };
}
