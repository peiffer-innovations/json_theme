import 'package:json_theme/json_theme_schemas.dart';

class ScrollViewKeyboardDismissBehaviorSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/scroll_view_keyboard_dismiss_behavior';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'ScrollViewKeyboardDismissBehavior',
    'oneOf': SchemaHelper.enumSchema([
      'manual',
      'onDrag',
    ]),
  };
}
