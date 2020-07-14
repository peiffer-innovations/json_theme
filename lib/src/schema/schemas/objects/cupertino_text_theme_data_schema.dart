import 'package:json_theme/json_theme_schemas.dart';

class CupertinoTextThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/cupertino_text_theme_data';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'CupertinoTextThemeData',
    'type': 'object',
    'properties': {
      'actionTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'dateTimePickerTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'navActionTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'navLargeTitleTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'navTitleTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'pickerTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'primaryColor': SchemaHelper.objectSchema(ColorSchema.id),
      'tabLabelTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'textStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
    },
  };
}
