import 'package:json_theme/json_theme_schemas.dart';

class StrutStyleSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/strut_style';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'StrutStyle',
    'type': 'object',
    'properties': {
      'fontFamily': SchemaHelper.stringSchema,
      'fontFamilyFallback': {
        'type': 'array',
        'items': SchemaHelper.stringSchema,
      },
      'fontSize': SchemaHelper.numberSchema,
      'fontStyle': SchemaHelper.objectSchema(FontStyleSchema.id),
      'fontWeight': SchemaHelper.objectSchema(FontWeightSchema.id),
      'forceStrutHeight': SchemaHelper.boolSchema,
      'height': SchemaHelper.numberSchema,
      'leading': SchemaHelper.numberSchema,
      'package': SchemaHelper.stringSchema,
    },
  };
}
