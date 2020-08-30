import 'package:json_theme/json_theme_schemas.dart';

class SnackBarBehaviorSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/snack_bar_behavior';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'SnackBarBehavior',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'fixed',
      'floating',
    ]),
  };
}
