import 'package:json_theme/json_theme_schemas.dart';

class SizeSchema {
  static const id = 'https://peifferinnovations.com/json_theme/schemas/size';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'id': '$id',
    'title': 'Size',
    'additionalProperties': false,
    'properties': {
      'height': SchemaHelper.numberSchema,
      'width': SchemaHelper.numberSchema,
    },
  };
}
