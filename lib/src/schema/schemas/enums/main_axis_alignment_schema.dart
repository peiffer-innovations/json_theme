import 'package:json_theme/json_theme_schemas.dart';

class MainAxisAlignmentSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/main_axis_alignment.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'MainAxisAlignment',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'center',
      'end',
      'spaceAround',
      'spaceBetween',
      'spaceEvenly',
      'start',
    ]),
  };
}
