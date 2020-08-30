import 'package:json_theme/json_theme_schemas.dart';

class MainAxisSizeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/main_axis_size';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'MainAxisSize',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'max',
      'min',
    ]),
  };
}
