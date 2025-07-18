import 'package:json_theme/json_theme_schemas.dart';

class CrossAxisAlignmentSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/cross_axis_alignment.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/rendering/CrossAxisAlignment-class.html',
    'type': 'string',
    'title': 'CrossAxisAlignment',
    'oneOf': SchemaHelper.enumSchema([
      'baseline',
      'center',
      'end',
      'start',
      'stretch',
    ]),
  };
}
