import 'package:json_theme/json_theme_schemas.dart';

class Matrix4Schema {
  static const id = 'https://peifferinnovations.com/json_theme/schemas/matrix4';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'Matrix4',
    'type': 'array',
    'items': SchemaHelper.numberSchema,
  };
}
