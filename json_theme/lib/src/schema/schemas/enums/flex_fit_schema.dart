import 'package:json_theme/json_theme_schemas.dart';

class FlexFitSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/flex_fit.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment': 'https://api.flutter.dev/flutter/rendering/FlexFit-class.html',
    'type': 'string',
    'title': 'FlexFit',
    'oneOf': SchemaHelper.enumSchema([
      'loose',
      'tight',
    ]),
  };
}
