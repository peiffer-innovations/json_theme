import 'package:json_theme/json_theme_schemas.dart';

class TextInputTypeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/text_input_type';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TextInputType',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'datetime',
      'emailAddress',
      'multiline',
      'name',
      'number',
      'phone',
      'streetAddress',
      'text',
      'url',
      'visiblePassword',
    ]),
  };
}
