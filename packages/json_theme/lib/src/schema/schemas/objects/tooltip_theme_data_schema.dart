import 'package:json_theme/json_theme_schemas.dart';

class TooltipThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/tooltip_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/TooltipThemeData-class.html',
    'title': 'TooltipThemeData',
    'type': 'object',
    'properties': {
      'enableFeedback': SchemaHelper.boolSchema,
      'excludeFromSemantics': SchemaHelper.boolSchema,
      'exitDuration': SchemaHelper.numberSchema,
      'height': SchemaHelper.numberSchema,
      'margin': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'preferBelow': SchemaHelper.boolSchema,
      'showDuration': SchemaHelper.numberSchema,
      'triggerMode': SchemaHelper.objectSchema(TooltipTriggerModeSchema.id),
      'verticalOffset': SchemaHelper.numberSchema,
      'waitDuration': SchemaHelper.numberSchema,
    },
  };
}
