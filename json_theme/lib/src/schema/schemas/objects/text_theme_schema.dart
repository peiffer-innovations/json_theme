import 'package:json_theme/json_theme_schemas.dart';

class TextThemeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/text_theme.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/TextTheme-class.html',
    'title': 'TextTheme',
    'oneOf': [
      {
        'additionalProperties': false,
        'type': 'object',
        'properties': {
          'bodyLarge': SchemaHelper.objectSchema(TextStyleSchema.id),
          'bodyMedium': SchemaHelper.objectSchema(TextStyleSchema.id),
          'bodySmall': SchemaHelper.objectSchema(TextStyleSchema.id),
          'displayLarge': SchemaHelper.objectSchema(TextStyleSchema.id),
          'displayMedium': SchemaHelper.objectSchema(TextStyleSchema.id),
          'displaySmall': SchemaHelper.objectSchema(TextStyleSchema.id),
          'headlineLarge': SchemaHelper.objectSchema(TextStyleSchema.id),
          'headlineMedium': SchemaHelper.objectSchema(TextStyleSchema.id),
          'headlineSmall': SchemaHelper.objectSchema(TextStyleSchema.id),
          'labelLarge': SchemaHelper.objectSchema(TextStyleSchema.id),
          'labelMedium': SchemaHelper.objectSchema(TextStyleSchema.id),
          'labelSmall': SchemaHelper.objectSchema(TextStyleSchema.id),
          'titleLarge': SchemaHelper.objectSchema(TextStyleSchema.id),
          'titleMedium': SchemaHelper.objectSchema(TextStyleSchema.id),
          'titleSmall': SchemaHelper.objectSchema(TextStyleSchema.id),
        },
      },
      {
        'additionalProperties': false,
        'type': 'object',
        'properties': {
          'bodyText1': SchemaHelper.objectSchema(TextStyleSchema.id),
          'bodyText2': SchemaHelper.objectSchema(TextStyleSchema.id),
          'button': SchemaHelper.objectSchema(TextStyleSchema.id),
          'caption': SchemaHelper.objectSchema(TextStyleSchema.id),
          'headline1': SchemaHelper.objectSchema(TextStyleSchema.id),
          'headline2': SchemaHelper.objectSchema(TextStyleSchema.id),
          'headline3': SchemaHelper.objectSchema(TextStyleSchema.id),
          'headline4': SchemaHelper.objectSchema(TextStyleSchema.id),
          'headline5': SchemaHelper.objectSchema(TextStyleSchema.id),
          'headline6': SchemaHelper.objectSchema(TextStyleSchema.id),
          'overline': SchemaHelper.objectSchema(TextStyleSchema.id),
          'subtitle1': SchemaHelper.objectSchema(TextStyleSchema.id),
          'subtitle2': SchemaHelper.objectSchema(TextStyleSchema.id),
        },
      }
    ],
  };
}
