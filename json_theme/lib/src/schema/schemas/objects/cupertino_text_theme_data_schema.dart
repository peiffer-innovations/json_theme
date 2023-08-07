import 'package:json_theme/json_theme_schemas.dart';

class CupertinoTextThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/cupertino_text_theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/cupertino/CupertinoTextThemeData-class.html',
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
