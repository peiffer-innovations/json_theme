class MouseCursorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/mouse_cursor.json';

  static final schemas = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/rendering/MouseCursor-class.html',
    'title': 'MouseCursor',
    'type': 'object',
    'required': [
      'type',
    ],
    'properties': {
      'cursor': {
        'type': 'string',
        'enum': [
          'alias',
          'allScroll',
          'basic',
          'cell',
          'click',
          'clickable',
          'contextMenu',
          'copy',
          'disappearing',
          'forbidden',
          'grab',
          'grabbing',
          'help',
          'move',
          'noDrop',
          'none',
          'precise',
          'progress',
          'resizeColumn',
          'resizeDown',
          'resizeDownLeft',
          'resizeDownRight',
          'resizeLeft',
          'resizeRight',
          'resizeRow',
          'resizeUp',
          'resizeUpDown',
          'resizeUpLeft',
          'resizeUpLeftDownRight',
          'resizeUpRight',
          'resizeUpRightDownLeft',
          'textable',
          'text',
          'verticalText',
          'wait',
          'zoomIn',
          'zoomOut',
        ],
      },
      'type': {
        'type': 'string',
        'enum': [
          'defer',
          'material',
          'system',
          'uncontrolled',
        ],
      },
    },
  };
}
