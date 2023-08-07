import 'package:json_theme/json_theme_schemas.dart';

class FloatingActionButtonLocationSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/floating_action_button_location.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/FloatingActionButtonLocation-class.html',
    'type': 'string',
    'title': 'FloatingActionButtonLocation',
    'oneOf': SchemaHelper.enumSchema([
      'centerDocked',
      'centerFloat',
      'centerTop',
      'endDocked',
      'endFloat',
      'endTop',
      'miniCenterDocked',
      'miniCenterFloat',
      'miniCenterTop',
      'miniEndDocked',
      'miniEndFloat',
      'miniEndTop',
      'miniStartDocked',
      'miniStartFloat',
      'miniStartTop',
      'startDocked',
      'startFloat',
      'startTop',
    ]),
  };
}
