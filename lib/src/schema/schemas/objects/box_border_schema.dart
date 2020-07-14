import 'package:json_theme/json_theme_schemas.dart';

class BoxBorderSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/box_border';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
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
