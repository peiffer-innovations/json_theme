import 'package:json_theme/json_theme_schemas.dart';

class CrossFadeStateSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/cross_fade_state';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'CrossFadeState',
    'oneOf': SchemaHelper.enumSchema([
      'showFirst',
      'showSecond',
    ]),
  };
}
