import 'package:json_theme/json_theme_schemas.dart';

class InteractiveInkFeatureFactorySchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/interactive_ink_feature_factory';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'InteractiveInkFeatureFactory',
    'oneOf': SchemaHelper.enumSchema([
      'splash',
      'ripple',
    ]),
  };
}
