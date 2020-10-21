import 'package:json_theme/json_theme_schemas.dart';

class OutlinedBorderSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/outlined_border';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'OutlinedBorder',
    'type': 'object',
    'properties': {
      'borderRadius': SchemaHelper.objectSchema(BorderRadiusSchema.id),
      'borderSide': SchemaHelper.objectSchema(BorderSideSchema.id),
      'type': {
        'type': 'string',
        'enum': [
          'beveled',
          'circle',
          'rectangle',
          'rounded',
          'stadium',
        ],
      },
    },
  };
}
