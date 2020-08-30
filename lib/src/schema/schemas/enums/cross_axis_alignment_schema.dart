import 'package:json_theme/json_theme_schemas.dart';

class CrossAxisAlignmentSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/cross_axis_alignment';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'CrossAxisAlignment',
    'oneOf': SchemaHelper.enumSchema([
      'baseline',
      'center',
      'end',
      'start',
      'stretch',
    ]),
  };
}
