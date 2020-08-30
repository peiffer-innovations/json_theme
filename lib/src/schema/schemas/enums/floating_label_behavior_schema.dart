import 'package:json_theme/json_theme_schemas.dart';

class FloatingLabelBehaviorSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/floating_label_behavior';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'FloatingLabelBehavior',
    'oneOf': SchemaHelper.enumSchema([
      'always',
      'auto',
      'never',
    ]),
  };
}
