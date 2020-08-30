import 'package:json_theme/json_theme_schemas.dart';

class DragStartBehaviorSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/drag_start_behavior';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'DragStartBehavior',
    'oneOf': SchemaHelper.enumSchema([
      'down',
      'start',
    ]),
  };
}
