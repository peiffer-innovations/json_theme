import 'package:json_theme/json_theme_schemas.dart';

class TextStyleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/text_style.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/painting/TextStyle-class.html',
    'title': 'TextStyle',
    'type': 'object',
    'properties': {
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'decoration': SchemaHelper.objectSchema(TextDecorationSchema.id),
      'decorationColor': SchemaHelper.objectSchema(ColorSchema.id),
      'decorationStyle':
          SchemaHelper.objectSchema(TextDecorationStyleSchema.id),
      'decorationThickness': SchemaHelper.numberSchema,
      'fontFamily': SchemaHelper.stringSchema,
      'fontFamilyFallback': {
        'type': 'array',
        'items': SchemaHelper.stringSchema,
      },
      'fontFeatures': SchemaHelper.arraySchema(FontFeatureSchema.id),
      'fontSize': SchemaHelper.numberSchema,
      'fontStyle': SchemaHelper.objectSchema(FontStyleSchema.id),
      'fontWeight': SchemaHelper.objectSchema(FontWeightSchema.id),
      'height': SchemaHelper.numberSchema,
      'inherit': SchemaHelper.boolSchema,
      'leadingDistribution': SchemaHelper.objectSchema(
        TextLeadingDistributionSchema.id,
      ),
      'letterSpacking': SchemaHelper.numberSchema,
      'locale': SchemaHelper.objectSchema(LocaleSchema.id),
      'overflow': SchemaHelper.objectSchema(TextOverflowSchema.id),
      'package': SchemaHelper.stringSchema,
      'shadows': SchemaHelper.arraySchema(ShadowSchema.id),
      'textBaseline': SchemaHelper.objectSchema(TextBaselineSchema.id),
      'wordSpacing': SchemaHelper.numberSchema,
    },
  };
}
