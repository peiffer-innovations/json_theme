import 'package:json_theme/json_theme_schemas.dart';

class FontFeatureSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/font_feature';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'FontFeature',
    'type': 'object',
    'properties': {
      'feature': SchemaHelper.stringSchema,
      'value': SchemaHelper.numberSchema,
    },
  };
}
