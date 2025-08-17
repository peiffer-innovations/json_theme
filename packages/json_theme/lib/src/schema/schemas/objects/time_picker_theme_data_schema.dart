import 'package:json_theme/json_theme_schemas.dart';

class TimePickerThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/time_picker_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/TimePickerThemeData-class.html',
    'title': 'TimePickerThemeData',
    'type': 'object',
    'properties': {
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'cancelButtonStyle': SchemaHelper.objectSchema(ButtonStyleSchema.id),
      'confirmButtonStyle': SchemaHelper.objectSchema(ButtonStyleSchema.id),
      'dayPeriodBorderSide': SchemaHelper.objectSchema(BorderSideSchema.id),
      'dayPeriodColor': SchemaHelper.objectSchema(ColorSchema.id),
      'dayPeriodShape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'dayPeriodTextColor': SchemaHelper.objectSchema(ColorSchema.id),
      'dayPeriodTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'dialBackgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'dialHandColor': SchemaHelper.objectSchema(ColorSchema.id),
      'dialTextColor': SchemaHelper.objectSchema(ColorSchema.id),
      'dialTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'entryModeIconColor': SchemaHelper.objectSchema(ColorSchema.id),
      'helpTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'hourMinuteColor': SchemaHelper.objectSchema(ColorSchema.id),
      'hourMinuteShape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'hourMinuteTextColor': SchemaHelper.objectSchema(ColorSchema.id),
      'hourMinuteTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'inputDecorationTheme': SchemaHelper.objectSchema(
        InputDecorationThemeDataSchema.id,
      ),
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'timeSelectorSeparatorColor': SchemaHelper.objectSchema(
        WidgetStatePropertyColorSchema.id,
      ),
      'timeSelectorSeparatorTextStyle': SchemaHelper.objectSchema(
        WidgetStatePropertyTextStyleSchema.id,
      ),
    },
  };
}
