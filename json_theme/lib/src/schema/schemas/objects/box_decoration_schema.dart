import 'package:json_theme/json_theme_schemas.dart';

class BoxDecorationSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/box_decoration.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/painting/BoxDecoration-class.html',
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
