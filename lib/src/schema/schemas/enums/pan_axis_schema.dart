import 'package:json_theme/json_theme_schemas.dart';

class PanAxisSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/pan_axis.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/widgets/PanAxis.html',
    'type': 'string',
    'title': 'PanAxis',
    'oneOf': SchemaHelper.enumSchema([
      'aligned',
      'free',
      'horizontal',
      'vertical',
    ]),
  };
}
