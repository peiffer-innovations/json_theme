import 'package:json_theme/json_theme_schemas.dart';

class BoxBorderSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/box_border.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/painting/BoxBorder-class.html',
    'oneOf': [
      SchemaHelper.objectSchema(BorderSideSchema.id),
      {
        'type': 'object',
        'title': 'BoxBorder',
        'additionalProperties': false,
        'properties': {
          'bottom': SchemaHelper.objectSchema(BorderSideSchema.id),
          'left': SchemaHelper.objectSchema(BorderSideSchema.id),
          'right': SchemaHelper.objectSchema(BorderSideSchema.id),
          'top': SchemaHelper.objectSchema(BorderSideSchema.id),
        },
      },
    ],
  };
}
