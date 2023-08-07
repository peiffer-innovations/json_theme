import 'package:json_theme/json_theme_schemas.dart';

class MaterialStatePropertyEdgeInsetsGeometrySchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/material_state_property_edge_insets_geometry.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/MaterialStateProperty-class.html',
    'title': 'MaterialStatePropertyEdgeInsetsGeometry',
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
          'disabled': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'dragged': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'empty': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'error': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'focused': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'hovered': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'pressed': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'scrolledUnder':
              SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'selected': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
        },
      }
    ]
  };
}
