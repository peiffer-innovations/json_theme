import 'package:json_theme/json_theme_schemas.dart';

class ShowValueIndicatorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/show_value_indicator.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/ShowValueIndicator-class.html',
    'type': 'string',
    'title': 'ShowValueIndicator',
    'oneOf': SchemaHelper.enumSchema([
      'always',
      'never',
      'onlyForContinuous',
      'onlyForDiscrete',
    ]),
  };
}
