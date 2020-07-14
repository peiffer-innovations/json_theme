import 'package:json_theme/json_theme_schemas.dart';

class TooltipThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/tooltip_theme_data';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TooltipThemeData',
    'type': 'object',
    'properties': {
      'excludeFromSemantics': SchemaHelper.boolSchema,
      'height': SchemaHelper.numberSchema,
      'margin': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'preferBelow': SchemaHelper.boolSchema,
      'showDuration': SchemaHelper.numberSchema,
      'verticalOffset': SchemaHelper.numberSchema,
      'waitDuration': SchemaHelper.numberSchema,
    },
  };
}
