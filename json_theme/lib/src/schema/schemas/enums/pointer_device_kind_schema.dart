import 'package:json_theme/json_theme_schemas.dart';

class PointerDeviceKindSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/pointer_device_kind.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/dart-ui/PointerDeviceKind.html',
    'type': 'string',
    'title': 'PointerDeviceKind',
    'oneOf': SchemaHelper.enumSchema([
      'invertedStylus',
      'mouse',
      'stylus',
      'touch',
      'trackpad',
      'unknown',
    ]),
  };
}
