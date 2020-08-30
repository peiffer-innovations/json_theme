import 'package:json_theme/json_theme_schemas.dart';

class NotchedShapeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/notched_shape';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'NotchedShape',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'circular',
    ]),
  };
}
