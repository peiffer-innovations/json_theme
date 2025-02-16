import 'package:json_theme/json_theme_schemas.dart';

class OverflowBoxFitSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/overflow_box_fit.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/rendering/OverflowBoxFit.html',
    'title': 'OverflowBoxFit',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema(['deferToChild', 'max']),
  };
}
