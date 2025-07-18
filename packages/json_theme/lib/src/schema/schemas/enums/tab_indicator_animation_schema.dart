import 'package:json_theme/json_theme_schemas.dart';

class TabIndicatorAnimationSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/tab_indicator_animation.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'type': 'string',
    'title': 'TabIndicatorAnimationSchema',
    'oneOf': SchemaHelper.enumSchema(['elastic', 'linear']),
  };
}
