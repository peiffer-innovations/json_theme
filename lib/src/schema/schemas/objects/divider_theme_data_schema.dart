import 'package:json_theme/json_theme_schemas.dart';

class DividerThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/divider_theme_data';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'DividerThemeData',
    'type': 'object',
    'properties': {
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'endIndent': SchemaHelper.numberSchema,
      'indent': SchemaHelper.numberSchema,
      'space': SchemaHelper.numberSchema,
      'thickness': SchemaHelper.numberSchema,
    },
  };
}
