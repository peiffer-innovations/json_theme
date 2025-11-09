part of 'theme_encoder.dart';

abstract class _ThemeEncoderFunctions {
  const _ThemeEncoderFunctions();

  /// Encodes the given [value] to either a String representation of the
  /// [Alignment] or a JSON map that follows the structure:
  ///
  /// ```json
  /// {
  ///   "x": "<double>",
  ///   "y": "<double>"
  /// }
  /// ```
  ///
  /// Supported string values are:
  ///  * `bottomCenter`
  ///  * `bottomLeft`
  ///  * `bottomRight`
  ///  * `center`
  ///  * `centerLeft`
  ///  * `centerRight`
  ///  * `topCenter`
  ///  * `topLeft`
  ///  * `topRight`
  ///
  /// All other values, including `null`, will result in `null`.
  dynamic encodeAlignment(Alignment? value) {
    dynamic result;

    if (value != null) {
      if (value.x == Alignment.bottomCenter.x &&
          value.y == Alignment.bottomCenter.y) {
        result = 'bottomCenter';
      } else if (value.x == Alignment.bottomLeft.x &&
          value.y == Alignment.bottomLeft.y) {
        result = 'bottomLeft';
      } else if (value.x == Alignment.bottomRight.x &&
          value.y == Alignment.bottomRight.y) {
        result = 'bottomRight';
      } else if (value.x == Alignment.center.x &&
          value.y == Alignment.center.y) {
        result = 'center';
      } else if (value.x == Alignment.centerLeft.x &&
          value.y == Alignment.centerLeft.y) {
        result = 'centerLeft';
      } else if (value.x == Alignment.centerRight.x &&
          value.y == Alignment.centerRight.y) {
        result = 'centerRight';
      } else if (value.x == Alignment.topCenter.x &&
          value.y == Alignment.topCenter.y) {
        result = 'topCenter';
      } else if (value.x == Alignment.topLeft.x &&
          value.y == Alignment.topLeft.y) {
        result = 'topLeft';
      } else if (value.x == Alignment.topRight.x &&
          value.y == Alignment.topRight.y) {
        result = 'topRight';
      } else {
        result = {'x': value.x, 'y': value.y};
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a [String].  The supported values are:
  ///  * `bottomCenter`
  ///  * `bottomEnd`
  ///  * `bottomStart`
  ///  * `center`
  ///  * `centerEnd`
  ///  * `centerStart`
  ///  * `topCenter`
  ///  * `topEnd`
  ///  * `topStart`
  String? encodeAlignmentDirectional(AlignmentDirectional? value) {
    String? result;

    if (value != null) {
      if (value == AlignmentDirectional.bottomCenter) {
        result = 'bottomCenter';
      } else if (value == AlignmentDirectional.bottomEnd) {
        result = 'bottomEnd';
      } else if (value == AlignmentDirectional.bottomStart) {
        result = 'bottomStart';
      } else if (value == AlignmentDirectional.center) {
        result = 'center';
      } else if (value == AlignmentDirectional.centerEnd) {
        result = 'centerEnd';
      } else if (value == AlignmentDirectional.centerStart) {
        result = 'centerStart';
      } else if (value == AlignmentDirectional.topCenter) {
        result = 'topCenter';
      } else if (value == AlignmentDirectional.topEnd) {
        result = 'topEnd';
      } else if (value == AlignmentDirectional.topStart) {
        result = 'topStart';
      }
    }
    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a [String].  This delegates to either
  /// [encodeAlignment] or [encodeAlignmentDirectional]
  dynamic encodeAlignmentGeometry(AlignmentGeometry? value) {
    dynamic result;

    if (value != null) {
      if (value is AlignmentDirectional) {
        result = ThemeEncoder.instance.encodeAlignmentDirectional(value);
      } else if (value is Alignment) {
        result = ThemeEncoder.instance.encodeAlignment(value);
      } else {
        throw Exception(
          'Unknown type of AlignmentGeometry encountered: ${value.runtimeType}.',
        );
      }
    }
    return _stripDynamicNull(result);
  }

  Map<String, dynamic>? encodeBorder(Border? value) =>
      ThemeEncoder.instance.encodeBoxBorder(value);

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "bottomLeft": "<Radius>",
  ///   "bottomRight": "<Radius>",
  ///   "topLeft": "<Radius>",
  ///   "topRight": "<Radius>",
  ///   "type": "only"
  /// }
  /// ```
  Map<String, dynamic>? encodeBorderRadius(BorderRadius? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'bottomLeft': encodeRadius(value.bottomLeft),
        'bottomRight': encodeRadius(value.bottomRight),
        'topLeft': encodeRadius(value.topLeft),
        'topRight': encodeRadius(value.topRight),
        'type': 'only',
      };
    }

    return _stripDynamicNull(result);
  }

  Map<String, dynamic>? encodeBorderRadiusGeometry(
    BorderRadiusGeometry? value,
  ) => value is BorderRadius ? encodeBorderRadius(value) : null;

  /// Encodes the given [value] to the String representation.  This will always
  /// use a hash encoded 8 digit string: "#aarrbbgg" format.
  ///
  /// This will return `null` if the value is `null`.
  String? encodeColor(Color? value) {
    String? result;

    if (value != null) {
      final hex =
          (value.a * 255).toInt().toRadixString(16).padLeft(2, '0') +
          (value.r * 255).toInt().toRadixString(16).padLeft(2, '0') +
          (value.g * 255).toInt().toRadixString(16).padLeft(2, '0') +
          (value.b * 255).toInt().toRadixString(16).padLeft(2, '0');
      result = '#$hex';
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] into a JSON compatible map.  This produces a Map
  /// in the following format:
  ///
  /// ```json
  /// {
  ///   "bottom": "<BorderSide>",
  ///   "left": "<BorderSide>",
  ///   "right": "<BorderSide>",
  ///   "top": "<BorderSide>"
  /// }
  /// ```
  /// A [value] of `null` will result in `null` being returned.
  Map<String, dynamic>? encodeBoxBorder(BoxBorder? value) {
    Map<String, dynamic>? result;

    if (value == null) {
      return null;
    }

    if (value is Border) {
      result = {
        'bottom': ThemeEncoder.instance.encodeBorderSide(value.bottom),
        'left': ThemeEncoder.instance.encodeBorderSide(value.left),
        'right': ThemeEncoder.instance.encodeBorderSide(value.right),
        'top': ThemeEncoder.instance.encodeBorderSide(value.top),
      };
    } else {
      result = {
        'bottom': ThemeEncoder.instance.encodeBorderSide(value.bottom),
        'top': ThemeEncoder.instance.encodeBorderSide(value.top),
      };
    }

    return _stripDynamicNull(result);
  }

  Map<String, dynamic>? encodeDecoration(Decoration? value) =>
      value is BoxDecoration
      ? ThemeEncoder.instance.encodeBoxDecoration(value)
      : null;

  /// Encodes the given [value] to a JSON compatible [Map].  The returned result
  /// will always have one of the following formats:
  ///
  /// ```json
  /// {
  ///   "bottom": "<double>",
  ///   "left": "<double>",
  ///   "right": "<double>",
  ///   "top": "<double>"
  /// }
  /// ```
  ///
  /// ```json
  /// {
  ///   "bottom": "<double>",
  ///   "left": "<double>",
  ///   "right": "<double>",
  ///   "top": "<double>"
  /// }
  /// ```
  Map<String, dynamic>? encodeEdgeInsetsGeometry(EdgeInsetsGeometry? value) {
    Map<String, dynamic>? result;

    if (value is EdgeInsets) {
      result = ThemeEncoder.instance.encodeEdgeInsets(value);
    } else if (value is EdgeInsetsDirectional) {
      result = ThemeEncoder.instance.encodeEdgeInsetsDirectional(value);
    } else if (value != null) {
      throw Exception(
        'Unknown type of EdgeInsets detected: [${value.runtimeType}]',
      );
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  This only
  /// supports the following [Gradient] subclasses:
  ///  * [LinearGradient]
  ///  * [RadialGradient]
  ///  * [SweepGradient]
  ///
  /// The emitted JSON will depend on the [Gradient] type and are each described
  /// below:
  ///
  /// [LinearGradient]
  /// ```json
  /// {
  ///   "begin": "<Alignment>",
  ///   "colors": "<Color[]>",
  ///   "end": "<Alignment>",
  ///   "stops": "<double[]>",
  ///   "tileMode": "<TileMode>",
  ///   "transform": "<GradientTransform>"
  ///   "type": "linear",
  /// }
  /// ```
  ///
  /// [RadialGradient]
  /// ```json
  /// {
  ///   "center": "<Alignment>",
  ///   "colors": "<Color[]>",
  ///   "focal": "<Alignment>",
  ///   "focalRadius": "<double>",
  ///   "radius": "<double>",
  ///   "stops": "<double[]>",
  ///   "tileMode": "<TileMode>",
  ///   "transform": "<GradientTransform>"
  ///   "type": "radial",
  /// }
  /// ```
  ///
  /// [SweepGradient]
  /// ```json
  /// {
  ///   "center": "<Alignment>",
  ///   "colors": "<Color[]>",
  ///   "endAngle": "<double>",
  ///   "startAngle": "<double>",
  ///   "stops": "<double[]>",
  ///   "tileMode": "<TileMode>",
  ///   "transform": "<GradientTransform>"
  ///   "type": "sweep",
  /// }
  /// ```
  Map<String, dynamic>? encodeGradient(Gradient? value) {
    assert(
      value == null ||
          value is LinearGradient ||
          value is RadialGradient ||
          value is SweepGradient,
    );
    Map<String, dynamic>? result;

    if (value != null) {
      if (value is LinearGradient) {
        result = {
          'begin': ThemeEncoder.instance.encodeAlignmentGeometry(value.begin),
          'colors': _encodeList<String?>(
            value.colors,
            (value) => ThemeEncoder.instance.encodeColor(value),
          ),
          'end': ThemeEncoder.instance.encodeAlignmentGeometry(value.end),
          'stops': value.stops,
          'tileMode': ThemeEncoder.instance.encodeTileMode(value.tileMode),
          'transform': ThemeEncoder.instance.encodeGradientTransform(
            value.transform,
          ),
          'type': 'linear',
        };
      } else if (value is RadialGradient) {
        result = {
          'center': ThemeEncoder.instance.encodeAlignmentGeometry(value.center),
          'colors': _encodeList<String?>(
            value.colors,
            (value) => ThemeEncoder.instance.encodeColor(value),
          ),
          'focal': ThemeEncoder.instance.encodeAlignmentGeometry(value.focal),
          'focalRadius': value.focalRadius,
          'radius': value.radius,
          'stops': value.stops,
          'tileMode': ThemeEncoder.instance.encodeTileMode(value.tileMode),
          'transform': ThemeEncoder.instance.encodeGradientTransform(
            value.transform,
          ),
          'type': 'radial',
        };
      } else if (value is SweepGradient) {
        result = {
          'center': ThemeEncoder.instance.encodeAlignmentGeometry(value.center),
          'colors': _encodeList<String?>(
            value.colors,
            (value) => ThemeEncoder.instance.encodeColor(value),
          ),
          'endAngle': value.endAngle,
          'startAngle': value.startAngle,
          'stops': value.stops,
          'tileMode': ThemeEncoder.instance.encodeTileMode(value.tileMode),
          'transform': ThemeEncoder.instance.encodeGradientTransform(
            value.transform,
          ),
          'type': 'sweep',
        };
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  This only
  /// supports the following [GradientTransform] subclasses:
  ///  * [GradientRotation]
  ///
  /// The emitted JSON will depend on the [GradientTransform] type and are each
  /// described below:
  ///
  /// [GradientRotation]
  /// ```json
  /// {
  ///   "radians": "<double>"
  /// }
  /// ```
  Map<String, dynamic>? encodeGradientTransform(GradientTransform? value) {
    assert(value == null || value is GradientRotation);
    Map<String, dynamic>? result;

    if (value != null && value is GradientRotation) {
      result = {'radians': value.radians};
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to an JSON value.  This expects a specific
  /// "type" attribute to be one of:
  ///  * `asset`
  ///  * `memory`
  ///  * `network`
  ///
  /// The expected structure depends on the exact "type" value passed in.
  ///
  /// Type: `asset`
  /// ```json
  /// {
  ///   "assetName": "<String>",
  ///   "type": "asset",
  ///   "package": "<String>"
  /// }
  /// ```
  ///
  /// Type: `memory`
  /// ```json
  /// {
  ///   "bytes": "<String>",
  ///   "type": "memory",
  ///   "scale": "<double>"
  /// }
  /// ```
  ///
  /// Type: `network`
  /// ```json
  /// {
  ///   "headers": "<Map<String, String>>",
  ///   "type": "network"
  ///   "scale": "<double>",
  ///   "url": "<String>"
  /// }
  /// ```
  Map<String, dynamic>? encodeImageProvider(ImageProvider? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      assert(
        value is AssetImage || value is MemoryImage || value is NetworkImage,
      );
      if (value is AssetImage) {
        result = <String, dynamic>{
          'assetName': value.assetName,
          'package': value.package,
          'type': 'asset',
        };
      } else if (value is MemoryImage) {
        result = <String, dynamic>{
          'bytes': base64Encode(value.bytes),
          'scale': value.scale,
          'type': 'memory',
        };
      } else if (value is NetworkImage) {
        result = <String, dynamic>{
          'headers': value.headers,
          'scale': value.scale,
          'type': 'network',
          'url': value.url,
        };
      }
    }

    return _stripDynamicNull(result);
  }

  Map<String, dynamic>? encodeImageProviderObject(ImageProvider? value) =>
      encodeImageProvider(value);

  Map<String, dynamic>? encodeInlineSpan(InlineSpan? value) =>
      value is TextSpan ? ThemeEncoder.instance.encodeTextSpan(value) : null;

  /// Encodes the given [value] to a JSON representation.  This only supports
  /// the following subclasses:
  ///  * `OutlineInputBorder`
  ///  * `UnderlineInputBorder`
  ///
  /// The returned structure depends on the subclass.
  ///
  /// `OutlineInputBorder`
  /// ```json
  /// {
  ///   borderRadius: <BorderRadius>",
  ///   borderSide: <BorderSide>",
  ///   gapPadding: <double>"
  /// }
  /// ```
  ///
  /// `UnderlineInputborder`
  /// ```json
  /// {
  ///   borderRadius: <BorderRadius>",
  ///   borderSide: <BorderSide>"
  /// }
  /// ```
  Map<String, dynamic>? encodeInputBorder(InputBorder? value) {
    assert(
      value == null ||
          value is OutlineInputBorder ||
          value is UnderlineInputBorder,
    );
    Map<String, dynamic>? result;

    if (value != null) {
      if (value is OutlineInputBorder) {
        result = {
          'borderRadius': ThemeEncoder.instance.encodeBorderRadius(
            value.borderRadius,
          ),
          'borderSide': ThemeEncoder.instance.encodeBorderSide(
            value.borderSide,
          ),
          'gapPadding': value.gapPadding,
          'type': 'outline',
        };
      } else if (value is UnderlineInputBorder) {
        result = {
          'borderRadius': ThemeEncoder.instance.encodeBorderRadius(
            value.borderRadius,
          ),
          'borderSide': ThemeEncoder.instance.encodeBorderSide(
            value.borderSide,
          ),
          'type': 'underline',
        };
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `splash`
  ///  * `ripple`
  ///  * `sparkle`
  ///
  /// All other values, including `null`, will result in `null`.
  String? encodeInteractiveInkFeatureFactory(
    InteractiveInkFeatureFactory? value,
  ) {
    final splashType = InkSplash.splashFactory.runtimeType;
    final rippleType = InkRipple.splashFactory.runtimeType;
    final sparkleType = InkSparkle.splashFactory.runtimeType;

    assert(
      value == null ||
          value.runtimeType == splashType ||
          value.runtimeType == rippleType ||
          value.runtimeType == sparkleType,
    );
    String? result;

    if (value != null) {
      if (value.runtimeType == splashType) {
        result = 'splash';
      } else if (value.runtimeType == rippleType) {
        result = 'ripple';
      } else if (value.runtimeType == sparkleType) {
        result = 'sparkle';
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a  JSON representation.
  ///
  /// ```json
  /// {
  ///   "countryCode": "<String>",
  ///   "languageCode": "<String>"
  /// }
  /// ```
  Map<String, dynamic>? encodeLocale(Locale? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'countryCode': value.countryCode,
        'languageCode': value.languageCode,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "primary": "<Color>",
  ///   "swatches": "<Map<String, Color>"
  /// }
  /// ```
  Map<String, dynamic>? encodeMaterialColor(MaterialColor? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'primary': encodeColor(Color(colorToInt(value)!)),
        'swatches': {
          '50': encodeColor(value.shade50),
          '100': encodeColor(value.shade100),
          '200': encodeColor(value.shade200),
          '300': encodeColor(value.shade300),
          '400': encodeColor(value.shade400),
          '500': encodeColor(value.shade500),
          '600': encodeColor(value.shade600),
          '700': encodeColor(value.shade700),
          '800': encodeColor(value.shade800),
          '900': encodeColor(value.shade900),
        },
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] to a [Matrix4]. This will encode the [value] into a 16
  /// element [List] of [double].
  ///
  /// The array takes the following format:
  /// ```
  /// [
  ///   x0,
  ///   x1,
  ///   x2,
  ///   x3,
  ///   y0,
  ///   y1,
  ///   y2,
  ///   y3,
  ///   z0,
  ///   z1,
  ///   z2,
  ///   z3,
  ///   w0,
  ///   w1,
  ///   w2,
  ///   w3
  /// ]
  /// ```
  List<double>? encodeMatrix4(Matrix4? value) {
    List<double>? result;

    if (value != null) {
      result = [
        value.row0.x,
        value.row1.x,
        value.row2.x,
        value.row3.x,
        value.row0.y,
        value.row1.y,
        value.row2.y,
        value.row3.y,
        value.row0.z,
        value.row1.z,
        value.row2.z,
        value.row3.z,
        value.row0.w,
        value.row1.w,
        value.row2.w,
        value.row3.w,
      ];
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.  There will be a
  /// "type" attribute that is one of:
  ///  * `defer`
  ///  * `system`
  ///  * `uncontrolled`
  ///
  /// When the `type` is `system`, this will create a `cursor` that is one of:
  ///  * `alias`
  ///  * `allScroll`
  ///  * `basic`
  ///  * `cell`
  ///  * `click`
  ///  * `contextMenu`
  ///  * `copy`
  ///  * `disappearing`
  ///  * `forbidden`
  ///  * `grab`
  ///  * `grabbing`
  ///  * `help`
  ///  * `move`
  ///  * `noDrop`
  ///  * `none`
  ///  * `precise`
  ///  * `progress`
  ///  * `resizeColumn`
  ///  * `resizeDown`
  ///  * `resizeDownLeft`
  ///  * `resizeDownRight`
  ///  * `resizeLeft`
  ///  * `resizeRight`
  ///  * `resizeRow`
  ///  * `resizeUp`
  ///  * `resizeUpDown`
  ///  * `resizeUpLeft`
  ///  * `resizeUpLeftDownRight`
  ///  * `resizeUpRight`
  ///  * `resizeUpRightDownLeft`
  ///  * `text`
  ///  * `verticalText`
  ///  * `wait`
  ///  * `zoomIn`
  ///  * `zoomOut`
  Map<String, dynamic>? encodeMouseCursor(MouseCursor? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      if (value == MouseCursor.defer) {
        result = {'type': 'defer'};
      } else if (value == MouseCursor.uncontrolled) {
        result = {'type': 'uncontrolled'};
      } else if (WidgetStateMouseCursor.clickable == value) {
        result = {'cursor': 'clickable', 'type': 'material'};
      } else if (WidgetStateMouseCursor.textable == value) {
        result = {'cursor': 'textable', 'type': 'material'};
      } else if (SystemMouseCursors.alias == value) {
        result = {'cursor': 'alias', 'type': 'system'};
      } else if (SystemMouseCursors.allScroll == value) {
        result = {'cursor': 'allScroll', 'type': 'system'};
      } else if (SystemMouseCursors.basic == value) {
        result = {'cursor': 'basic', 'type': 'system'};
      } else if (SystemMouseCursors.cell == value) {
        result = {'cursor': 'cell', 'type': 'system'};
      } else if (SystemMouseCursors.click == value) {
        result = {'cursor': 'click', 'type': 'system'};
      } else if (SystemMouseCursors.contextMenu == value) {
        result = {'cursor': 'contextMenu', 'type': 'system'};
      } else if (SystemMouseCursors.copy == value) {
        result = {'cursor': 'copy', 'type': 'system'};
      } else if (SystemMouseCursors.disappearing == value) {
        result = {'cursor': 'disappearing', 'type': 'system'};
      } else if (SystemMouseCursors.forbidden == value) {
        result = {'cursor': 'forbidden', 'type': 'system'};
      } else if (SystemMouseCursors.grab == value) {
        result = {'cursor': 'grab', 'type': 'system'};
      } else if (SystemMouseCursors.grabbing == value) {
        result = {'cursor': 'grabbing', 'type': 'system'};
      } else if (SystemMouseCursors.help == value) {
        result = {'cursor': 'help', 'type': 'system'};
      } else if (SystemMouseCursors.move == value) {
        result = {'cursor': 'move', 'type': 'system'};
      } else if (SystemMouseCursors.noDrop == value) {
        result = {'cursor': 'noDrop', 'type': 'system'};
      } else if (SystemMouseCursors.none == value) {
        result = {'cursor': 'none', 'type': 'system'};
      } else if (SystemMouseCursors.precise == value) {
        result = {'cursor': 'precise', 'type': 'system'};
      } else if (SystemMouseCursors.progress == value) {
        result = {'cursor': 'progress', 'type': 'system'};
      } else if (SystemMouseCursors.resizeColumn == value) {
        result = {'cursor': 'resizeColumn', 'type': 'system'};
      } else if (SystemMouseCursors.resizeDown == value) {
        result = {'cursor': 'resizeDown', 'type': 'system'};
      } else if (SystemMouseCursors.resizeDownLeft == value) {
        result = {'cursor': 'resizeDownLeft', 'type': 'system'};
      } else if (SystemMouseCursors.resizeDownRight == value) {
        result = {'cursor': 'resizeDownRight', 'type': 'system'};
      } else if (SystemMouseCursors.resizeLeft == value) {
        result = {'cursor': 'resizeLeft', 'type': 'system'};
      } else if (SystemMouseCursors.resizeLeftRight == value) {
        result = {'cursor': 'resizeLeftRight', 'type': 'system'};
      } else if (SystemMouseCursors.resizeRight == value) {
        result = {'cursor': 'resizeRight', 'type': 'system'};
      } else if (SystemMouseCursors.resizeRow == value) {
        result = {'cursor': 'resizeRow', 'type': 'system'};
      } else if (SystemMouseCursors.resizeUp == value) {
        result = {'cursor': 'resizeUp', 'type': 'system'};
      } else if (SystemMouseCursors.resizeUpDown == value) {
        result = {'cursor': 'resizeUpDown', 'type': 'system'};
      } else if (SystemMouseCursors.resizeUpLeft == value) {
        result = {'cursor': 'resizeUpLeft', 'type': 'system'};
      } else if (SystemMouseCursors.resizeUpLeftDownRight == value) {
        result = {'cursor': 'resizeUpLeftDownRight', 'type': 'system'};
      } else if (SystemMouseCursors.resizeUpRight == value) {
        result = {'cursor': 'resizeUpRight', 'type': 'system'};
      } else if (SystemMouseCursors.resizeUpRightDownLeft == value) {
        result = {'cursor': 'resizeUpRightDownLeft', 'type': 'system'};
      } else if (SystemMouseCursors.text == value) {
        result = {'cursor': 'text', 'type': 'system'};
      } else if (SystemMouseCursors.verticalText == value) {
        result = {'cursor': 'verticalText', 'type': 'system'};
      } else if (SystemMouseCursors.wait == value) {
        result = {'cursor': 'wait', 'type': 'system'};
      } else if (SystemMouseCursors.zoomIn == value) {
        result = {'cursor': 'zoomIn', 'type': 'system'};
      } else if (SystemMouseCursors.zoomOut == value) {
        result = {'cursor': 'zoomOut', 'type': 'system'};
      }
    }

    return _stripDynamicNull(result);
  }

  Map<String, dynamic>? encodeNoDefaultCupertinoThemeData(
    NoDefaultCupertinoThemeData? value,
  ) => ThemeEncoder.instance.encodeCupertinoThemeData(value);

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `circular`
  ///
  /// All other values, including `null`, will result in `null`.
  String? encodeNotchedShape(NotchedShape? value) {
    assert(value == null || value is CircularNotchedRectangle);
    String? result;

    if (value != null) {
      result = 'circular';
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON compatible Map.  The value structure
  /// returned the type of the [OutlinedBorder] passed in.
  ///
  /// `BeveledRectangleBorder`
  /// ```json
  /// {
  ///   "borderRadius": "<BorderRadius>",
  ///   "side": "<BorderSide>",
  ///   "type": "beveled"
  /// }
  /// ```
  ///
  /// `CircleBorder`
  /// ```json
  /// {
  ///   "side": "<BorderSide>",
  ///   "type": "circle"
  /// }
  /// ```
  ///
  /// `ContinuousRectangleBorder`
  /// ```json
  /// {
  ///   "borderRadius": "<BorderRadius>",
  ///   "side": "<BorderSide>",
  ///   "type": "rectangle"
  /// }
  /// ```
  ///
  /// `RoundedRectangleBorder`
  /// ```json
  /// {
  ///   "borderRadius": "<BorderRadius>",
  ///   "side": "<BorderSide>",
  ///   "type": "rounded"
  /// }
  /// ```
  ///
  /// `StadiumBorder`
  /// ```json
  /// {
  ///   "side": "<BorderSide>",
  ///   "type": "stadium"
  /// }
  /// ```
  Map<String, dynamic>? encodeOutlinedBorder(ShapeBorder? value) {
    assert(
      value == null ||
          value is BeveledRectangleBorder ||
          value is CircleBorder ||
          value is ContinuousRectangleBorder ||
          value is RoundedRectangleBorder ||
          value is StadiumBorder,
    );
    Map<String, dynamic>? result;

    if (value != null) {
      if (value is BeveledRectangleBorder) {
        result = <String, dynamic>{
          'borderRadius': ThemeEncoder.instance.encodeBorderRadius(
            value.borderRadius as BorderRadius?,
          ),
          'side': ThemeEncoder.instance.encodeBorderSide(value.side),
          'type': 'beveled',
        };
      } else if (value is CircleBorder) {
        result = <String, dynamic>{
          'side': ThemeEncoder.instance.encodeBorderSide(value.side),
          'type': 'circle',
        };
      } else if (value is ContinuousRectangleBorder) {
        result = <String, dynamic>{
          'borderRadius': ThemeEncoder.instance.encodeBorderRadius(
            value.borderRadius as BorderRadius?,
          ),
          'side': ThemeEncoder.instance.encodeBorderSide(value.side),
          'type': 'rectangle',
        };
      } else if (value is RoundedRectangleBorder) {
        result = <String, dynamic>{
          'borderRadius': ThemeEncoder.instance.encodeBorderRadius(
            value.borderRadius as BorderRadius?,
          ),
          'side': ThemeEncoder.instance.encodeBorderSide(value.side),
          'type': 'rounded',
        };
      } else if (value is StadiumBorder) {
        result = <String, dynamic>{
          'side': ThemeEncoder.instance.encodeBorderSide(value.side),
          'type': 'stadium',
        };
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation
  ///
  /// ```json
  /// {
  ///   "builders": "<Map<TargetPlatform, PageTransitionBuilder>>"
  /// }
  /// ```
  Map<String, dynamic>? encodePageTransitionsTheme(
    PageTransitionsTheme? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      final builders = <String, String?>{};
      value.builders.forEach(
        (key, value) =>
            builders[ThemeEncoder.instance.encodeTargetPlatform(key)!] =
                encodePageTransitionsBuilder(value),
      );

      result = {'builders': builders};
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] to a [String].  Supported values are:
  /// * `cupertino`
  /// * `fadeUpwards`
  /// * `openUpwards`
  /// * `zoom`
  String? encodePageTransitionsBuilder(PageTransitionsBuilder? value) {
    String? result;

    if (value is CupertinoPageTransitionsBuilder) {
      result = 'cupertino';
    } else if (value is FadeUpwardsPageTransitionsBuilder) {
      result = 'fadeUpwards';
    } else if (value is OpenUpwardsPageTransitionsBuilder) {
      result = 'openUpwards';
    } else if (value is ZoomPageTransitionsBuilder) {
      result = 'zoom';
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON compatible map.
  ///
  /// ```json
  /// {
  ///  "type": "elliptical",
  ///   "x": "<double>",
  ///   "y": "<double>"
  /// }
  /// ```
  Map<String, dynamic>? encodeRadius(Radius? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'type': 'elliptical',
        'x': value.x,
        'y': value.y,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.  This only supports
  /// the following subclasses:
  ///  * `RoundRangeSliderThumbShape`
  ///
  /// The structure of the other attributes depends on the subclass.
  ///
  /// Type: `round`
  /// ```json
  /// {
  ///   "disabledThumbRadius": "<double>",
  ///   "elevation": "<double>",
  ///   "enabledThumbRadius": "<double>",
  ///   "pressedElevation": "<double>",
  ///   "type": "round"
  /// }
  /// ```
  Map<String, dynamic>? encodeRangeSliderThumbShape(
    RangeSliderThumbShape? value,
  ) {
    Map<String, dynamic>? result;

    if (value is RoundRangeSliderThumbShape) {
      result = <String, dynamic>{
        'disabledThumbRadius': value.disabledThumbRadius,
        'elevation': value.elevation,
        'enabledThumbRadius': value.enabledThumbRadius,
        'pressedElevation': value.pressedElevation,
        'type': 'round',
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `rectangular`
  ///  * `rounded`
  ///
  /// All other values, including `null`, will result in `null`.
  String? encodeRangeSliderTrackShape(RangeSliderTrackShape? value) {
    assert(
      value == null ||
          value is RectangularRangeSliderTrackShape ||
          value is RoundedRectRangeSliderTrackShape,
    );
    String? result;

    if (value != null) {
      if (value is RectangularRangeSliderTrackShape) {
        result = 'rectangular';
      } else if (value is RoundedRectRangeSliderTrackShape) {
        result = 'rounded';
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.  This only supports
  /// the following subclasses:
  ///  * `RoundRangeSliderTickMarkShape`
  ///
  /// The structure of the other attributes depends on the subclass.
  ///
  /// `RoundRangeSliderTickMarkShape`
  /// ```json
  /// {
  ///   "tickMarkRadius": "<double>",
  ///   "type": "round"
  /// }
  /// ```
  Map<String, dynamic>? encodeRangeSliderTickMarkShape(
    RangeSliderTickMarkShape? value,
  ) {
    assert(value == null || value is RoundRangeSliderTickMarkShape);
    Map<String, dynamic>? result;

    if (value != null) {
      final shape = value as RoundRangeSliderTickMarkShape;
      result = <String, dynamic>{
        'tickMarkRadius': shape.tickMarkRadius,
        'type': 'round',
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `paddle`
  ///  * `rectangular`
  ///
  /// All other values, including `null`, will result in `null`.
  String? encodeRangeSliderValueIndicatorShape(
    RangeSliderValueIndicatorShape? value,
  ) {
    assert(
      value == null ||
          value is PaddleRangeSliderValueIndicatorShape ||
          value is RectangularRangeSliderValueIndicatorShape,
    );
    String? result;

    if (value != null) {
      if (value is PaddleRangeSliderValueIndicatorShape) {
        result = 'paddle';
      } else if (value is RectangularRangeSliderValueIndicatorShape) {
        result = 'rectangular';
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON compatible Map.
  ///
  /// This returns the JSON representation to follow the structure:
  /// ```json
  /// {
  ///   "bottom": "<double>",
  ///   "left": "<double>",
  ///   "right": "<double>",
  ///   "top": "<double>",
  ///   "type": "ltrb"
  /// }
  /// ```
  Map<String, dynamic>? encodeRect(Rect? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'bottom': value.bottom,
        'left': value.left,
        'right': value.right,
        'top': value.top,
        'type': 'ltrb',
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON compatible Map.
  ///
  /// This returns the JSON representation to follow the structure:
  /// ```json
  /// {
  ///   "parent": "<ScrollPhysics>",
  ///   "type": "<String>"
  /// }
  /// ```
  ///
  /// Where "type" will be one of:
  ///  * `always`
  ///  * `bouncing`
  ///  * `clamping`
  ///  * `fixedExtent`
  ///  * `never`
  ///  * `page`
  ///  * `rangeMaintaining`
  Map<String, dynamic>? encodeScrollPhysics(ScrollPhysics? value) {
    assert(
      value == null ||
          value is AlwaysScrollableScrollPhysics ||
          value is BouncingScrollPhysics ||
          value is ClampingScrollPhysics ||
          value is FixedExtentScrollPhysics ||
          value is NeverScrollableScrollPhysics ||
          value is PageScrollPhysics ||
          value is RangeMaintainingScrollPhysics,
    );
    Map<String, dynamic>? result;

    if (value != null) {
      String? type;

      if (value is AlwaysScrollableScrollPhysics) {
        type = 'always';
      } else if (value is BouncingScrollPhysics) {
        type = 'bouncing';
      } else if (value is ClampingScrollPhysics) {
        type = 'clamping';
      } else if (value is FixedExtentScrollPhysics) {
        type = 'fixedExtent';
      } else if (value is NeverScrollableScrollPhysics) {
        type = 'never';
      } else if (value is PageScrollPhysics) {
        type = 'page';
      } else if (value is RangeMaintainingScrollPhysics) {
        type = 'rangeMaintaining';
      }

      if (type == null) {
        throw Exception(
          'Unknown ScrollPhysics class encounted: ${value.runtimeType}',
        );
      }
      result = {
        'parent': ThemeEncoder.instance.encodeScrollPhysics(value.parent),
        'type': type,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation as follows:
  ///
  /// ```json
  /// {
  ///   "selectedIcon": "<Icon>",
  ///   "style": "<ButtonStyle>"
  /// }
  /// ```
  Map<String, dynamic>? encodeSegmentedButtonThemeData(
    SegmentedButtonThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      final icon = value.selectedIcon;

      result = {
        'selectedIcon': icon is Icon
            ? ThemeEncoder.instance.encodeIcon(icon)
            : null,
        'style': ThemeEncoder.instance.encodeButtonStyle(value.style),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON compatible Map.  The value structure
  /// returned the type of the [ShapeBorder] passed in.
  ///
  /// `CircleBorder`
  /// ```json
  /// {
  ///   "side": "<BorderSide>",
  ///   "type": "circle"
  /// }
  /// ```
  ///
  /// `ContinuousRectangleBorder`
  /// ```json
  /// {
  ///   "borderRadius": "<BorderRadius>",
  ///   "side": "<BorderSide>",
  ///   "type": "rectangle"
  /// }
  /// ```
  ///
  /// `RoundedRectangleBorder`
  /// ```json
  /// {
  ///   "borderRadius": "<BorderRadius>",
  ///   "side": "<BorderSide>",
  ///   "type": "rounded"
  /// }
  /// ```
  ///
  /// `StadiumBorder`
  /// ```json
  /// {
  ///   "side": "<BorderSide>",
  ///   "type": "stadium"
  /// }
  /// ```
  Map<String, dynamic>? encodeShapeBorder(ShapeBorder? value) {
    assert(
      value == null ||
          value is CircleBorder ||
          value is ContinuousRectangleBorder ||
          value is RoundedRectangleBorder ||
          value is StadiumBorder,
    );
    Map<String, dynamic>? result;

    if (value != null) {
      if (value is CircleBorder) {
        result = <String, dynamic>{
          'side': ThemeEncoder.instance.encodeBorderSide(value.side),
          'type': 'circle',
        };
      } else if (value is ContinuousRectangleBorder) {
        result = <String, dynamic>{
          'borderRadius': ThemeEncoder.instance.encodeBorderRadius(
            value.borderRadius as BorderRadius?,
          ),
          'side': ThemeEncoder.instance.encodeBorderSide(value.side),
          'type': 'rectangle',
        };
      } else if (value is RoundedRectangleBorder) {
        result = <String, dynamic>{
          'borderRadius': ThemeEncoder.instance.encodeBorderRadius(
            value.borderRadius as BorderRadius?,
          ),
          'side': ThemeEncoder.instance.encodeBorderSide(value.side),
          'type': 'rounded',
        };
      } else if (value is StadiumBorder) {
        result = <String, dynamic>{
          'side': ThemeEncoder.instance.encodeBorderSide(value.side),
          'type': 'stadium',
        };
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `noOverlay`
  ///
  /// All other values, including `null`, will result in `null`.
  String? encodeSliderComponentShape(SliderComponentShape? value) {
    String? result;

    if (value != null) {
      // This one's a bit strange because both noOverlay and noThumb actually
      // point to the exact same no-op class, so there's no way to tell them
      // apart.  Might as well just pick the one that comes first
      // alphabetically.
      if (value.runtimeType == SliderComponentShape.noOverlay.runtimeType) {
        result = 'noOverlay';
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [SliderTickMarkShape] to a [String].  Supported values are:
  ///  * `noTickMark`
  String? encodeSliderTickMarkShape(SliderTickMarkShape? value) {
    String? result;

    if (value == SliderTickMarkShape.noTickMark) {
      result = 'noTickMark';
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.  This only supports
  /// encoding the following subclasses:
  ///  * `RectangularSliderTrackShape`
  ///  * `RoundedRectSliderTrackShape`
  ///
  /// The schema for the rest of the attributes depends on the sub-class.
  ///
  /// `RectangularSliderTrackShape``
  /// ```json
  /// {
  ///   "type": "rectangular"
  /// }
  /// ```
  ///
  /// `RoundedRectSliderTrackShape`
  /// ```json
  /// {
  ///   "type": "round"
  /// }
  /// ```
  Map<String, dynamic>? encodeSliderTrackShape(SliderTrackShape? value) {
    assert(
      value == null ||
          value is RectangularSliderTrackShape ||
          value is RoundedRectSliderTrackShape,
    );
    Map<String, dynamic>? result;

    if (value != null) {
      if (value is RectangularSliderTrackShape) {
        result = <String, dynamic>{'type': 'rectangular'};
      } else if (value is RoundedRectSliderTrackShape) {
        result = <String, dynamic>{'type': 'rounded'};
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the JSON representation or a String
  /// representation.  Supported values are:
  ///  * `dark`
  ///  * `light`
  ///
  /// ... or an object of the form...
  ///
  /// ```json
  /// {
  ///   "statusBarBrightness": "<Brightness>",
  ///   "statusBarColor": "<Color>",
  ///   "statusBarIconBrightness": "<Brightness>",
  ///   "systemNavigationBarColor": "<Color>",
  ///   "systemNavigationBarContrastEnforced": "<bool>",
  ///   "systemNavigationBarDividerColor": "<Color>",
  ///   "systemNavigationBarIconBrightness": "<Brightness>",
  ///   "systemStatusBarContrastEnforced': <bool>"
  /// }
  /// ```
  ///
  /// All other values, including `null`, will result in `null`.
  dynamic encodeSystemUiOverlayStyle(SystemUiOverlayStyle? value) {
    dynamic result;

    if (value != null) {
      if (value == SystemUiOverlayStyle.dark) {
        result = 'dark';
      } else if (value == SystemUiOverlayStyle.light) {
        result = 'light';
      } else {
        result = {
          'statusBarBrightness': ThemeEncoder.instance.encodeBrightness(
            value.statusBarBrightness,
          ),
          'statusBarColor': ThemeEncoder.instance.encodeColor(
            value.statusBarColor,
          ),
          'statusBarIconBrightness': ThemeEncoder.instance.encodeBrightness(
            value.statusBarIconBrightness,
          ),
          'systemNavigationBarColor': ThemeEncoder.instance.encodeColor(
            value.systemNavigationBarColor,
          ),
          'systemNavigationBarContrastEnforced':
              value.systemNavigationBarContrastEnforced,
          'systemNavigationBarDividerColor': ThemeEncoder.instance.encodeColor(
            value.systemNavigationBarDividerColor,
          ),
          'systemNavigationBarIconBrightness': ThemeEncoder.instance
              .encodeBrightness(value.systemNavigationBarIconBrightness),
          'systemStatusBarContrastEnforced':
              value.systemStatusBarContrastEnforced,
        };
      }
    }

    return result is Map<String, dynamic> ? _stripNull(result) : result;
  }

  /// Encodes the given [value] to a [TableColumnWidth].  This expects the
  /// [value] to have the following structure:
  ///
  /// ```json
  /// {
  ///   "a": "<TableColumnWidth>",
  ///   "b": "<TableColumnWidth>",
  ///   "type": "<"fixed" | "flex" | "fraction" | "intrinsic" | "max" | "min">",
  ///   "value": "<double>"
  /// }
  /// ```
  Map<String, dynamic>? encodeTableColumnWidth(TableColumnWidth? value) {
    Map<String, dynamic>? result;

    if (value is FixedColumnWidth) {
      result = {'type': 'fixed', 'value': value.value};
    } else if (value is FlexColumnWidth) {
      result = {'type': 'flex', 'value': value.value};
    } else if (value is FractionColumnWidth) {
      result = {'type': 'fraction', 'value': value.value};
    } else if (value is IntrinsicColumnWidth) {
      result = {'type': 'intrinsic', 'value': value.flex(const <RenderBox>[])};
    } else if (value is MaxColumnWidth) {
      result = {
        'a': ThemeEncoder.instance.encodeTableColumnWidth(value.a),
        'b': ThemeEncoder.instance.encodeTableColumnWidth(value.b),
        'type': 'max',
      };
    } else if (value is MinColumnWidth) {
      result = {
        'a': ThemeEncoder.instance.encodeTableColumnWidth(value.a),
        'b': ThemeEncoder.instance.encodeTableColumnWidth(value.b),
        'type': 'min',
      };
    } else if (value != null) {
      throw Exception(
        '[encodeTableColumnWidth]: unknown value type: [${value.runtimeType}]',
      );
    }

    return _stripDynamicNull(result);
  }

  Map<String, dynamic>? encodeWidgetStateColor(WidgetStateColor? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': ThemeEncoder.instance.encodeColor(
          value.resolve({WidgetState.disabled}),
        ),
        'dragged': ThemeEncoder.instance.encodeColor(
          value.resolve({WidgetState.dragged}),
        ),
        'empty': ThemeEncoder.instance.encodeColor(value.resolve({})),
        'error': ThemeEncoder.instance.encodeColor(
          value.resolve({WidgetState.error}),
        ),
        'focused': ThemeEncoder.instance.encodeColor(
          value.resolve({WidgetState.focused}),
        ),
        'hovered': ThemeEncoder.instance.encodeColor(
          value.resolve({WidgetState.hovered}),
        ),
        'pressed': ThemeEncoder.instance.encodeColor(
          value.resolve({WidgetState.pressed}),
        ),
        'scrolledUnder': ThemeEncoder.instance.encodeColor(
          value.resolve({WidgetState.scrolledUnder}),
        ),
        'selected': ThemeEncoder.instance.encodeColor(
          value.resolve({WidgetState.selected}),
        ),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] into a JSON representation.
  ///
  ///
  /// ```json
  /// {
  ///   "disabled": "<bool>",
  ///   "dragged": "<bool>",
  ///   "empty": "<bool>",
  ///   "error": "<bool>",
  ///   "focused": "<bool>",
  ///   "hovered": "<bool>",
  ///   "pressed": "<bool>",
  ///   "scrolledUnder": "<bool>",
  ///   "selected": "<bool>"
  /// }
  /// ```
  Map<String, dynamic>? encodeWidgetStatePropertyBool(
    WidgetStateProperty<bool?>? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': value.resolve({WidgetState.disabled}),
        'dragged': value.resolve({WidgetState.dragged}),
        'empty': value.resolve({}),
        'error': value.resolve({WidgetState.error}),
        'focused': value.resolve({WidgetState.focused}),
        'hovered': value.resolve({WidgetState.hovered}),
        'pressed': value.resolve({WidgetState.pressed}),
        'scrolledUnder': value.resolve({WidgetState.scrolledUnder}),
        'selected': value.resolve({WidgetState.selected}),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] into a JSON representation.
  ///
  ///
  /// ```json
  /// {
  ///   "disabled": "<BorderSide>",
  ///   "dragged": "<BorderSide>",
  ///   "empty": "<BorderSide>",
  ///   "error": "<BorderSide>",
  ///   "focused": "<BorderSide>",
  ///   "hovered": "<BorderSide>",
  ///   "pressed": "<BorderSide>",
  ///   "scrolledUnder": "<BorderSide>",
  ///   "selected": "<BorderSide>"
  /// }
  /// ```
  Map<String, dynamic>? encodeWidgetStatePropertyBorderSide(
    WidgetStateProperty<BorderSide?>? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': ThemeEncoder.instance.encodeBorderSide(
          value.resolve({WidgetState.disabled}),
        ),
        'dragged': ThemeEncoder.instance.encodeBorderSide(
          value.resolve({WidgetState.dragged}),
        ),
        'empty': ThemeEncoder.instance.encodeBorderSide(value.resolve({})),
        'error': ThemeEncoder.instance.encodeBorderSide(
          value.resolve({WidgetState.error}),
        ),
        'focused': ThemeEncoder.instance.encodeBorderSide(
          value.resolve({WidgetState.focused}),
        ),
        'hovered': ThemeEncoder.instance.encodeBorderSide(
          value.resolve({WidgetState.hovered}),
        ),
        'pressed': ThemeEncoder.instance.encodeBorderSide(
          value.resolve({WidgetState.pressed}),
        ),
        'scrolledUnder': ThemeEncoder.instance.encodeBorderSide(
          value.resolve({WidgetState.scrolledUnder}),
        ),
        'selected': ThemeEncoder.instance.encodeBorderSide(
          value.resolve({WidgetState.selected}),
        ),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] into a JSON representation.
  ///
  ///
  /// ```json
  /// {
  ///   "disabled": "<Color>",
  ///   "dragged": "<Color>",
  ///   "empty": "<Color>",
  ///   "error": "<Color>",
  ///   "focused": "<Color>",
  ///   "hovered": "<Color>",
  ///   "pressed": "<Color>",
  ///   "scrolledUnder": "<Color>",
  ///   "selected": "<Color>"
  /// }
  /// ```
  Map<String, dynamic>? encodeWidgetStatePropertyColor(
    WidgetStateProperty<Color?>? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': ThemeEncoder.instance.encodeColor(
          value.resolve({WidgetState.disabled}),
        ),
        'dragged': ThemeEncoder.instance.encodeColor(
          value.resolve({WidgetState.dragged}),
        ),
        'empty': ThemeEncoder.instance.encodeColor(value.resolve({})),
        'error': ThemeEncoder.instance.encodeColor(
          value.resolve({WidgetState.error}),
        ),
        'focused': ThemeEncoder.instance.encodeColor(
          value.resolve({WidgetState.focused}),
        ),
        'hovered': ThemeEncoder.instance.encodeColor(
          value.resolve({WidgetState.hovered}),
        ),
        'pressed': ThemeEncoder.instance.encodeColor(
          value.resolve({WidgetState.pressed}),
        ),
        'scrolledUnder': ThemeEncoder.instance.encodeColor(
          value.resolve({WidgetState.scrolledUnder}),
        ),
        'selected': ThemeEncoder.instance.encodeColor(
          value.resolve({WidgetState.selected}),
        ),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] into a JSON representation.
  ///
  ///
  /// ```json
  /// {
  ///   "disabled": "<double>",
  ///   "dragged": "<double>",
  ///   "empty": "<double>",
  ///   "error": "<double>",
  ///   "focused": "<double>",
  ///   "hovered": "<double>",
  ///   "pressed": "<double>",
  ///   "scrolledUnder": "<double>",
  ///   "selected": "<double>"
  /// }
  /// ```
  Map<String, dynamic>? encodeWidgetStatePropertyDouble(
    WidgetStateProperty<double?>? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': value.resolve({WidgetState.disabled}),
        'dragged': value.resolve({WidgetState.dragged}),
        'empty': value.resolve({}),
        'error': value.resolve({WidgetState.error}),
        'focused': value.resolve({WidgetState.focused}),
        'hovered': value.resolve({WidgetState.hovered}),
        'pressed': value.resolve({WidgetState.pressed}),
        'scrolledUnder': value.resolve({WidgetState.scrolledUnder}),
        'selected': value.resolve({WidgetState.selected}),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] into a JSON representation.
  ///
  ///
  /// ```json
  /// {
  ///   "disabled": "<EdgeInsetsGeometry>",
  ///   "dragged": "<EdgeInsetsGeometry>",
  ///   "empty": "<EdgeInsetsGeometry>",
  ///   "error": "<EdgeInsetsGeometry>",
  ///   "focused": "<EdgeInsetsGeometry>",
  ///   "hovered": "<EdgeInsetsGeometry>",
  ///   "pressed": "<EdgeInsetsGeometry>",
  ///   "scrolledUnder": "<EdgeInsetsGeometry>",
  ///   "selected": "<EdgeInsetsGeometry>"
  /// }
  /// ```
  Map<String, dynamic>? encodeWidgetStatePropertyEdgeInsetsGeometry(
    WidgetStateProperty<EdgeInsetsGeometry?>? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': ThemeEncoder.instance.encodeEdgeInsetsGeometry(
          value.resolve({WidgetState.disabled}) as EdgeInsets?,
        ),
        'dragged': ThemeEncoder.instance.encodeEdgeInsetsGeometry(
          value.resolve({WidgetState.dragged}) as EdgeInsets?,
        ),
        'empty': ThemeEncoder.instance.encodeEdgeInsetsGeometry(
          value.resolve({}) as EdgeInsets?,
        ),
        'error': ThemeEncoder.instance.encodeEdgeInsetsGeometry(
          value.resolve({WidgetState.error}) as EdgeInsets?,
        ),
        'focused': ThemeEncoder.instance.encodeEdgeInsetsGeometry(
          value.resolve({WidgetState.focused}) as EdgeInsets?,
        ),
        'hovered': ThemeEncoder.instance.encodeEdgeInsetsGeometry(
          value.resolve({WidgetState.hovered}) as EdgeInsets?,
        ),
        'pressed': ThemeEncoder.instance.encodeEdgeInsetsGeometry(
          value.resolve({WidgetState.pressed}) as EdgeInsets?,
        ),
        'scrolledUnder': ThemeEncoder.instance.encodeEdgeInsetsGeometry(
          value.resolve({WidgetState.scrolledUnder}) as EdgeInsets?,
        ),
        'selected': ThemeEncoder.instance.encodeEdgeInsetsGeometry(
          value.resolve({WidgetState.selected}) as EdgeInsets?,
        ),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] into a JSON representation.
  ///
  ///
  /// ```json
  /// {
  ///   "disabled": "<IconThemeData>",
  ///   "dragged": "<IconThemeData>",
  ///   "empty": "<IconThemeData>",
  ///   "error": "<IconThemeData>",
  ///   "focused": "<IconThemeData>",
  ///   "hovered": "<IconThemeData>",
  ///   "pressed": "<IconThemeData>",
  ///   "scrolledUnder": "<IconThemeData>",
  ///   "selected": "<IconThemeData>"
  /// }
  /// ```
  Map<String, dynamic>? encodeWidgetStatePropertyIconThemeData(
    WidgetStateProperty<IconThemeData?>? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': ThemeEncoder.instance.encodeIconThemeData(
          value.resolve({WidgetState.disabled}),
        ),
        'dragged': ThemeEncoder.instance.encodeIconThemeData(
          value.resolve({WidgetState.dragged}),
        ),
        'empty': ThemeEncoder.instance.encodeIconThemeData(value.resolve({})),
        'error': ThemeEncoder.instance.encodeIconThemeData(
          value.resolve({WidgetState.error}),
        ),
        'focused': ThemeEncoder.instance.encodeIconThemeData(
          value.resolve({WidgetState.focused}),
        ),
        'hovered': ThemeEncoder.instance.encodeIconThemeData(
          value.resolve({WidgetState.hovered}),
        ),
        'pressed': ThemeEncoder.instance.encodeIconThemeData(
          value.resolve({WidgetState.pressed}),
        ),
        'scrolledUnder': ThemeEncoder.instance.encodeIconThemeData(
          value.resolve({WidgetState.selected}),
        ),
        'selected': ThemeEncoder.instance.encodeIconThemeData(
          value.resolve({WidgetState.selected}),
        ),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] into a JSON representation.
  ///
  ///
  /// ```json
  /// {
  ///   "disabled": "<MouseCursor>",
  ///   "dragged": "<MouseCursor>",
  ///   "empty": "<MouseCursor>",
  ///   "error": "<MouseCursor>",
  ///   "focused": "<MouseCursor>",
  ///   "hovered": "<MouseCursor>",
  ///   "pressed": "<MouseCursor>",
  ///   "scrolledUnder": "<MouseCursor>",
  ///   "selected": "<MouseCursor>"
  /// }
  /// ```
  Map<String, dynamic>? encodeWidgetStatePropertyMouseCursor(
    WidgetStateProperty<MouseCursor?>? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': ThemeEncoder.instance.encodeMouseCursor(
          value.resolve({WidgetState.disabled}),
        ),
        'dragged': ThemeEncoder.instance.encodeMouseCursor(
          value.resolve({WidgetState.dragged}),
        ),
        'empty': ThemeEncoder.instance.encodeMouseCursor(value.resolve({})),
        'error': ThemeEncoder.instance.encodeMouseCursor(
          value.resolve({WidgetState.error}),
        ),
        'focused': ThemeEncoder.instance.encodeMouseCursor(
          value.resolve({WidgetState.focused}),
        ),
        'hovered': ThemeEncoder.instance.encodeMouseCursor(
          value.resolve({WidgetState.hovered}),
        ),
        'pressed': ThemeEncoder.instance.encodeMouseCursor(
          value.resolve({WidgetState.pressed}),
        ),
        'scrolledUnder': ThemeEncoder.instance.encodeMouseCursor(
          value.resolve({WidgetState.scrolledUnder}),
        ),
        'selected': ThemeEncoder.instance.encodeMouseCursor(
          value.resolve({WidgetState.selected}),
        ),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] into a JSON representation.
  ///
  ///
  /// ```json
  /// {
  ///   "disabled": "<OutlinedBorder>",
  ///   "dragged": "<OutlinedBorder>",
  ///   "empty": "<OutlinedBorder>",
  ///   "error": "<OutlinedBorder>",
  ///   "focused": "<OutlinedBorder>",
  ///   "hovered": "<OutlinedBorder>",
  ///   "pressed": "<OutlinedBorder>",
  ///   "scrolledUnder": "<OutlinedBorder>",
  ///   "selected": "<OutlinedBorder>"
  /// }
  /// ```
  Map<String, dynamic>? encodeWidgetStatePropertyOutlinedBorder(
    WidgetStateProperty<OutlinedBorder?>? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': ThemeEncoder.instance.encodeOutlinedBorder(
          value.resolve({WidgetState.disabled}),
        ),
        'dragged': ThemeEncoder.instance.encodeOutlinedBorder(
          value.resolve({WidgetState.dragged}),
        ),
        'empty': ThemeEncoder.instance.encodeOutlinedBorder(value.resolve({})),
        'error': ThemeEncoder.instance.encodeOutlinedBorder(
          value.resolve({WidgetState.error}),
        ),
        'focused': ThemeEncoder.instance.encodeOutlinedBorder(
          value.resolve({WidgetState.focused}),
        ),
        'hovered': ThemeEncoder.instance.encodeOutlinedBorder(
          value.resolve({WidgetState.hovered}),
        ),
        'pressed': ThemeEncoder.instance.encodeOutlinedBorder(
          value.resolve({WidgetState.pressed}),
        ),
        'scrolledUnder': ThemeEncoder.instance.encodeOutlinedBorder(
          value.resolve({WidgetState.scrolledUnder}),
        ),
        'selected': ThemeEncoder.instance.encodeOutlinedBorder(
          value.resolve({WidgetState.selected}),
        ),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] into a JSON representation.
  ///
  ///
  /// ```json
  /// {
  ///   "disabled": "<Size>",
  ///   "dragged": "<Size>",
  ///   "empty": "<Size>",
  ///   "error": "<Size>",
  ///   "focused": "<Size>",
  ///   "hovered": "<Size>",
  ///   "pressed": "<Size>",
  ///   "scrolledUnder": "<Size>",
  ///   "selected": "<Size>"
  /// }
  /// ```
  Map<String, dynamic>? encodeWidgetStatePropertySize(
    WidgetStateProperty<Size?>? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': ThemeEncoder.instance.encodeSize(
          value.resolve({WidgetState.disabled}),
        ),
        'dragged': ThemeEncoder.instance.encodeSize(
          value.resolve({WidgetState.dragged}),
        ),
        'empty': ThemeEncoder.instance.encodeSize(value.resolve({})),
        'error': ThemeEncoder.instance.encodeSize(
          value.resolve({WidgetState.error}),
        ),
        'focused': ThemeEncoder.instance.encodeSize(
          value.resolve({WidgetState.focused}),
        ),
        'hovered': ThemeEncoder.instance.encodeSize(
          value.resolve({WidgetState.hovered}),
        ),
        'pressed': ThemeEncoder.instance.encodeSize(
          value.resolve({WidgetState.pressed}),
        ),
        'scrolledUnder': ThemeEncoder.instance.encodeSize(
          value.resolve({WidgetState.scrolledUnder}),
        ),
        'selected': ThemeEncoder.instance.encodeSize(
          value.resolve({WidgetState.selected}),
        ),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] into a JSON representation.
  ///
  ///
  /// ```json
  /// {
  ///   "disabled": "<TextStyle>",
  ///   "dragged": "<TextStyle>",
  ///   "empty": "<TextStyle>",
  ///   "error": "<TextStyle>",
  ///   "focused": "<TextStyle>",
  ///   "hovered": "<TextStyle>",
  ///   "pressed": "<TextStyle>",
  ///   "scrolledUnder": "<TextStyle>",
  ///   "selected": "<TextStyle>",
  /// }
  /// ```
  ///
  Map<String, dynamic>? encodeWidgetStatePropertyTextStyle(
    WidgetStateProperty<TextStyle?>? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': ThemeEncoder.instance.encodeTextStyle(
          value.resolve({WidgetState.disabled}),
        ),
        'dragged': ThemeEncoder.instance.encodeTextStyle(
          value.resolve({WidgetState.dragged}),
        ),
        'empty': ThemeEncoder.instance.encodeTextStyle(value.resolve({})),
        'error': ThemeEncoder.instance.encodeTextStyle(
          value.resolve({WidgetState.error}),
        ),
        'focused': ThemeEncoder.instance.encodeTextStyle(
          value.resolve({WidgetState.focused}),
        ),
        'hovered': ThemeEncoder.instance.encodeTextStyle(
          value.resolve({WidgetState.hovered}),
        ),
        'pressed': ThemeEncoder.instance.encodeTextStyle(
          value.resolve({WidgetState.pressed}),
        ),
        'scrolledUnder': ThemeEncoder.instance.encodeTextStyle(
          value.resolve({WidgetState.scrolledUnder}),
        ),
        'selected': ThemeEncoder.instance.encodeTextStyle(
          value.resolve({WidgetState.selected}),
        ),
      };
    }

    return _stripDynamicNull(result);
  }

  dynamic _stripDynamicNull(dynamic input) {
    var result = input;

    if (input is Map<String, dynamic>) {
      result = _stripNull(input);
    }

    return result;
  }

  Map<String, dynamic>? _stripNull(Map<String, dynamic>? input) {
    Map<String, dynamic>? result;

    if (input != null) {
      result ??= <String, dynamic>{};

      for (var entry in input.entries) {
        if (entry.value != null) {
          if (entry.value is Map) {
            final processed = _stripNull(entry.value);
            if (processed != null) {
              result[entry.key] = processed;
            }
          } else {
            result[entry.key] = entry.value;
          }
        }
      }
    }

    return result?.isNotEmpty == true ? result : null;
  }

  List<T>? _encodeList<T>(
    Iterable<dynamic>? list,
    T Function(dynamic value) encoder,
  ) {
    List<T>? result;

    if (list != null) {
      result = [];
      for (var value in list) {
        result.add(encoder(value));
      }
    }

    return result;
  }
}
