import 'package:json_theme/json_theme_schemas.dart';

class AlignmentSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/alignment';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'Alignment',
    'oneOf': SchemaHelper.enumSchema(
      [
        'bottomCenter',
        'bottomLeft',
        'bottomRight',
        'center',
        'centerLeft',
        'centerRight',
        'topCenter',
        'topLeft',
        'topRight',
      ],
    ),
  };
}
