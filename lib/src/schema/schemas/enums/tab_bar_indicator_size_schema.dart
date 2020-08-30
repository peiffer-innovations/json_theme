import 'package:json_theme/json_theme_schemas.dart';

class TabBarIndicatorSizeSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/tab_bar_indicator_size';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TabBarIndicatorSize',
    'type': 'string',
    'oneOf': SchemaHelper.enumSchema([
      'label',
      'tab',
    ]),
  };
}
