import 'package:json_theme/json_theme_schemas.dart';

class AutovalidateModeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/autovalidate_mode';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'AutovalidateMode',
    'oneOf': SchemaHelper.enumSchema([
      'always',
      'disabled',
      'onUserInteraction',
    ]),
  };
}
