import 'package:json_theme/json_theme_schemas.dart';

class OffsetSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/offset.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'Offset',
    'type': 'object',
    'required': [
      'dx',
      'dy',
    ],
    'properties': {
      'dx': SchemaHelper.numberSchema,
      'dy': SchemaHelper.numberSchema,
    },
  };
}
