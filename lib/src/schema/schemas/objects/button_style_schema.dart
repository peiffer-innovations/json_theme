import 'package:json_theme/json_theme_schemas.dart';

class ButtonStyleSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/button_style';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'id': '$id',
    'title': 'ButtonStyle',
    'additionalProperties': false,
    'properties': {
      'animationDuration': SchemaHelper.numberSchema,
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'enableFeedback': SchemaHelper.boolSchema,
      'foregroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'minimumSize': SchemaHelper.objectSchema(SizeSchema.id),
      'mouseCursor': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'overlayColor': SchemaHelper.objectSchema(ColorSchema.id),
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'shadowColor': SchemaHelper.objectSchema(ColorSchema.id),
      'shape': SchemaHelper.objectSchema(OutlinedBorderSchema.id),
      'side': SchemaHelper.objectSchema(BorderSideSchema.id),
      'materialTapTargetSize': SchemaHelper.objectSchema(
        MaterialTapTargetSizeSchema.id,
      ),
      'textStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'visualDensity': SchemaHelper.objectSchema(VisualDensitySchema.id),
    },
  };
}
