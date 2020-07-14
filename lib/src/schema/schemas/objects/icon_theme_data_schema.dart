import 'package:json_theme/json_theme_schemas.dart';

class IconThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/icon_theme_data';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'IconThemeData',
    'type': 'object',
    'properties': {
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'opacity': SchemaHelper.numberSchema,
      'size': SchemaHelper.numberSchema,
    },
  };
}
