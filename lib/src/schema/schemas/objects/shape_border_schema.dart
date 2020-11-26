import 'package:json_theme/json_theme_schemas.dart';

class ShapeBorderSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/shape_border.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'ShapeBorder',
    'type': 'object',
    'properties': {
      'borderRadius': SchemaHelper.objectSchema(BorderRadiusSchema.id),
      'borderSide': SchemaHelper.objectSchema(BorderSideSchema.id),
      'type': {
        'type': 'string',
        'enum': [
          'circle',
          'rectangle',
          'rounded',
          'stadium',
        ],
      },
    },
  };
}
