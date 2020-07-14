import 'package:json_theme/json_theme_schemas.dart';

class TextThemeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/text_theme';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TextTheme',
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
  };
}
