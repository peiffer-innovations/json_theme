import 'package:json_theme/json_theme_schemas.dart';

class SnackBarThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/snack_bar_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/SnackBarThemeData-class.html',
    'title': 'SnackBarThemeData',
    'type': 'object',
    'properties': {
      'actionBackgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'actionOverflowThreshold': SchemaHelper.numberSchema,
      'actionTextColor': SchemaHelper.objectSchema(ColorSchema.id),
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'behavior': SchemaHelper.objectSchema(SnackBarBehaviorSchema.id),
      'closeIconColor': SchemaHelper.objectSchema(ColorSchema.id),
      'contentTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'disabledActionBackgroundColor':
          SchemaHelper.objectSchema(ColorSchema.id),
      'disabledActionTextColor': SchemaHelper.objectSchema(ColorSchema.id),
      'dismissDirection': SchemaHelper.objectSchema(DismissDirectionSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'insetPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'showCloseIcon': SchemaHelper.boolSchema,
      'width': SchemaHelper.numberSchema,
    },
  };
}
