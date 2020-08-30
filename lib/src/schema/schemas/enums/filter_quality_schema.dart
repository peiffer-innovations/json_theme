import 'package:json_theme/json_theme_schemas.dart';

class FilterQualitySchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/filter_quality';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'FilterQuality',
    'oneOf': SchemaHelper.enumSchema([
      'high',
      'low',
      'medium',
      'none',
    ]),
  };
}
