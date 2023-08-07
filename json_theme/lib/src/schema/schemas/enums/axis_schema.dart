import 'package:json_theme/json_theme_schemas.dart';

class AxisSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/axis.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment': 'https://api.flutter.dev/flutter/painting/Axis-class.html',
    'type': 'string',
    'title': 'Axis',
    'oneOf': SchemaHelper.enumSchema([
      'horizontal',
      'vertical',
    ]),
  };
}
