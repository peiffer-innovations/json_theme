import 'package:json_theme/json_theme_schemas.dart';

class VisualDensitySchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/visual_density';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'VisualDensity',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'adaptivePlatformDensity',
      'comfortable',
      'compact',
      'standard',
    ]),
  };
}
