class MouseCursorSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/mouse_cursor';

  static final schemas = {
    '$id#defer': {
      r'$schema': 'http://json-schema.org/draft-06/schema#',
      r'$id': '$id#defer',
      'title': 'MouseCursor',
      'type': 'object',
      'required': [
        'type',
      ],
      'properties': {
        'type': {
          'type': 'string',
          'enum': [
            'defer',
          ],
        },
      },
    },
    '$id#material': {
      r'$schema': 'http://json-schema.org/draft-06/schema#',
      r'$id': '$id#material',
      'title': 'MouseCursor',
      'type': 'object',
      'additionalProperties': false,
      'required': [
        'cursor',
        'type',
      ],
      'properties': {
        'cursor': {
          'type': 'string',
          'enum': [
            'clickable',
            'textable',
          ],
        },
        'type': {
          'type': 'string',
          'enum': [
            'material',
          ],
        },
      },
    },
    '$id#system': {
      r'$schema': 'http://json-schema.org/draft-06/schema#',
      r'$id': '$id#system',
      'title': 'MouseCursor',
      'type': 'object',
      'additionalProperties': false,
      'required': [
        'cursor',
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
            'contextMenu',
            'copy',
            'disappearing',
            'forbidden',
            'grab',
            'grabbing',
            'help',
            'move',
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
            'system',
          ],
        },
      },
    },
    '$id#uncontrolled': {
      r'$schema': 'http://json-schema.org/draft-06/schema#',
      r'$id': '$id#uncontrolled',
      'title': 'MouseCursor',
      'type': 'object',
      'required': [
        'type',
      ],
      'properties': {
        'type': {
          'type': 'string',
          'enum': [
            'uncontrolled',
          ],
        },
      },
    },
  };
}
