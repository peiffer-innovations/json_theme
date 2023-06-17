import 'package:json_theme/json_theme_schemas.dart';

class DatePickerThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/date_picker_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/DatePickerThemeData-class.html',
    'title': 'DatePickerThemeData',
    'additionalProperties': false,
    'properties': {
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'dayBackgroundColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      'dayForegroundColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      'dayOverlayColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      'dayStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'headerBackgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'headerForegroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'headerHeadlineStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'headerHelpStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'rangePickerBackgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'rangePickerElevation': SchemaHelper.numberSchema,
      'rangePickerHeaderBackgroundColor': SchemaHelper.objectSchema(
        ColorSchema.id,
      ),
      'rangePickerHeaderForegroundColor': SchemaHelper.objectSchema(
        ColorSchema.id,
      ),
      'rangePickerHeaderHeadlineStyle': SchemaHelper.objectSchema(
        TextStyleSchema.id,
      ),
      'rangePickerHeaderHelpStyle': SchemaHelper.objectSchema(
        TextStyleSchema.id,
      ),
      'rangePickerShadowColor': SchemaHelper.objectSchema(ColorSchema.id),
      'rangePickerShape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'rangePickerSurfaceTintColor': SchemaHelper.objectSchema(ColorSchema.id),
      'rangeSelectionBackgroundColor': SchemaHelper.objectSchema(
        ColorSchema.id,
      ),
      'rangeSelectionOverlayColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      'shadowColor': SchemaHelper.objectSchema(ColorSchema.id),
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'surfaceTintColor': SchemaHelper.objectSchema(ColorSchema.id),
      'todayBackgroundColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      'todayBorder': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'todayForegroundColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      'weekdayStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'yearBackgroundColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      'yearForegroundColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      'yearOverlayColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      'yearStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
    },
  };
}
