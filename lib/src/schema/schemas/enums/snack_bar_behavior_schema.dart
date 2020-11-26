import 'package:json_theme/json_theme_schemas.dart';

class SnackBarBehaviorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/snack_bar_behavior.json';

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
