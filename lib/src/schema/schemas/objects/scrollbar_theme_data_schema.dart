import 'package:json_theme/json_theme_schemas.dart';

class ScrollbarThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/scrollbar_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/ScrollbarThemeData-class.html',
    'title': 'SwitchThemeDataSchema',
    'type': 'object',
    'properties': {
      'crossAxisMargin': SchemaHelper.numberSchema,
      'isAlwaysShown': SchemaHelper.boolSchema,
      'mainAxisMargin': SchemaHelper.numberSchema,
      'minThumbLength': SchemaHelper.numberSchema,
      'radius': SchemaHelper.objectSchema(RadiusSchema.id),
      'showTrackOnHover': SchemaHelper.boolSchema,
      'thickness': SchemaHelper.numberSchema,
    },
  };
}
