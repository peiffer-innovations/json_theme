import 'package:json_theme/json_theme_schemas.dart';

class TypographySchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/typography';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'Typography',
    'type': 'object',
    'properties': {
      'black': SchemaHelper.objectSchema(TextThemeSchema.id),
      'dense': SchemaHelper.objectSchema(TextThemeSchema.id),
      'englishLike': SchemaHelper.objectSchema(TextThemeSchema.id),
      'platform': SchemaHelper.objectSchema(TextThemeSchema.id),
      'tall': SchemaHelper.objectSchema(TextThemeSchema.id),
      'white': SchemaHelper.objectSchema(TextThemeSchema.id),
    },
  };
}
