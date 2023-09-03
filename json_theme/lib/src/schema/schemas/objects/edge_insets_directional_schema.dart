import 'package:json_theme/json_theme_schemas.dart';

class EdgeInsetsDirectionalSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/edge_insets_directional.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'EdgeInsetsDirectional',
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
          'end': SchemaHelper.numberSchema,
          'start': SchemaHelper.numberSchema,
          'top': SchemaHelper.numberSchema,
        },
      },
    ],
  };
}
