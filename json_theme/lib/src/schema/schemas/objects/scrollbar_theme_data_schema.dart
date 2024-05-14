import 'package:json_theme/json_theme_schemas.dart';

class ScrollbarThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/scrollbar_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/ScrollbarThemeData-class.html',
    'title': 'SwitchThemeData',
    'type': 'object',
    'properties': {
      'crossAxisMargin': SchemaHelper.numberSchema,
      'interactive': SchemaHelper.boolSchema,
      'mainAxisMargin': SchemaHelper.numberSchema,
      'minThumbLength': SchemaHelper.numberSchema,
      'radius': SchemaHelper.objectSchema(RadiusSchema.id),
      'thickness': {
        'anyOf': [
          {
            'type': 'number',
          },
          {
            'type': 'string',
          },
          {
            r'$ref': WidgetStatePropertyDoubleSchema.id,
          },
        ],
      },
      'thumbColor': SchemaHelper.objectSchema(
        WidgetStatePropertyColorSchema.id,
      ),
      'thumbVisibility': SchemaHelper.objectSchema(
        WidgetStatePropertyBoolSchema.id,
      ),
      'trackBorderColor': SchemaHelper.objectSchema(
        WidgetStatePropertyColorSchema.id,
      ),
      'trackColor': SchemaHelper.objectSchema(
        WidgetStatePropertyColorSchema.id,
      ),
      'trackVisibility': SchemaHelper.objectSchema(
        WidgetStatePropertyBoolSchema.id,
      ),
    },
  };
}
