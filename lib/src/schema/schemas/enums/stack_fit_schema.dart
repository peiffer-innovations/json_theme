import 'package:json_theme/json_theme_schemas.dart';

class StackFitSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/stack_fit';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'StackFit',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'expand',
      'loose',
      'passthrough',
    ]),
  };
}
