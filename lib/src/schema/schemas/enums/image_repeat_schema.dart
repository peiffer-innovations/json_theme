import 'package:json_theme/json_theme_schemas.dart';

class ImageRepeatSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/image_repeat.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'ImageRepeat',
    'oneOf': SchemaHelper.enumSchema([
      'noRepeat',
      'repeat',
      'repeatX',
      'repeatY',
    ]),
  };
}
