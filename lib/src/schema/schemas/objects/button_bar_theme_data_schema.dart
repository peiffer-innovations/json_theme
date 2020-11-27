import 'package:json_theme/json_theme_schemas.dart';

class ButtonBarThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/button_bar_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/ButtonBarThemeData-class.html',
    'title': 'ButtonThemeData',
    'type': 'object',
    'properties': {
      'alignment': SchemaHelper.objectSchema(MainAxisAlignmentSchema.id),
      'buttonAlignedDropdown': SchemaHelper.boolSchema,
      'buttonHeight': SchemaHelper.numberSchema,
      'buttonMinWidth': SchemaHelper.numberSchema,
      'buttonPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'buttonTextTheme': SchemaHelper.objectSchema(ButtonTextThemeSchema.id),
      'layoutBehavior':
          SchemaHelper.objectSchema(ButtonBarLayoutBehaviorSchema.id),
      'mainAxisSize': SchemaHelper.objectSchema(MainAxisSizeSchema.id),
      'overflowDirection':
          SchemaHelper.objectSchema(VerticalDirectionSchema.id),
    },
  };
}
