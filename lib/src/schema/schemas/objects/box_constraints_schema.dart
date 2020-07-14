import 'package:json_theme/json_theme_schemas.dart';

class BoxConstraintsSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/box_constraints';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'BoxConstraints',
    'additionalProperties': false,
    'properties': {
      'maxHeight': SchemaHelper.numberSchema,
      'maxWidth': SchemaHelper.numberSchema,
      'minHeight': SchemaHelper.numberSchema,
      'minWidth': SchemaHelper.numberSchema,
    },
  };
}
