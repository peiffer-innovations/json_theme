import 'package:json_theme/json_theme_schemas.dart';

class IconDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/icon_data';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'IconData',
    'type': 'object',
    'required': [
      'codePoint',
      'fontFamily',
    ],
    'properties': {
      'codePoint': SchemaHelper.numberSchema,
      'fontFamily': SchemaHelper.stringSchema,
      'fontPackage': SchemaHelper.stringSchema,
      'matchTextDirection': SchemaHelper.boolSchema,
    },
  };
}
