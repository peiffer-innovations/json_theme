import 'package:json_theme/json_theme_schemas.dart';

class FlexFitSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/flex_fit';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'FlexFit',
    'oneOf': SchemaHelper.enumSchema([
      'loose',
      'tight',
    ]),
  };
}
