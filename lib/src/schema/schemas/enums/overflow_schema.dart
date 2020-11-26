import 'package:json_theme/json_theme_schemas.dart';

class OverflowSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/overflow.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'Overflow',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'clip',
      'visible',
    ]),
  };
}
