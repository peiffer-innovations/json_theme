import 'package:json_theme/json_theme_schemas.dart';

class DismissDirectionSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/dismiss_direction.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'type': 'string',
    'title': 'DismissDirection',
    'oneOf': SchemaHelper.enumSchema([
      'down',
      'endToStart',
      'horizontal',
      'none',
      'startToEnd',
      'up',
      'vertical',
    ]),
  };
}
