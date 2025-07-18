import 'package:json_theme/json_theme_schemas.dart';

class StrokeCapSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/stroke_cap.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'type': 'string',
    'title': 'StrokeCap',
    'oneOf': SchemaHelper.enumSchema(['butt', 'round', 'square']),
  };
}
