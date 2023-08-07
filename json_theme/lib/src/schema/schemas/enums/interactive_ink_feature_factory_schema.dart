import 'package:json_theme/json_theme_schemas.dart';

class InteractiveInkFeatureFactorySchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/interactive_ink_feature_factory.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/InteractiveInkFeatureFactory-class.html',
    'type': 'string',
    'title': 'InteractiveInkFeatureFactory',
    'oneOf': SchemaHelper.enumSchema([
      'splash',
      'ripple',
      'sparkle',
    ]),
  };
}
