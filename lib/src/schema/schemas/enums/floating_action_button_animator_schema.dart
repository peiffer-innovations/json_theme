import 'package:json_theme/json_theme_schemas.dart';

class FloatingActionButtonAnimatorSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/floating_action_button_animator';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'FloatingActionButtonAnimator',
    'oneOf': SchemaHelper.enumSchema([
      'scaling',
    ]),
  };
}
