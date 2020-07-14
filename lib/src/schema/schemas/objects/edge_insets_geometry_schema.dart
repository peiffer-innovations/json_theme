import 'package:json_theme/json_theme_schemas.dart';

class EdgeInsetsGeometrySchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/edge_insets_geometry';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'EdgeInsetsGeometry',
    'oneOf': [
      {
        'type': 'string',
      },
      {
        'type': 'number',
      },
      {
        'type': 'array',
        'array': [
          {
            'type': 'number',
          },
        ]
      },
      {
        'type': 'object',
        'properties': {
          'bottom': SchemaHelper.numberSchema,
          'left': SchemaHelper.numberSchema,
          'right': SchemaHelper.numberSchema,
          'top': SchemaHelper.numberSchema,
        },
      },
    ],
  };
}
