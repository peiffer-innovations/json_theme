import 'package:json_theme/json_theme_schemas.dart';

class GradientTransformSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/gradient_transform';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'GradientTransform',
    'type': 'object',
    'properties': {
      'radians': SchemaHelper.numberSchema,
    },
  };
}
