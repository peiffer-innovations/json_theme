import 'package:json_theme/json_theme_schemas.dart';

class ProgressIndicatorThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/progress_indicator_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/ProgressIndicatorThemeData-class.html',
    'title': 'ProgressIndicatorThemeData',
    'type': 'object',
    'properties': {
      'borderRadius': SchemaHelper.objectSchema(BorderRadiusSchema.id),
      'circularTrackColor': SchemaHelper.objectSchema(ColorSchema.id),
      'circularTrackPadding': SchemaHelper.objectSchema(
        EdgeInsetsGeometrySchema.id,
      ),
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'constraints': SchemaHelper.objectSchema(BoxConstraintsSchema.id),
      'linearMinHeight': SchemaHelper.numberSchema,
      'linearTrackColor': SchemaHelper.objectSchema(ColorSchema.id),
      'refreshBackgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'stopIndicatorColor': SchemaHelper.objectSchema(ColorSchema.id),
      'stopIndicatorRadius': SchemaHelper.numberSchema,
      'strokeAlign': SchemaHelper.numberSchema,
      'strokeWidth': SchemaHelper.numberSchema,
      'trackGap': SchemaHelper.numberSchema,
    },
  };
}
