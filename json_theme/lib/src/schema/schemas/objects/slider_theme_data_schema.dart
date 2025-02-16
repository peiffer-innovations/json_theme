import 'package:json_theme/json_theme_schemas.dart';

class SliderThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/slider_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/SliderThemeData-class.html',
    'title': 'SliderThemeData',
    'type': 'object',
    'required': [],
    'properties': {
      'activeTickMarkColor': SchemaHelper.objectSchema(ColorSchema.id),
      'activeTrackColor': SchemaHelper.objectSchema(ColorSchema.id),
      'allowedInteraction': SchemaHelper.objectSchema(
        SliderInteractionSchema.id,
      ),
      'disabledActiveTickMarkColor': SchemaHelper.objectSchema(ColorSchema.id),
      'disabledActiveTrackColor': SchemaHelper.objectSchema(ColorSchema.id),
      'disabledInactiveTickMarkColor': SchemaHelper.objectSchema(
        ColorSchema.id,
      ),
      'disabledInactiveTrackColor': SchemaHelper.objectSchema(ColorSchema.id),
      'disabledSecondaryActiveTrackColor': SchemaHelper.objectSchema(
        ColorSchema.id,
      ),
      'disabledThumbColor': SchemaHelper.objectSchema(ColorSchema.id),
      'inactiveTickMarkColor': SchemaHelper.objectSchema(ColorSchema.id),
      'inactiveTrackColor': SchemaHelper.objectSchema(ColorSchema.id),
      'minThumbSeparation': SchemaHelper.numberSchema,
      'mouseCursor': SchemaHelper.objectSchema(
        WidgetStatePropertyMouseCursorSchema.id,
      ),
      'overlappingShapeStrokeColor': SchemaHelper.objectSchema(ColorSchema.id),
      'overlayColor': SchemaHelper.objectSchema(ColorSchema.id),
      'overlayShape': SchemaHelper.objectSchema(SliderComponentShapeSchema.id),
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'rangeThumbShape': SchemaHelper.objectSchema(
        RangeSliderThumbShapeSchema.id,
      ),
      'rangeTickMarkShape': SchemaHelper.objectSchema(
        RangeSliderTickMarkShapeSchema.id,
      ),
      'rangeTrackShape': SchemaHelper.objectSchema(
        RangeSliderTrackShapeSchema.id,
      ),
      'rangeValueIndicatorShape': SchemaHelper.objectSchema(
        RangeSliderValueIndicatorShapeSchema.id,
      ),
      'secondaryActiveTrackColor': SchemaHelper.objectSchema(ColorSchema.id),
      'showValueIndicator': SchemaHelper.objectSchema(
        ShowValueIndicatorSchema.id,
      ),
      'thumbColor': SchemaHelper.objectSchema(ColorSchema.id),
      'thumbShape': SchemaHelper.objectSchema(SliderComponentShapeSchema.id),
      'thumbSize': SchemaHelper.objectSchema(WidgetStatePropertySizeSchema.id),
      'trackHeight': SchemaHelper.numberSchema,
      'trackShape': SchemaHelper.objectSchema(SliderTrackShapeSchema.id),
      'valueIndicatorColor': SchemaHelper.objectSchema(ColorSchema.id),
      'valueIndicatorShape': SchemaHelper.objectSchema(
        SliderComponentShapeSchema.id,
      ),
      'valueIndicatorStrokeColor': SchemaHelper.objectSchema(ColorSchema.id),
      'valueIndicatorTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
    },
  };
}
