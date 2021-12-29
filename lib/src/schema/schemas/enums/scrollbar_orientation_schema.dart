import 'package:json_theme/json_theme_schemas.dart';

class ScrollbarOrientationSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/scrollbar_orientation.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/ScrollbarOrientation.html',
    'type': 'string',
    'title': 'ScrollbarOrientation',
    'oneOf': SchemaHelper.enumSchema([
      'bottom',
      'left',
      'right',
      'top',
    ]),
  };
}
