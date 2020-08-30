import 'package:json_theme/json_theme_schemas.dart';

class VerticalDirectionSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/vertical_direction';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'VerticalDirection',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'down',
      'up',
    ]),
  };
}
