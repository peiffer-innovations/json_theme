import 'package:json_theme/json_theme_schemas.dart';

class FontWeightSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/font_weight';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'FontWeight',
    'oneOf': SchemaHelper.enumSchema([
      'bold',
      'normal',
      'w100',
      'w200',
      'w300',
      'w400',
      'w500',
      'w600',
      'w700',
      'w800',
      'w900',
    ]),
  };
}
