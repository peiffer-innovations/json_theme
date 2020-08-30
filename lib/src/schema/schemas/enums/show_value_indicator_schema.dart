import 'package:json_theme/json_theme_schemas.dart';

class ShowValueIndicatorSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/show_value_indicator';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'ShowValueIndicator',
    'oneOf': SchemaHelper.enumSchema([
      'always',
      'never',
      'onlyForContinuous',
      'onlyForDiscrete',
    ]),
  };
}
