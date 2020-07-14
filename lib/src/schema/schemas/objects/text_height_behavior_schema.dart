import 'package:json_theme/json_theme_schemas.dart';

class TextHeightBehaviorSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/text_height_behavior';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TextHeightBehavior',
    'type': 'object',
    'properties': {
      'applyHeightToFirstAscent': SchemaHelper.boolSchema,
      'applyHeightToLastDescent': SchemaHelper.boolSchema,
    },
  };
}
