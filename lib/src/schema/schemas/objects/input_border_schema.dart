import 'package:json_theme/json_theme_schemas.dart';

class InputBorderSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/input_border';

  static final schemas = {
    '$id#circular': {
      r'$schema': 'http://json-schema.org/draft-06/schema#',
      r'$id': '$id#circular',
      'title': 'InputBorder',
      'type': 'object',
      'required': [
        'radius',
        'type',
      ],
      'properties': {
        'borderRadius': SchemaHelper.objectSchema(BorderRadiusSchema.id),
        'borderSide': SchemaHelper.objectSchema(BorderSideSchema.id),
        'gapPadding': SchemaHelper.numberSchema,
        'type': {
          'type': 'string',
          'enum': [
            'outline',
          ],
        },
      },
    },
    '$id#elliptical': {
      r'$schema': 'http://json-schema.org/draft-06/schema#',
      r'$id': '$id#elliptical',
      'title': 'InputBorder',
      'type': 'object',
      'properties': {
        'borderRadius': SchemaHelper.objectSchema(BorderRadiusSchema.id),
        'borderSide': SchemaHelper.objectSchema(BorderSideSchema.id),
        'type': {
          'type': 'string',
          'enum': [
            'underline',
          ],
        },
      },
    },
  };
}
