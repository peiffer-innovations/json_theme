import 'package:json_theme/json_theme_schemas.dart';

class SliderThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/slider_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'SliderThemeDataThemeData',
    'type': 'object',
    'required': [],
    'properties': {
      'activeTickMarkColor': SchemaHelper.objectSchema(ColorSchema.id),
      'activeTrackColor': SchemaHelper.objectSchema(ColorSchema.id),
      'disabledActiveTickMarkColor': SchemaHelper.objectSchema(ColorSchema.id),
      'disabledActiveTrackColor': SchemaHelper.objectSchema(ColorSchema.id),
      'disabledInactiveTickMarkColor':
          SchemaHelper.objectSchema(ColorSchema.id),
      'disabledInactiveTrackColor': SchemaHelper.objectSchema(ColorSchema.id),
      'disabledThumbColor': SchemaHelper.objectSchema(ColorSchema.id),
      'inactiveTickMarkColor': SchemaHelper.objectSchema(ColorSchema.id),
      'inactiveTrackColor': SchemaHelper.objectSchema(ColorSchema.id),
      'minThumbSeparation': SchemaHelper.numberSchema,
      'overlappingShapeStrokeColor': SchemaHelper.objectSchema(ColorSchema.id),
      'overlayColor': SchemaHelper.objectSchema(ColorSchema.id),
      'overlayShape': SchemaHelper.objectSchema(SliderComponentShapeSchema.id),
      'rangeThumbShape':
          SchemaHelper.objectSchema(RangeSliderThumbShapeSchema.id),
      'rangeTickMarkShape':
          SchemaHelper.objectSchema(RangeSliderTickMarkShapeSchema.id),
      'rangeTrackShape':
          SchemaHelper.objectSchema(RangeSliderTrackShapeSchema.id),
      'rangeValueIndicatorShape':
          SchemaHelper.objectSchema(RangeSliderValueIndicatorShapeSchema.id),
      'showValueIndicator':
          SchemaHelper.objectSchema(ShowValueIndicatorSchema.id),
      'thumbColor': SchemaHelper.objectSchema(ColorSchema.id),
      'thumbShape': SchemaHelper.objectSchema(SliderComponentShapeSchema.id),
      'trackHeight': SchemaHelper.numberSchema,
      'trackShape': SchemaHelper.objectSchema(SliderTrackShapeSchema.id),
      'valueIndicatorColor': SchemaHelper.objectSchema(ColorSchema.id),
      'valueIndicatorShape':
          SchemaHelper.objectSchema(SliderComponentShapeSchema.id),
      'valueIndicatorTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
    },
  };
}
