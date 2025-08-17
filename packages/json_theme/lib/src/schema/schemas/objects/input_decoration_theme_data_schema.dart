import 'package:json_theme/json_theme_schemas.dart';

class InputDecorationThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/input_decoration_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/InputDecorationThemeData-class.html',
    'title': 'InputDecorationThemeData',
    'type': 'object',
    'properties': {
      'activeIndicatorBorder': SchemaHelper.objectSchema(BorderSideSchema.id),
      'alignLabelWithHint': SchemaHelper.boolSchema,
      'border': SchemaHelper.objectSchema(InputBorderSchema.id),
      'constraints': SchemaHelper.objectSchema(BoxConstraintsSchema.id),
      'contentPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'disabledBorder': SchemaHelper.objectSchema(InputBorderSchema.id),
      'enabledBorder': SchemaHelper.objectSchema(InputBorderSchema.id),
      'errorBorder': SchemaHelper.objectSchema(InputBorderSchema.id),
      'errorMaxLines': SchemaHelper.numberSchema,
      'errorStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'fillColor': SchemaHelper.objectSchema(ColorSchema.id),
      'filled': SchemaHelper.boolSchema,
      'floatingLabelAlignment': SchemaHelper.objectSchema(
        FloatingLabelAlignmentSchema.id,
      ),
      'floatingLabelBehavior': SchemaHelper.objectSchema(
        FloatingLabelBehaviorSchema.id,
      ),
      'floatingLabelStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'focusColor': SchemaHelper.objectSchema(ColorSchema.id),
      'focusedBorder': SchemaHelper.objectSchema(InputBorderSchema.id),
      'focusedErrorBorder': SchemaHelper.objectSchema(InputBorderSchema.id),
      'helperMaxLines': SchemaHelper.numberSchema,
      'helperStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'hintFadeDuration': SchemaHelper.numberSchema,
      'hintStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'hoverColor': SchemaHelper.objectSchema(ColorSchema.id),
      'iconColor': SchemaHelper.objectSchema(ColorSchema.id),
      'isDense': SchemaHelper.boolSchema,
      'labelStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'outlineBorder': SchemaHelper.objectSchema(BorderSideSchema.id),
      'prefixIconColor': SchemaHelper.objectSchema(ColorSchema.id),
      'prefixIconConstraints': SchemaHelper.objectSchema(
        BoxConstraintsSchema.id,
      ),
      'prefixStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'suffixIconColor': SchemaHelper.objectSchema(ColorSchema.id),
      'suffixIconConstraints': SchemaHelper.objectSchema(
        BoxConstraintsSchema.id,
      ),
      'suffixStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
    },
  };
}
