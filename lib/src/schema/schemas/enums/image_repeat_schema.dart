class ImageRepeatSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/image_repeat';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'string',
    'title': 'ImageRepeat',
    'enum': [
      'noRepeat',
      'repeat',
      'repeatX',
      'repeatY',
    ],
  };
}
