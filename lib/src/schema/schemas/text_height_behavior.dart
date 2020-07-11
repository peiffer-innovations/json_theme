class TextHeightBehaviorSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/text_height_behavior';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'TextHeightBehavior',
    'type': 'object',
    'properties': {
      'applyHeightToFirstAscent': {
        'type': 'boolean',
      },
      'applyHeightToLastDescent': {
        'type': 'boolean',
      },
    },
  };
}
