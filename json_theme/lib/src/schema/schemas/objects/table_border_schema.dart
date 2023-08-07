import 'package:json_theme/json_theme_schemas.dart';

class TableBorderSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/table_border.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/rendering/TableBorder-class.html',
    'title': 'TableBorder',
    'type': 'object',
    'properties': {
      'borderRadius': SchemaHelper.objectSchema(BorderRadiusSchema.id),
      'bottom': SchemaHelper.objectSchema(BorderSideSchema.id),
      'horizontalInside': SchemaHelper.objectSchema(BorderSideSchema.id),
      'left': SchemaHelper.objectSchema(BorderSideSchema.id),
      'right': SchemaHelper.objectSchema(BorderSideSchema.id),
      'top': SchemaHelper.objectSchema(BorderSideSchema.id),
      'verticalInside': SchemaHelper.objectSchema(BorderSideSchema.id),
    },
  };
}
