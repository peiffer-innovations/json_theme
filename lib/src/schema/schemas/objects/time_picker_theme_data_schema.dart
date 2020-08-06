import 'package:json_theme/json_theme_schemas.dart';

class TimePickerThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/time_picker_theme_data';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TimePickerThemeData',
    'type': 'object',
    'properties': {
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'dayPeriodBorderSide': SchemaHelper.objectSchema(BorderSideSchema.id),
      'dayPeriodColor': SchemaHelper.objectSchema(ColorSchema.id),
      'dayPeriodShape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'dayPeriodTextColor': SchemaHelper.objectSchema(ColorSchema.id),
      'dayPeriodTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'dialBackgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'dialHandColor': SchemaHelper.objectSchema(ColorSchema.id),
      'dialTextColor': SchemaHelper.objectSchema(ColorSchema.id),
      'entryModeIconColor': SchemaHelper.objectSchema(ColorSchema.id),
      'helpTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'hourMinuteColor': SchemaHelper.objectSchema(ColorSchema.id),
      'hourMinuteShape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'hourMinuteTextColor': SchemaHelper.objectSchema(ColorSchema.id),
      'hourMinuteTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'inputDecorationTheme':
          SchemaHelper.objectSchema(InputDecorationThemeSchema.id),
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
    },
  };
}
