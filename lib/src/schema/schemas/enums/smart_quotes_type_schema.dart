import 'package:json_theme/json_theme_schemas.dart';

class SmartQuotesTypeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/smart_quotes_type';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'SmartQuotesType',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'disabled',
      'enabled',
    ]),
  };
}
