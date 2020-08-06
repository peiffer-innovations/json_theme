import 'package:json_theme/json_theme_schemas.dart';

class BoxDecorationSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/box_decoration';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'BoxDecoration',
    'additionalProperties': false,
    'properties': {
      'backgroundBlendMode': SchemaHelper.objectSchema(BlendModeSchema.id),
      'border': SchemaHelper.objectSchema(BoxBorderSchema.id),
      'borderRadius': SchemaHelper.objectSchema(BorderRadiusSchema.id),
      'boxShadow': SchemaHelper.arraySchema(BoxShadowSchema.id),
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'decorationImage': SchemaHelper.objectSchema(DecorationImageSchema.id),
      'gradient': SchemaHelper.objectSchema(GradientSchema.id),
      'image': SchemaHelper.objectSchema(DecorationImageSchema.id),
      'shape': SchemaHelper.objectSchema(BoxShapeSchema.id),
    },
  };
}
