import 'package:json_theme/json_theme_schemas.dart';

class SmartDashesTypeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/smart_dashes_type';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'SmartDashesType',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'disabled',
      'enabled',
    ]),
  };
}
