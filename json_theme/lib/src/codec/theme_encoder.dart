import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:json_theme_annotation/json_theme_annotation.dart';

/// Encoder capable of converting Flutter Theme related classes and enums into
/// JSON compatible values.
///
/// Unless otherwise stated, each function will return `null` when given an
/// input of `null`.
@immutable
@JsonThemeCodec('encode')
class ThemeEncoder {
  const ThemeEncoder._();

  static Map<String, dynamic>? encodeActionIconThemeData(
    ActionIconThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        // 'backButtonIconBuilder': @unencodable
        // 'closeButtonIconBuilder': @unencodable
        // 'drawerButtonIconBuilder': @unencodable
        // 'endDrawerButtonIconBuilder': @unencodable
      };
    }

    return result;
  }

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
  static dynamic encodeAlignment(Alignment? value) {
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
        result = {
          'x': value.x,
          'y': value.y,
        };
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
  static String? encodeAlignmentDirectional(
    AlignmentDirectional? value, {
    bool validate = true,
  }) {
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
  static dynamic encodeAlignmentGeometry(
    AlignmentGeometry? value, {
    bool validate = true,
  }) {
    dynamic result;

    if (value != null) {
      if (value is AlignmentDirectional) {
        result = encodeAlignmentDirectional(value);
      } else if (value is Alignment) {
        result = encodeAlignment(value);
      } else {
        throw Exception(
          'Unknown type of AlignmentGeometry encountered: ${value.runtimeType}.',
        );
      }
    }
    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a [String].  Supported values are:
  /// * `glow`
  /// * `stretch`
  static String? encodeAndroidOverscrollIndicator(
    AndroidOverscrollIndicator? value,
  ) {
    String? result;

    if (value != null) {
      switch (value) {
        case AndroidOverscrollIndicator.glow:
          result = 'glow';
          break;

        case AndroidOverscrollIndicator.stretch:
          result = 'stretch';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "actionsIconTheme": "<IconThemeData>",
  ///   "backgroundColor": "<Color>",
  ///   "centerTitle": "<bool>",
  ///   "elevation": "<double>",
  ///   "foregroundColor": "<Color>",
  ///   "iconTheme": "<IconThemeData>",
  ///   "scrolledUnderElevation": "<double>",
  ///   "shadowColor": "<Color>",
  ///   "surfaceTintColor": "<Color>",
  ///   "systemOverlayStyle": "<SystemUiOverlayStyle>",
  ///   "titleSpacing": "<double>",
  ///   "titleTextStyle": "<TextStyle>",
  ///   "toolbarHeight": "<double>",
  ///   "toolbarTextStyle": "<TextStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBrightness]
  ///  * [encodeColor]
  ///  * [encodeIconThemeData]
  ///  * [encodeSystemUiOverlayStyle]
  ///  * [encodeToolbarTextStyle]
  static Map<String, dynamic>? encodeAppBarTheme(AppBarTheme? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'actionsIconTheme': encodeIconThemeData(value.actionsIconTheme),
        'backgroundColor': encodeColor(value.backgroundColor),
        'centerTitle': value.centerTitle,
        'elevation': value.elevation,
        'foregroundColor': encodeColor(value.foregroundColor),
        'iconTheme': encodeIconThemeData(value.iconTheme),
        'scrolledUnderElevation': value.scrolledUnderElevation,
        'shadowColor': encodeColor(value.shadowColor),
        'surfaceTintColor': encodeColor(value.surfaceTintColor),
        'systemOverlayStyle': encodeSystemUiOverlayStyle(
          value.systemOverlayStyle,
        ),
        'titleSpacing': value.titleSpacing,
        'titleTextStyle': encodeTextStyle(value.titleTextStyle),
        'toolbarHeight': value.toolbarHeight,
        'toolbarTextStyle': encodeTextStyle(value.toolbarTextStyle),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a [String].  Supported values are:
  /// * `always`
  /// * `disabled`
  /// * `onUserInteraction`
  /// * `onUnfocus`
  static String? encodeAutovalidateMode(AutovalidateMode? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case AutovalidateMode.always:
          result = 'always';
          break;

        case AutovalidateMode.disabled:
          result = 'disabled';
          break;

        case AutovalidateMode.onUserInteraction:
          result = 'onUserInteraction';
          break;

        case AutovalidateMode.onUnfocus:
          result = 'onUnfocus';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `horizontal`
  ///  * `vertical`
  static String? encodeAxis(Axis? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case Axis.horizontal:
          result = 'horizontal';
          break;

        case Axis.vertical:
          result = 'vertical';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to an JSON encoded map.  This provides the given
  /// structure below:
  ///
  /// ```json
  /// {
  ///   "alignment": "<AlignmentGeometry>",
  ///   "backgroundColor": "<Color>",
  ///   "largeSize": "<double>",
  ///   "offset": "<Offset>",
  ///   "padding": "<EdgeInsets>",
  ///   "smallSize": "<double>",
  ///   "textColor": "<Color>",
  ///   "textStyle": "<TextStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeAlignmentGeometry]
  ///  * [encodeColor]
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeOffset]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeBadgeThemeData(BadgeThemeData? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'alignment': encodeAlignmentGeometry(value.alignment),
        'backgroundColor': encodeColor(value.backgroundColor),
        'largeSize': value.largeSize,
        'offset': encodeOffset(value.offset),
        'padding': encodeEdgeInsetsGeometry(value.padding as EdgeInsets?),
        'smallSize': value.smallSize,
        'textColor': encodeColor(value.textColor),
        'textStyle': encodeTextStyle(value.textStyle),
      };
    }

    return _stripDynamicNull(result);
  }

  /// encodes the given [value] to an [BlendMode].  Supported values are:
  /// * `clear`
  /// * `color`
  /// * `colorBurn`
  /// * `colorDodge`
  /// * `darken`
  /// * `difference`
  /// * `dst`
  /// * `dstATop`
  /// * `dstIn`
  /// * `dstOut`
  /// * `dstOver`
  /// * `exclusion`
  /// * `hardLight`
  /// * `hue`
  /// * `lighten`
  /// * `luminosity`
  /// * `modulate`
  /// * `multiply`
  /// * `overlay`
  /// * `plus`
  /// * `saturation`
  /// * `screen`
  /// * `softLight`
  /// * `src`
  /// * `srcATop`
  /// * `srcIn`
  /// * `srcOut`
  /// * `srcOver`
  /// * `xor`
  static String? encodeBlendMode(BlendMode? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case BlendMode.clear:
          result = 'clear';
          break;

        case BlendMode.color:
          result = 'color';
          break;

        case BlendMode.colorBurn:
          result = 'colorBurn';
          break;

        case BlendMode.colorDodge:
          result = 'colorDodge';
          break;

        case BlendMode.darken:
          result = 'darken';
          break;

        case BlendMode.difference:
          result = 'difference';
          break;

        case BlendMode.dst:
          result = 'dst';
          break;

        case BlendMode.dstATop:
          result = 'dstATop';
          break;

        case BlendMode.dstIn:
          result = 'dstIn';
          break;

        case BlendMode.dstOut:
          result = 'dstOut';
          break;

        case BlendMode.dstOver:
          result = 'dstOver';
          break;

        case BlendMode.exclusion:
          result = 'exclusion';
          break;

        case BlendMode.hardLight:
          result = 'hardLight';
          break;

        case BlendMode.hue:
          result = 'hue';
          break;

        case BlendMode.lighten:
          result = 'lighten';
          break;

        case BlendMode.luminosity:
          result = 'luminosity';
          break;

        case BlendMode.modulate:
          result = 'modulate';
          break;

        case BlendMode.multiply:
          result = 'multiply';
          break;

        case BlendMode.overlay:
          result = 'overlay';
          break;

        case BlendMode.plus:
          result = 'plus';
          break;

        case BlendMode.saturation:
          result = 'saturation';
          break;

        case BlendMode.screen:
          result = 'screen';
          break;

        case BlendMode.softLight:
          result = 'softLight';
          break;

        case BlendMode.src:
          result = 'src';
          break;

        case BlendMode.srcATop:
          result = 'srcATop';
          break;

        case BlendMode.srcIn:
          result = 'srcIn';
          break;

        case BlendMode.srcOut:
          result = 'srcOut';
          break;

        case BlendMode.srcOver:
          result = 'srcOver';
          break;

        case BlendMode.xor:
          result = 'xor';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  static String? encodeBlurStyle(BlurStyle? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case BlurStyle.inner:
          result = 'inner';
          break;

        case BlurStyle.normal:
          result = 'normal';
          break;

        case BlurStyle.outer:
          result = 'outer';
          break;

        case BlurStyle.solid:
          result = 'solid';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

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
  ///  ///
  /// See also:
  ///  * [encodeRadius]
  static Map<String, dynamic>? encodeBorderRadius(BorderRadius? value) {
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

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "color": "<Color>",
  ///   "style": "<BorderStyle>",
  ///   "width": "<double>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBorderStyle]
  ///  * [encodeColor]
  static Map<String, dynamic>? encodeBorderSide(BorderSide? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'color': encodeColor(value.color),
        'strokeAlign': value.strokeAlign,
        'style': encodeBorderStyle(value.style),
        'width': value.width,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `none`
  ///  * `solid`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeBorderStyle(BorderStyle? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case BorderStyle.none:
          result = 'none';
          break;

        case BorderStyle.solid:
          result = 'solid';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "color": "<Color>",
  ///   "elevation": "<double>",
  ///   "height": "<double>",
  ///   "padding": "<EdgeInsets>",
  ///   "shadowColor": "<Color>",
  ///   "shape": "<NotchedShape>",
  ///   "surfaceTintColor": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeNotchedShape]
  static Map<String, dynamic>? encodeBottomAppBarTheme(
    BottomAppBarTheme? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'color': encodeColor(value.color),
        'elevation': value.elevation,
        'height': value.height,
        'padding': encodeEdgeInsetsGeometry(value.padding as EdgeInsets?),
        'shadowColor': encodeColor(value.shadowColor),
        'shape': encodeNotchedShape(value.shape),
        'surfaceTintColor': encodeColor(value.color),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [BottomNavigationBarThemeData] to a JSON compatible map.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "elevation": "<double>",
  ///   "landscapeLayout": "<BottomNavigationBarLandscapeLayout>",
  ///   "selectedIconTheme": "<IconThemeData>",
  ///   "selectedIconColor": "<Color>",
  ///   "selectedLabelStyle": "<TextStyle>",
  ///   "showSelectedLabels": "<bool>",
  ///   "showUnselectedLabels": "<bool>",
  ///   "type": "<BottomNavigationBarType>",
  ///   "unselectedIconTheme": "<IconThemeData>",
  ///   "unselectedItemColor": "<Color>",
  ///   "unselectedLabelStyle": "<TextStyle>",
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBottomNavigationBarType]
  ///  * [encodeColor]
  ///  * [encodeIconThemeData]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeBottomNavigationBarThemeData(
    BottomNavigationBarThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'backgroundColor': encodeColor(value.backgroundColor),
        'elevation': value.elevation,
        'landscapeLayout': encodeBottomNavigationBarLandscapeLayout(
          value.landscapeLayout,
        ),
        'selectedIconTheme': encodeIconThemeData(value.selectedIconTheme),
        'selectedItemColor': encodeColor(value.selectedItemColor),
        'selectedLabelStyle': encodeTextStyle(value.selectedLabelStyle),
        'showSelectedLabels': value.showSelectedLabels,
        'showUnselectedLabels': value.showUnselectedLabels,
        'type': encodeBottomNavigationBarType(value.type),
        'unselectedIconTheme': encodeIconThemeData(value.unselectedIconTheme),
        'unselectedItemColor': encodeColor(value.unselectedItemColor),
        'unselectedLabelStyle': encodeTextStyle(value.unselectedLabelStyle),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `centered`
  ///  * `linear`
  ///  * `spread`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeBottomNavigationBarLandscapeLayout(
    BottomNavigationBarLandscapeLayout? value,
  ) {
    String? result;

    if (value != null) {
      switch (value) {
        case BottomNavigationBarLandscapeLayout.centered:
          result = 'centered';
          break;

        case BottomNavigationBarLandscapeLayout.linear:
          result = 'linear';
          break;

        case BottomNavigationBarLandscapeLayout.spread:
          result = 'spread';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `fixed`
  ///  * `shifting`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeBottomNavigationBarType(BottomNavigationBarType? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case BottomNavigationBarType.fixed:
          result = 'fixed';
          break;
        case BottomNavigationBarType.shifting:
          result = 'shifting';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "clipBehavior": "<Clip>",
  ///   "constraints": "<BoxConstraints>",
  ///   "dragHandleColor": "<Color>",
  ///   "dragHandleSize": "<Size>",
  ///   "elevation": "<double>",
  ///   "modalBackgroundColor": "<Color>",
  ///   "modalBarrierColor": "<Color>",
  ///   "modalElevation": "<double>",
  ///   "shadowColor": "<Color>",
  ///   "shape": "<ShapeBorder>",
  ///   "showDragHandle": "<bool>",
  ///   "surfaceTintColor": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBoxConstraints]
  ///  * [encodeClip]
  ///  * [encodeColor]
  ///  * [encodeShapeBorder]
  ///  * [encodeSize]
  static Map<String, dynamic>? encodeBottomSheetThemeData(
    BottomSheetThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'backgroundColor': encodeColor(value.backgroundColor),
        'clipBehavior': encodeClip(value.clipBehavior),
        'constraints': encodeBoxConstraints(value.constraints),
        'dragHandleColor': encodeColor(value.dragHandleColor),
        'dragHandleSize': encodeSize(value.dragHandleSize),
        'elevation': value.elevation,
        'modalBackgroundColor': encodeColor(value.modalBackgroundColor),
        'modalBarrierColor': encodeColor(value.modalBarrierColor),
        'modalElevation': value.modalElevation,
        'shadowColor': encodeColor(value.shadowColor),
        'shape': encodeShapeBorder(value.shape),
        'showDragHandle': value.showDragHandle,
        'surfaceTintColor': encodeColor(value.surfaceTintColor),
      };
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
  ///
  /// See also:
  ///  * [encodeBorderSide]
  static Map<String, dynamic>? encodeBoxBorder(Border? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'bottom': encodeBorderSide(value.bottom),
        'left': encodeBorderSide(value.left),
        'right': encodeBorderSide(value.right),
        'top': encodeBorderSide(value.top),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] into a JSON compatible map.  This produces a Map
  /// in the following format:
  ///
  /// ```json
  /// {
  ///   "maxHeight": "<double>",
  ///   "maxWidth": "<double>",
  ///   "minHeight": "<double>",
  ///   "minWidth": "<double>"
  /// }
  /// ```
  ///
  /// A [value] of `null` will result in `null` being returned.
  static Map<String, dynamic>? encodeBoxConstraints(BoxConstraints? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'maxHeight':
            value.maxHeight == double.infinity ? null : value.maxHeight,
        'maxWidth': value.maxWidth == double.infinity ? null : value.maxWidth,
        'minHeight': value.minHeight,
        'minWidth': value.minWidth,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] into a JSON compatible map.  This produces a Map
  /// in the following format:
  ///
  /// ```json
  /// {
  ///   "backgroundBlendMode": "<BlendMode>",
  ///   "border": "<BoxBorder>",
  ///   "borderRadius": "<BorderRadius>",
  ///   "boxShadow": "<BoxShadow[]>"
  ///   "color": "<Color>",
  ///   "image": "<DecorationImage>",
  ///   "gradient": "<Gradient>",
  ///   "shape": "<BoxShape>"
  /// }
  /// ```
  ///
  /// A [value] of `null` will result in `null` being returned.
  ///
  /// See also:
  ///  * [encodeBlendMode]
  ///  * [encodeBorderRadius]
  ///  * [encodeBoxBorder]
  ///  * [encodeBoxShadow]
  ///  * [encodeBoxShape]
  ///  * [encodeColor]
  ///  * [encodeDecorationImage]
  ///  * [encodeGradient]
  static Map<String, dynamic>? encodeBoxDecoration(BoxDecoration? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'backgroundBlendMode': encodeBlendMode(value.backgroundBlendMode),
        'border': encodeBoxBorder(value.border as Border?),
        'borderRadius': encodeBorderRadius(value.borderRadius as BorderRadius?),
        'boxShadow': _encodeList(
          value.boxShadow,
          (value) => encodeBoxShadow(value),
        ),
        'color': encodeColor(value.color),
        'image': encodeDecorationImage(value.image),
        'gradient': encodeGradient(value.gradient),
        'shape': encodeBoxShape(value.shape),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `contain`
  ///  * `cover`
  ///  * `fill`
  ///  * `fitHeight`
  ///  * `fitWidth`
  ///  * `none`
  ///  * `scaleDown`
  static String? encodeBoxFit(BoxFit? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case BoxFit.contain:
          result = 'contain';
          break;

        case BoxFit.cover:
          result = 'cover';
          break;

        case BoxFit.fill:
          result = 'fill';
          break;

        case BoxFit.fitHeight:
          result = 'fitHeight';
          break;

        case BoxFit.fitWidth:
          result = 'fitWidth';
          break;

        case BoxFit.none:
          result = 'none';
          break;

        case BoxFit.scaleDown:
          result = 'scaleDown';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] to a `String`.  Supported values are:
  ///  * `includeLineSpacingBottom`
  ///  * `includeLineSpacingMiddle`
  ///  * `includeLineSpacingTop`
  ///  * `max`
  ///  * `strut`
  ///  * `tight`
  static String? encodeBoxHeightStyle(BoxHeightStyle? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case BoxHeightStyle.includeLineSpacingBottom:
          result = 'includeLineSpacingBottom';
          break;
        case BoxHeightStyle.includeLineSpacingMiddle:
          result = 'includeLineSpacingMiddle';
          break;
        case BoxHeightStyle.includeLineSpacingTop:
          result = 'includeLineSpacingTop';
          break;
        case BoxHeightStyle.max:
          result = 'max';
          break;
        case BoxHeightStyle.strut:
          result = 'strut';
          break;
        case BoxHeightStyle.tight:
          result = 'tight';
          break;
      }
    }

    return result;
  }

  /// Encodes the given [value] into a JSON compatible map.  This produces a Map
  /// in the following format:
  ///
  /// ```json
  /// {
  ///   "blurRadius": "<double>",
  ///   "blurStyle": "<BlurStyle>",
  ///   "color": "<Color>",
  ///   "offset": "<Offset>",
  ///   "spreadRadius": "<double>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeOffset]
  static Map<String, dynamic>? encodeBoxShadow(dynamic value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'blurRadius': value.blurRadius,
        'blurStyle': encodeBlurStyle(value.blurStyle),
        'color': encodeColor(value.color),
        'offset': encodeOffset(value.offset),
        'spreadRadius': value.spreadRadius,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a [BoxShape].  Supported values are:
  ///  * `circle`
  ///  * `rectangle`
  static String? encodeBoxShape(BoxShape? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case BoxShape.circle:
          result = 'circle';
          break;

        case BoxShape.rectangle:
          result = 'rectangle';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] to a `String`.  Supported values are:
  ///  * `max`
  ///  * `tight`
  static String? encodeBoxWidthStyle(BoxWidthStyle? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case BoxWidthStyle.max:
          result = 'max';
          break;
        case BoxWidthStyle.tight:
          result = 'tight';
          break;
      }
    }

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `dark`
  ///  * `light`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeBrightness(Brightness? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case Brightness.dark:
          result = 'dark';
          break;

        case Brightness.light:
          result = 'light';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `constrained`
  ///  * `padded`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeButtonBarLayoutBehavior(ButtonBarLayoutBehavior? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case ButtonBarLayoutBehavior.constrained:
          result = 'constrained';
          break;
        case ButtonBarLayoutBehavior.padded:
          result = 'padded';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "alignment": "<MainAxisAlignment>",
  ///   "buttonAlignedDropdown": "<bool>",
  ///   "buttonHeight": "<double>",
  ///   "buttonMinWidth": "<double>",
  ///   "buttonPadding": "<EdgeInsetsGeometry>",
  ///   "buttonTextTheme": "<ButtonTextTheme>",
  ///   "layoutBehavior": "<ButtonBarLayoutBehavior>",
  ///   "mainAxisSize": "<MainAxisSize>",
  ///   "overflowDirection": "<VerticalDirection>",
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeButtonBarLayoutBehavior]
  ///  * [encodeButtonTextTheme]
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeMainAxisAlignment]
  ///  * [encodeMainAxisSize]
  ///  * [encodeVerticalDirection]
  static Map<String, dynamic>? encodeButtonBarThemeData(
    ButtonBarThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'alignment': encodeMainAxisAlignment(value.alignment),
        'buttonAlignedDropdown': value.buttonAlignedDropdown,
        'buttonHeight': value.buttonHeight,
        'buttonMinWidth': value.buttonMinWidth,
        'buttonPadding':
            encodeEdgeInsetsGeometry(value.buttonPadding as EdgeInsets?),
        'buttonTextTheme': encodeButtonTextTheme(value.buttonTextTheme),
        'layoutBehavior': encodeButtonBarLayoutBehavior(value.layoutBehavior),
        'mainAxisSize': encodeMainAxisSize(value.mainAxisSize),
        'overflowDirection': encodeVerticalDirection(value.overflowDirection),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "alignment": "<AlignmentGeometry>",
  ///   "animationDuration": "<MaterialStateProperty<double>>",
  ///   "backgroundColor": "<MaterialStateProperty<Color>>",
  ///   "elevation": "<MaterialStateProperty<double>>",
  ///   "enableFeedback": "<bool>",
  ///   "fixedSize": "<MaterialStateProperty<double>>",
  ///   "foregroundColor": "<MaterialStateProperty<Color>>",
  ///   "iconColor": "<MaterialStateProperty<Color>>",
  ///   "iconSize": "<MaterialStateProperty<double>>",
  ///   "maximumSize": "<MaterialStateProperty<double>>",
  ///   "minimumSize": "<MaterialStateProperty<Size>>",
  ///   "mouseCursor": "<MaterialStateProperty<MouseCursor>>",
  ///   "overlayColor": "<MaterialStateProperty<Color>>",
  ///   "padding": "<MaterialStateProperty<EdgeInsetsGeometry>>",
  ///   "shadowColor": "<MaterialStateProperty<Color>>",
  ///   "shape": "<MaterialStateProperty<OutlinedBorder>>",
  ///   "side": "<MaterialStateProperty<BorderSide>>",
  ///   "splashFactory": "<InteractiveInkSplashFactory>",
  ///   "surfaceTintColor": "<MaterialStateProperty<Color>>",
  ///   "tapTargetSize": "<MaterialTapTargetSize>",
  ///   "textStyle": "<MaterialStateProperty<TextStyle>>",
  ///   "visualDensity": "<VisualDensity>"
  /// }
  /// ```
  ///
  /// This won't maintain the [WidgetStateProperty] of each corresponding
  /// property, instead will resolve them by using an empty set of states,
  /// returning and encoding the resolved object.
  ///
  /// See also:
  ///  * [encodeBorderSide]
  ///  * [encodeColor]
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeInteractiveInkSplashFactory]
  ///  * [encodeWidgetStatePropertyBorderSide]
  ///  * [encodeWidgetStatePropertyColor]
  ///  * [encodeWidgetStatePropertyDouble]
  ///  * [encodeWidgetStatePropertyEdgeInsetsGeometry]
  ///  * [encodeWidgetStatePropertyMouseCursor]
  ///  * [encodeWidgetStatePropertyOutlinedBorder]
  ///  * [encodeWidgetStatePropertySize]
  ///  * [encodeWidgetStatePropertyTextStyle]
  ///  * [encodeMaterialTapTargetSize]
  ///  * [encodeMouseCursor]
  ///  * [encodeOutlinedBorder]
  ///  * [encodeSize]
  ///  * [encodeTextStyle]
  ///  * [encodeVisualDensity]
  static Map<String, dynamic>? encodeButtonStyle(
    ButtonStyle? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'alignment': encodeAlignmentGeometry(value.alignment),
        'animationDuration': value.animationDuration?.inMilliseconds,
        'backgroundColor': encodeWidgetStatePropertyColor(
          value.backgroundColor,
        ),
        'elevation': encodeWidgetStatePropertyDouble(value.elevation),
        'enableFeedback': value.enableFeedback,
        'fixedSize': encodeWidgetStatePropertySize(value.fixedSize),
        'foregroundColor': encodeWidgetStatePropertyColor(
          value.foregroundColor,
        ),
        'iconColor': encodeWidgetStatePropertyColor(value.iconColor),
        'iconSize': encodeWidgetStatePropertyDouble(value.iconSize),
        'maximumSize': encodeWidgetStatePropertySize(value.maximumSize),
        'minimumSize': encodeWidgetStatePropertySize(value.minimumSize),
        'mouseCursor': encodeWidgetStatePropertyMouseCursor(
          value.mouseCursor,
        ),
        'overlayColor': encodeWidgetStatePropertyColor(value.overlayColor),
        'padding': encodeWidgetStatePropertyEdgeInsetsGeometry(value.padding),
        'shadowColor': encodeWidgetStatePropertyColor(value.shadowColor),
        'shape': encodeWidgetStatePropertyOutlinedBorder(value.shape),
        'side': encodeWidgetStatePropertyBorderSide(value.side),
        'splashFactory': encodeInteractiveInkFeatureFactory(
          value.splashFactory,
        ),
        'surfaceTintColor': encodeWidgetStatePropertyColor(
          value.surfaceTintColor,
        ),
        'tapTargetSize': encodeMaterialTapTargetSize(
          value.tapTargetSize,
        ),
        'textStyle': encodeWidgetStatePropertyTextStyle(value.textStyle),
        'visualDensity': encodeVisualDensity(
          value.visualDensity,
        ),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `accent`
  ///  * `normal`
  ///  * `primary`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeButtonTextTheme(ButtonTextTheme? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case ButtonTextTheme.accent:
          result = 'accent';
          break;
        case ButtonTextTheme.normal:
          result = 'normal';
          break;
        case ButtonTextTheme.primary:
          result = 'primary';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "alignedDropdown": "<bool>",
  ///   "buttonColor": "<Color>",
  ///   "colorScheme": "<ColorScheme>",
  ///   "disabledColor": "<Color>",
  ///   "focusColor": "<Color>",
  ///   "height": "<double>",
  ///   "highlightColor": "<Color>",
  ///   "hoverColor": "<Color>",
  ///   "layoutBehavior": "<ButtonBarLayoutBehavior>",
  ///   "materialTapTargetSize": "<MaterialTapTargetSize>",
  ///   "minWidth": "<double>",
  ///   "padding": "<EdgeInsetsGeometry>",
  ///   "shape": "<ShapeBorder>",
  ///   "splashColor": "<Color>",
  ///   "textTheme": "<ButtonTextTheme>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeButtonBarLayoutBehavior]
  ///  * [encodeButtonTextTheme]
  ///  * [encodeColor]
  ///  * [encodeColorScheme]
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeMaterialTapTargetSize]
  ///  * [encodeShapeBorder]
  static Map<String, dynamic>? encodeButtonThemeData(ButtonThemeData? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'alignedDropdown': value.alignedDropdown,
        'colorScheme': encodeColorScheme(value.colorScheme),
        'height': value.height,
        'layoutBehavior': encodeButtonBarLayoutBehavior(value.layoutBehavior),
        'minWidth': value.minWidth,
        'padding': encodeEdgeInsetsGeometry(value.padding as EdgeInsets?),
        'shape': encodeShapeBorder(value.shape),
        'textTheme': encodeButtonTextTheme(value.textTheme),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "clipBehavior": "<Clip>",
  ///   "color": "<Color>",
  ///   "elevation": "<double>",
  ///   "margin": "<EdgeInsetsGeometry>",
  ///   "shadowColor": "<Color>",
  ///   "shape": "<ShapeBorder>",
  ///   "surfaceTintColor": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeClip]
  ///  * [encodeColor]
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeShapeBorder]
  static Map<String, dynamic>? encodeCardTheme(CardTheme? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'clipBehavior': encodeClip(value.clipBehavior),
        'color': encodeColor(value.color),
        'elevation': value.elevation,
        'margin': encodeEdgeInsetsGeometry(value.margin as EdgeInsets?),
        'shadowColor': encodeColor(value.shadowColor),
        'shape': encodeShapeBorder(value.shape),
        'surfaceTintColor': encodeColor(value.surfaceTintColor),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [CheckboxThemeData] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "checkColor": "<Color>",
  ///   "fillColor": "<MaterialStateProperty<Color>>",
  ///   "materialTapTargetSize": "<MaterialTapTargetSize>",
  ///   "mouseCursor": "<MaterialStateProperty<MouseCursor>>",
  ///   "overlayColor": "<MaterialStateProperty<Color>>",
  ///   "shape": "<OutlinedBorder>",
  ///   "side": "<BorderSide>",
  ///   "splashRadius": "<double>",
  ///   "visualDensity": "<VisualDensity>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeMaterialTapTargetSize]
  ///  * [encodeMouseCursor]
  ///  * [encodeVisualDensity]
  static Map<String, dynamic>? encodeCheckboxThemeData(
    CheckboxThemeData? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'checkColor': encodeWidgetStatePropertyColor(
          value.checkColor,
        ),
        'fillColor': encodeWidgetStatePropertyColor(
          value.fillColor,
        ),
        'materialTapTargetSize': encodeMaterialTapTargetSize(
          value.materialTapTargetSize,
        ),
        'mouseCursor': encodeWidgetStatePropertyMouseCursor(
          value.mouseCursor,
        ),
        'overlayColor': encodeWidgetStatePropertyColor(
          value.overlayColor,
        ),
        'shape': encodeOutlinedBorder(value.shape),
        'side': encodeBorderSide(value.side),
        'splashRadius': value.splashRadius,
        'visualDensity': encodeVisualDensity(value.visualDensity),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "brightness": "<Brightness>",
  ///   "checkmarkColor": "<Color>",
  ///   "color": "<MaterialStateProperty<Color>>"
  ///   "deleteIconColor": "<Color>",
  ///   "disabledColor": "<Color>",
  ///   "elevation": "<double>",
  ///   "iconTheme": "<IconThemeData>",
  ///   "labelPadding": "<EdgeInsetsGeometry>",
  ///   "labelStyle": "<TextStyle>",
  ///   "padding": "<EdgeInsetsGeometry>",
  ///   "pressElevation": "<double>",
  ///   "secondaryLabelStyle": "<TextStyle>",
  ///   "secondarySelectedColor": "<Color>",
  ///   "selectedColor": "<Color>",
  ///   "shape": "<ShapeBorder>",
  ///   "side": "<BorderSide>",
  ///   "selectedShadowColor": "<Color>",
  ///   "shadowColor": "<Color>",
  ///   "showCheckmark": "<bool>",
  ///   "surfaceTintColor": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBorderSide]
  ///  * [encodeBrightness]
  ///  * [encodeColor]
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeIconThemeData]
  ///  * [encodeWidgetStateProperty<Color>]
  ///  * [encodeShapeBorder]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeChipThemeData(ChipThemeData? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'backgroundColor': encodeColor(value.backgroundColor),
        'brightness': encodeBrightness(value.brightness),
        'checkmarkColor': encodeColor(value.checkmarkColor),
        'color': encodeWidgetStatePropertyColor(value.color),
        'deleteIconColor': encodeColor(value.deleteIconColor),
        'disabledColor': encodeColor(value.disabledColor),
        'elevation': value.elevation,
        'iconTheme': encodeIconThemeData(value.iconTheme),
        'labelPadding': encodeEdgeInsetsGeometry(
          value.labelPadding as EdgeInsets?,
        ),
        'labelStyle': encodeTextStyle(value.labelStyle),
        'padding': encodeEdgeInsetsGeometry(value.padding as EdgeInsets?),
        'pressElevation': value.pressElevation,
        'secondaryLabelStyle': encodeTextStyle(value.secondaryLabelStyle),
        'secondarySelectedColor': encodeColor(value.secondarySelectedColor),
        'selectedColor': encodeColor(value.selectedColor),
        'shape': encodeShapeBorder(value.shape),
        'side': encodeBorderSide(value.side),
        'selectedShadowColor': encodeColor(value.selectedShadowColor),
        'shadowColor': encodeColor(value.shadowColor),
        'showCheckmark': value.showCheckmark,
        'surfaceTintColor': encodeColor(value.surfaceTintColor),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `antiAlias`
  ///  * `antiAliasWithSaveLayer`
  ///  * `hardEdge`
  ///  * `none`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeClip(Clip? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case Clip.antiAlias:
          result = 'antiAlias';
          break;
        case Clip.antiAliasWithSaveLayer:
          result = 'antiAliasWithSaveLayer';
          break;
        case Clip.hardEdge:
          result = 'hardEdge';
          break;
        case Clip.none:
          result = 'none';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  This will always
  /// use a hash encoded 8 digit string: "#aarrbbgg" format.
  ///
  /// This will return `null` if the value is `null`.
  static String? encodeColor(Color? value) {
    String? result;

    if (value != null) {
      final hex = value.value.toRadixString(16).padLeft(8, '0');
      result = '#$hex';
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "background": "<Color>",
  ///   "brightness": "<Brightness>",
  ///   "error": "<Color>",
  ///   "errorContainer": "<Color>",
  ///   "inversePrimary": "<Color>",
  ///   "inverseSurface": "<Color>",
  ///   "onBackground": "<Color>",
  ///   "onError": "<Color>",
  ///   "onErrorContainer": "<Color>",
  ///   "onInverseSurface": "<Color>",
  ///   "onPrimary": "<Color>",
  ///   "onPrimaryContainer": "<Color>",
  ///   "onSecondary": "<Color>",
  ///   "onSecondaryContainer": "<Color>",
  ///   "onSurface": "<Color>",
  ///   "onSurfaceVariant": "<Color>",
  ///   "onTertiary": "<Color>",
  ///   "onTertiaryContainer": "<Color>",
  ///   "outline": "<Color>",
  ///   "outlineVariant": "<Color>",
  ///   "primary": "<Color>",
  ///   "primaryContainer": "<Color>",
  ///   "scrim": "<Color>","
  ///   "secondary": "<Color>",
  ///   "secondaryContainer": "<Color>",
  ///   "shadow": "<Color>",
  ///   "surface": "<Color>",
  ///   "surfaceTint": "<Color>",
  ///   "surfaceContainerHighest": "<Color>",
  ///   "tertiary": "<Color>",
  ///   "tertiaryContainer": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBrightness]
  ///  * [encodeColor]
  static Map<String, dynamic>? encodeColorScheme(ColorScheme? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'background': encodeColor(value.surface),
        'brightness': encodeBrightness(value.brightness),
        'error': encodeColor(value.error),
        'errorContainer': encodeColor(value.errorContainer),
        'inversePrimary': encodeColor(value.inversePrimary),
        'inverseSurface': encodeColor(value.inverseSurface),
        'onBackground': encodeColor(value.onSurface),
        'onError': encodeColor(value.onError),
        'onErrorContainer': encodeColor(value.onErrorContainer),
        'onInverseSurface': encodeColor(value.onInverseSurface),
        'onPrimary': encodeColor(value.onPrimary),
        'onPrimaryContainer': encodeColor(value.onPrimaryContainer),
        'onSecondary': encodeColor(value.onSecondary),
        'onSecondaryContainer': encodeColor(value.onSecondaryContainer),
        'onSurface': encodeColor(value.onSurface),
        'onSurfaceVariant': encodeColor(value.onSurfaceVariant),
        'onTertiary': encodeColor(value.onTertiary),
        'onTertiaryContainer': encodeColor(value.onTertiaryContainer),
        'outline': encodeColor(value.outline),
        'outlineVariant': encodeColor(value.outlineVariant),
        'primary': encodeColor(value.primary),
        'primaryContainer': encodeColor(value.primaryContainer),
        'scrim': encodeColor(value.scrim),
        'secondary': encodeColor(value.secondary),
        'secondaryContainer': encodeColor(value.secondaryContainer),
        'shadow': encodeColor(value.shadow),
        'surface': encodeColor(value.surface),
        'surfaceContainerHighest': encodeColor(value.surfaceContainerHighest),
        'surfaceTint': encodeColor(value.surfaceTint),
        'tertiary': encodeColor(value.tertiary),
        'tertiaryContainer': encodeColor(value.tertiaryContainer),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `baseline`
  ///  * `center`
  ///  * `end`
  ///  * `start`
  ///  * `stretch`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeCrossAxisAlignment(CrossAxisAlignment? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case CrossAxisAlignment.baseline:
          result = 'baseline';
          break;
        case CrossAxisAlignment.center:
          result = 'center';
          break;
        case CrossAxisAlignment.end:
          result = 'end';
          break;
        case CrossAxisAlignment.start:
          result = 'start';
          break;
        case CrossAxisAlignment.stretch:
          result = 'stretch';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `showFirst`
  ///  * `showSecond`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeCrossFadeState(CrossFadeState? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case CrossFadeState.showFirst:
          result = 'showFirst';
          break;
        case CrossFadeState.showSecond:
          result = 'showSecond';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "actionTextStyle": "<TextStyle>",
  ///   "dateTimePickerTextStyle": "<TextStyle>",
  ///   "navActionTextStyle": "<TextStyle>",
  ///   "navLargeTitleTextStyle":<TextStyle>",
  ///   "navTitleTextStyle": "<TextStyle>",
  ///   "pickerTextStyle": "<TextStyle>",
  ///   "primaryColor": "<Color>"
  ///   "tabLabelTextStyle": "<TextStyle>",
  ///   "textStyle": "<TextStyle>",
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeCupertinoTextThemeData(
    CupertinoTextThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'actionTextStyle': encodeTextStyle(value.actionTextStyle),
        'dateTimePickerTextStyle': encodeTextStyle(
          value.dateTimePickerTextStyle,
        ),
        'navActionTextStyle': encodeTextStyle(value.navActionTextStyle),
        'navLargeTitleTextStyle': encodeTextStyle(value.navLargeTitleTextStyle),
        'navTitleTextStyle': encodeTextStyle(value.navTitleTextStyle),
        'pickerTextStyle': encodeTextStyle(value.pickerTextStyle),
        'tabLabelTextStyle': encodeTextStyle(value.tabLabelTextStyle),
        'textStyle': encodeTextStyle(value.textStyle),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "applyThemeToAll": "<bool>",
  ///   "barBackgroundColor": "<Color>",
  ///   "brightness": "<Brightness>",
  ///   "primaryColor": "<Color>",
  ///   "primaryContrastingColor": "<Color>",
  ///   "scaffoldBackgroundColor": "<Color>",
  ///   "textTheme": "<CupertinoTextThemeData>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBrightness]
  ///  * [encodeColor]
  ///  * [encodeCupertinoTextThemeData]
  static Map<String, dynamic>? encodeCupertinoThemeData(
    NoDefaultCupertinoThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'applyThemeToAll': value.applyThemeToAll,
        'barBackgroundColor': encodeColor(value.barBackgroundColor),
        'brightness': encodeBrightness(value.brightness),
        'primaryColor': encodeColor(value.primaryColor),
        'primaryContrastingColor': encodeColor(value.primaryContrastingColor),
        'scaffoldBackgroundColor': encodeColor(value.scaffoldBackgroundColor),
        'textTheme': encodeCupertinoTextThemeData(value.textTheme),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "cancelButtonStyle": "<ButtonStyle>",
  ///   "confirmButtonStyle": "<ButtonStyle>",
  ///   "dayBackgroundColor": "<MaterialStateProperty<Color>>",
  ///   "dayForegroundColor": "<MaterialStateProperty<Color>>",
  ///   "dayOverlayColor": "<MaterialStateProperty<Color>>",
  ///   "dayStyle: "<TextStyle>",
  ///   "dividerColor": "<Color>",
  ///   "elevation": "<double>",
  ///   "headerBackgroundColor": "<Color>",
  ///   "headerForegroundColor": "<Color>",
  ///   "headerHeadlineStyle": "<TextStyle>",
  ///   "headerHelpStyle": "<TextStyle>",
  ///   "inputDecorationTheme": "<InputDecorationTheme>",
  ///   "rangePickerBackgroundColor": "<Color>",
  ///   "rangePickerElevation": "<double>",
  ///   "rangePickerHeaderBackgroundColor": "<Color>",
  ///   "rangePickerHeaderForegroundColor": "<Color>",
  ///   "rangePickerHeaderHeadlineStyle": "<TextStyle>",
  ///   "rangePickerHeaderHelpStyle": "<TextStyle>",
  ///   "rangePickerShadowColor": "<Color>",
  ///   "rangePickerShape": "<ShapeBorder>",
  ///   "rangePickerSurfaceTintColor": "<Color>",
  ///   "rangeSelectionBackgroundColor": "<Color>",
  ///   "rangeSelectionOverlayColor": "<MaterialStateProperty<Color>>",
  ///   "shadowColor": "<Color>",
  ///   "shape": "<ShapeBorder>",
  ///   "surfaceTintColor": "<Color>",
  ///   "todayBackgroundColor": "<MaterialStateProperty<Color>>",
  ///   "todayBorder": "<ShapeBorder>",
  ///   "todayForegroundColor": "<MaterialStateProperty<Color>>",
  ///   "weekdayStyle": "<TextStyle>",
  ///   "yearBackgroundColor": "<MaterialStateProperty<Color>>",
  ///   "yearForegroundColor": "<MaterialStateProperty<Color>>",
  ///   "yearOverlayColor": "<MaterialStateProperty<Color>>",
  ///   "yearStyle": "<TextStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBorderSide]
  ///  * [encodeColor]
  ///  * [encodeInputDecorationTheme]
  ///  * [encodeWidgetStatePropertyColor]
  ///  * [encodeShapeBorder]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeDatePickerThemeData(
    DatePickerThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'backgroundColor': encodeColor(value.backgroundColor),
        'cancelButtonStyle': encodeButtonStyle(value.cancelButtonStyle),
        'dayBackgroundColor': encodeWidgetStatePropertyColor(
          value.dayBackgroundColor,
        ),
        'dayForegroundColor': encodeWidgetStatePropertyColor(
          value.dayForegroundColor,
        ),
        'dayOverlayColor': encodeWidgetStatePropertyColor(
          value.dayOverlayColor,
        ),
        'dayStyle': encodeTextStyle(value.dayStyle),
        'dividerColor': encodeColor(value.dividerColor),
        'elevation': value.elevation,
        'headerBackgroundColor': encodeColor(value.headerBackgroundColor),
        'headerForegroundColor': encodeColor(value.headerForegroundColor),
        'headerHeadlineStyle': encodeTextStyle(value.headerHeadlineStyle),
        'headerHelpStyle': encodeTextStyle(value.headerHelpStyle),
        'inputDecorationTheme': encodeInputDecorationTheme(
          value.inputDecorationTheme,
        ),
        'rangePickerBackgroundColor': encodeColor(
          value.rangePickerBackgroundColor,
        ),
        'rangePickerElevation': value.rangePickerElevation,
        'rangePickerHeaderBackgroundColor': encodeColor(
          value.rangePickerHeaderBackgroundColor,
        ),
        'rangePickerHeaderForegroundColor': encodeColor(
          value.rangePickerHeaderForegroundColor,
        ),
        'rangePickerHeaderHeadlineStyle': encodeTextStyle(
          value.rangePickerHeaderHeadlineStyle,
        ),
        'rangePickerHeaderHelpStyle': encodeTextStyle(
          value.rangePickerHeaderHelpStyle,
        ),
        'rangePickerShadowColor': encodeColor(value.rangePickerShadowColor),
        'rangePickerShape': encodeShapeBorder(value.rangePickerShape),
        'rangePickerSurfaceTintColor': encodeColor(
          value.rangePickerSurfaceTintColor,
        ),
        'rangeSelectionBackgroundColor': encodeColor(
          value.rangeSelectionBackgroundColor,
        ),
        'rangeSelectionOverlayColor': encodeWidgetStatePropertyColor(
          value.rangeSelectionOverlayColor,
        ),
        'shadowColor': encodeColor(value.shadowColor),
        'shape': encodeShapeBorder(value.shape),
        'surfaceTintColor': encodeColor(value.surfaceTintColor),
        'todayBackgroundColor': encodeWidgetStatePropertyColor(
          value.todayBackgroundColor,
        ),
        'todayBorder': encodeBorderSide(value.todayBorder),
        'todayForegroundColor': encodeWidgetStatePropertyColor(
          value.todayForegroundColor,
        ),
        'weekdayStyle': encodeTextStyle(value.weekdayStyle),
        'yearBackgroundColor': encodeWidgetStatePropertyColor(
          value.yearBackgroundColor,
        ),
        'yearForegroundColor': encodeWidgetStatePropertyColor(
          value.yearForegroundColor,
        ),
        'yearOverlayColor': encodeWidgetStatePropertyColor(
          value.yearOverlayColor,
        ),
        'yearStyle': encodeTextStyle(value.yearStyle),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "checkboxHorizontalMargin": "<double>",
  ///   "columnSpacing": "<double>",
  ///   "dataRowColor": "<MaterialStateProperty<Color>>",
  ///   "dataRowCursor": "<MaterialStateProperty<MouseCursor>",
  ///   "dataRowMaxHeight": "<double>",
  ///   "dataRowMinHeight": "<double>",
  ///   "dataTextStyle": "<TextStyle,
  ///   "decoration": "<BoxDecoration>",
  ///   "dividerThickness": "<double>",
  ///   "headingCellCursor": "<MaterialStateProperty<MouseCursor>",
  ///   "headingRowColor": "<MaterialStateProperty<Color>>",
  ///   "headingRowHeight": "<double>",
  ///   "headingTextStyle": "<TextStyle>",
  ///   "horizontalMargin": "<double>"
  /// }
  /// ```
  ///
  /// This won't maintain the [WidgetStateProperty] of each corresponding
  /// property, instead will resolve them by using an empty set of states,
  /// returning and encoding the resolved object.
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeDataTableThemeData(
    DataTableThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'checkboxHorizontalMargin': value.checkboxHorizontalMargin,
        'columnSpacing': value.columnSpacing,
        'dataRowColor': encodeWidgetStatePropertyColor(
          value.dataRowColor,
        ),
        'dataRowCursor': encodeWidgetStatePropertyMouseCursor(
          value.dataRowCursor,
        ),
        'dataRowMaxHeight': value.dataRowMaxHeight,
        'dataRowMinHeight': value.dataRowMinHeight,
        'dataTextStyle': encodeTextStyle(
          value.dataTextStyle,
        ),
        'decoration': encodeBoxDecoration(
          value.decoration is! BoxDecoration
              ? null
              : value.decoration as BoxDecoration,
        ),
        'dividerThickness': value.dividerThickness,
        'headingCellCursor': encodeWidgetStatePropertyMouseCursor(
          value.headingCellCursor,
        ),
        'headingRowColor': encodeWidgetStatePropertyColor(
          value.headingRowColor,
        ),
        'headingRowHeight': value.headingRowHeight,
        'headingTextStyle': encodeTextStyle(
          value.headingTextStyle,
        ),
        'horizontalMargin': value.horizontalMargin,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "alignment": "<Alignment>",
  ///   "centerSlice": "<Rect>",
  ///   "filterQuality": "<FilterQuality>",
  ///   "fit": "<BoxFit>",
  ///   "image": "<ImageProvider>",
  ///   "invertColors": "<bool>",
  ///   "isAntiAlias": "<bool>",
  ///   "matchTextDirection": "<bool>",
  ///   "opacity": "<double>",
  ///   "repeat": "<ImageRepeat>",
  ///   "scale": "<double>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeAlignment]
  ///  * [encodeBoxFit]
  ///  * [encodeFilterQuality]
  ///  * [encodeImageProvider]
  ///  * [encodeImageRepeat]
  ///  * [encodeRect]
  static Map<String, dynamic>? encodeDecorationImage(DecorationImage? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'alignment': encodeAlignmentGeometry(value.alignment),
        'centerSlice': encodeRect(value.centerSlice),
        'filterQuality': encodeFilterQuality(value.filterQuality),
        'fit': encodeBoxFit(value.fit),
        'image': encodeImageProvider(value.image),
        'invertColors': value.invertColors,
        'isAntiAlias': value.isAntiAlias,
        'matchTextDirection': value.matchTextDirection,
        'opacity': value.opacity,
        'repeat': encodeImageRepeat(value.repeat),
        'scale': value.scale,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `background`
  ///  * `foreground`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeDecorationPosition(DecorationPosition? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case DecorationPosition.background:
          result = 'background';
          break;
        case DecorationPosition.foreground:
          result = 'foreground';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "actionsPadding": "<EdgeInsetsGeometry>",
  ///   "alignment": "<Alignment>",
  ///   "backgroundColor": "<Color>",
  ///   "contentTextStyle": "<TextStyle>",
  ///   "elevation": "<double>",
  ///   "iconColor": "<Color>",
  ///   "shadowColor": "<Color>",
  ///   "shape": "<ShapeBorder>",
  ///   "surfaceColor": "<Color>",
  ///   "titleTextStyle": "<TextStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeAlignment]
  ///  * [encodeBrightness]
  ///  * [encodeColor]
  ///  * [encodeShapeBorder]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeDialogTheme(DialogTheme? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'actionsPadding': encodeEdgeInsetsGeometry(
          value.actionsPadding as EdgeInsets?,
        ),
        'alignment': encodeAlignmentGeometry(value.alignment),
        'backgroundColor': encodeColor(value.backgroundColor),
        'contentTextStyle': encodeTextStyle(value.contentTextStyle),
        'elevation': value.elevation,
        'shadowColor': encodeColor(value.shadowColor),
        'shape': encodeShapeBorder(value.shape),
        'surfaceTintColor': encodeColor(value.shadowColor),
        'titleTextStyle': encodeTextStyle(value.titleTextStyle),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "color": "<Color>",
  ///   "endIndent": "<double>",
  ///   "indent": "<double>",
  ///   "space": "<double>",
  ///   "thickness": "<double>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  static Map<String, dynamic>? encodeDividerThemeData(DividerThemeData? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'color': encodeColor(value.color),
        'endIndent': value.endIndent,
        'indent': value.indent,
        'space': value.space,
        'thickness': value.thickness,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `down`
  ///  * `start`
  static String? encodeDragStartBehavior(DragStartBehavior? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case DragStartBehavior.down:
          result = 'down';
          break;

        case DragStartBehavior.start:
          result = 'start';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON compatible [Map].  The returned result
  /// will always have the following format:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "elevation": "<double>",
  ///   "endShape": "<ShapeBorder>",
  ///   "scrimColor": "<Color>",
  ///   "shadowColor": "<Color>",
  ///   "shape": "<ShapeBorder>",
  ///   "surfaceTintColor": "<Color>",
  ///   "width": "<double>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeShapeBorder]
  static Map<String, dynamic>? encodeDrawerThemeData(
    DrawerThemeData? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'backgroundColor': encodeColor(value.backgroundColor),
        'elevation': value.elevation,
        'endShape': encodeShapeBorder(value.endShape),
        'scrimColor': encodeColor(value.scrimColor),
        'shadowColor': encodeColor(value.shadowColor),
        'shape': encodeShapeBorder(value.shape),
        'surfaceTintColor': encodeColor(value.surfaceTintColor),
        'width': value.width,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON compatible [Map].  The returned result
  /// will always have the following format:
  ///
  /// ```json
  /// {
  ///   "inputDecorationTheme": "<InputDecorationTheme>",
  ///   "menuStyle": "<MenuStyle>",
  ///   "textStyle": "<TextStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeInputDecorationTheme]
  ///  * [encodeMenuStyle]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeDropdownMenuThemeData(
    DropdownMenuThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'inputDecorationTheme': encodeInputDecorationTheme(
          value.inputDecorationTheme,
        ),
        'menuStyle': encodeMenuStyle(value.menuStyle),
        'textStyle': encodeTextStyle(value.textStyle),
      };
    }

    return _stripDynamicNull(result);
  }

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
  static Map<String, dynamic>? encodeEdgeInsets(EdgeInsets? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'bottom': value.bottom,
        'left': value.left,
        'right': value.right,
        'top': value.top,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON compatible [Map].  The returned result
  /// will always have one of the following formats:
  ///
  /// ```json
  /// {
  ///   "bottom": "<double>",
  ///   "end": "<double>",
  ///   "start": "<double>",
  ///   "top": "<double>"
  /// }
  /// ```
  static Map<String, dynamic>? encodeEdgeInsetsDirectional(
    EdgeInsetsDirectional? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'bottom': value.bottom,
        'end': value.end,
        'start': value.start,
        'top': value.top,
      };
    }

    return _stripDynamicNull(result);
  }

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
  ///
  /// See also:
  ///  * [encodeEdgeInsets]
  ///  * [encodeEdgeInsetsDirectional]
  static Map<String, dynamic>? encodeEdgeInsetsGeometry(
    EdgeInsetsGeometry? value,
  ) {
    Map<String, dynamic>? result;

    if (value is EdgeInsets) {
      result = encodeEdgeInsets(value);
    } else if (value is EdgeInsetsDirectional) {
      result = encodeEdgeInsetsDirectional(value);
    } else if (value != null) {
      throw Exception(
        'Unknown type of EdgeInsets detected: [${value.runtimeType}]',
      );
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "style": "<ButtonStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeButtonStyle]
  static Map<String, dynamic>? encodeElevatedButtonThemeData(
    ElevatedButtonThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'style': encodeButtonStyle(value.style),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "childrenPadding": "<EdgeInsetsGeometry>",
  ///   "collapsedBackgroundColor": "<Color>",
  ///   "collapsedIconColor": "<Color>",
  ///   "collapsedShape": "<ShapeBorder>",
  ///   "collapsedTextColor": "<Color>",
  ///   "expandedAlignment": "<AlignmentGeometry>",
  ///   "iconColor": "<Color>",
  ///   "shape": "<ShapeBorder>",
  ///   "textColor": "<Color>",
  ///   "tilePadding": "<EdgeInsetsGeometry>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeAlignment]
  ///  * [encodeColor]
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeShapeBorder]
  static Map<String, dynamic>? encodeExpansionTileThemeData(
    ExpansionTileThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'backgroundColor': encodeColor(value.backgroundColor),
        'childrenPadding': encodeEdgeInsetsGeometry(
          value.childrenPadding as EdgeInsets?,
        ),
        'collapsedBackgroundColor': encodeColor(value.collapsedBackgroundColor),
        'collapsedIconColor': encodeColor(value.collapsedIconColor),
        'collapsedShape': encodeShapeBorder(value.collapsedShape),
        'collapsedTextColor': encodeColor(value.collapsedTextColor),
        'expandedAlignment': encodeAlignmentGeometry(value.expandedAlignment),
        'iconColor': encodeColor(value.iconColor),
        'shape': encodeShapeBorder(value.shape),
        'textColor': encodeColor(value.textColor),
        'tilePadding': encodeEdgeInsetsGeometry(
          value.tilePadding as EdgeInsets?,
        ),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to it's JSON form.
  ///
  /// ```json
  /// {
  ///   "style": "<ButtonStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeButtonStyle]
  static Map<String, dynamic>? encodeFilledButtonThemeData(
    FilledButtonThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'style': encodeButtonStyle(value.style),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `high`
  ///  * `low`
  ///  * `medium`
  ///  * `none`
  static String? encodeFilterQuality(FilterQuality? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case FilterQuality.high:
          result = 'high';
          break;

        case FilterQuality.low:
          result = 'low';
          break;

        case FilterQuality.medium:
          result = 'medium';
          break;

        case FilterQuality.none:
          result = 'none';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `loose`
  ///  * `tight`
  static String? encodeFlexFit(FlexFit? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case FlexFit.loose:
          result = 'loose';
          break;

        case FlexFit.tight:
          result = 'tight';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `scaling`
  static String? encodeFloatingActionButtonAnimator(
    FloatingActionButtonAnimator? value,
  ) {
    assert(value == null || value == FloatingActionButtonAnimator.scaling);
    String? result;

    if (value != null) {
      if (value == FloatingActionButtonAnimator.scaling) {
        result = 'scaling';
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] to a String.  Supported values
  /// are:
  ///  * `centerDocked`
  ///  * `centerFloat`
  ///  * `centerTop`
  ///  * `endDocked`
  ///  * `endFloat`
  ///  * `endTop`
  ///  * `miniCenterDocked`
  ///  * `miniCenterFloat`
  ///  * `miniCenterTop`
  ///  * `miniEndDocked`
  ///  * `miniEndFloat`
  ///  * `miniEndTop`
  ///  * `miniStartDocked`
  ///  * `miniStartFloat`
  ///  * `miniStartTop`
  ///  * `startDocked`
  ///  * `startFloat`
  ///  * `startTop`
  static String? encodeFloatingActionButtonLocation(
    FloatingActionButtonLocation? value,
  ) {
    String? result;

    if (value != null) {
      if (value == FloatingActionButtonLocation.centerDocked) {
        result = 'centerDocked';
      } else if (value == FloatingActionButtonLocation.centerFloat) {
        result = 'centerFloat';
      } else if (value == FloatingActionButtonLocation.centerTop) {
        result = 'centerTop';
      } else if (value == FloatingActionButtonLocation.endDocked) {
        result = 'endDocked';
      } else if (value == FloatingActionButtonLocation.endFloat) {
        result = 'endFloat';
      } else if (value == FloatingActionButtonLocation.endTop) {
        result = 'endTop';
      } else if (value == FloatingActionButtonLocation.miniCenterDocked) {
        result = 'miniCenterDocked';
      } else if (value == FloatingActionButtonLocation.miniCenterFloat) {
        result = 'miniCenterFloat';
      } else if (value == FloatingActionButtonLocation.miniCenterTop) {
        result = 'miniCenterTop';
      } else if (value == FloatingActionButtonLocation.miniEndDocked) {
        result = 'miniEndDocked';
      } else if (value == FloatingActionButtonLocation.miniEndFloat) {
        result = 'miniEndFloat';
      } else if (value == FloatingActionButtonLocation.miniEndTop) {
        result = 'miniEndTop';
      } else if (value == FloatingActionButtonLocation.miniStartDocked) {
        result = 'miniStartDocked';
      } else if (value == FloatingActionButtonLocation.miniStartFloat) {
        result = 'miniStartFloat';
      } else if (value == FloatingActionButtonLocation.miniStartTop) {
        result = 'miniStartTop';
      } else if (value == FloatingActionButtonLocation.startDocked) {
        result = 'startDocked';
      } else if (value == FloatingActionButtonLocation.startFloat) {
        result = 'startFloat';
      } else if (value == FloatingActionButtonLocation.startTop) {
        result = 'startTop';
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "disabledElevation": "<double>",
  ///   "elevation": "<double>",
  ///   "extendedIconLabelSpacing": "<double>",
  ///   "extendedPadding": "<EdgeInsetsGeometry>",
  ///   "extendedSizeConstraints": "<BoxConstraints>",
  ///   "extendedTextStyle": "<TextStyle>"
  ///   "focusColor": "<Color>",
  ///   "focusElevation": "<double>",
  ///   "foregroundColor": "<Color>",
  ///   "highlightElevation": "<double>",
  ///   "hoverColor": "<Color>",
  ///   "hoverElevation": "<double>",
  ///   "iconSize": "<double>",
  ///   "largeSizeConstraints": "<BoxConstraints>",
  ///   "mouseCursor": "<MaterialStateProperty<MouseCursor>>",
  ///   "shape": "<ShapeBorder>",
  ///   "sizeConstraints": "<BoxConstraints>",
  ///   "smallSizeConstraints": "<BoxConstraints>",
  ///   "splashColor": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBoxConstraints]
  ///  * [encodeColor]
  ///  * [encodeWidgetStatePropertyMouseCursor]
  ///  * [encodeShapeBorder]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeFloatingActionButtonThemeData(
    FloatingActionButtonThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'backgroundColor': encodeColor(value.backgroundColor),
        'disabledElevation': value.disabledElevation,
        'elevation': value.elevation,
        'enableFeedback': value.enableFeedback,
        'extendedIconLabelSpacing': value.extendedIconLabelSpacing,
        'extendedPadding': encodeEdgeInsetsGeometry(
          value.extendedPadding as EdgeInsets?,
        ),
        'extendedSizeConstraints': encodeBoxConstraints(
          value.extendedSizeConstraints,
        ),
        'extendedTextStyle': encodeTextStyle(value.extendedTextStyle),
        'focusColor': encodeColor(value.focusColor),
        'focusElevation': value.focusElevation,
        'foregroundColor': encodeColor(value.foregroundColor),
        'highlightElevation': value.highlightElevation,
        'hoverColor': encodeColor(value.hoverColor),
        'hoverElevation': value.hoverElevation,
        'iconSize': value.iconSize,
        'largeSizeConstraints': encodeBoxConstraints(
          value.largeSizeConstraints,
        ),
        'mouseCursor': encodeWidgetStatePropertyMouseCursor(
          value.mouseCursor,
        ),
        'shape': encodeShapeBorder(value.shape),
        'sizeConstraints': encodeBoxConstraints(value.sizeConstraints),
        'smallSizeConstraints': encodeBoxConstraints(
          value.smallSizeConstraints,
        ),
        'splashColor': encodeColor(value.splashColor),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `center`
  ///  * `start`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeFloatingLabelAlignment(FloatingLabelAlignment? value) {
    String? result;

    if (value != null) {
      if (value == FloatingLabelAlignment.center) {
        result = 'center';
      } else if (value == FloatingLabelAlignment.start) {
        result = 'start';
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `always`
  ///  * `auto`
  ///  * `never`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeFloatingLabelBehavior(FloatingLabelBehavior? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case FloatingLabelBehavior.always:
          result = 'always';
          break;

        case FloatingLabelBehavior.auto:
          result = 'auto';
          break;

        case FloatingLabelBehavior.never:
          result = 'never';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "feature": "<String>",
  ///   "value": "<int>"
  /// }
  /// ```
  static Map<String, dynamic>? encodeFontFeature(FontFeature? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'feature': value.feature,
        'value': value.value,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `italic`
  ///  * `normal`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeFontStyle(FontStyle? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case FontStyle.italic:
          result = 'italic';
          break;

        case FontStyle.normal:
          result = 'normal';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `w100`
  ///  * `w200`
  ///  * `w300`
  ///  * `w400`
  ///  * `w500`
  ///  * `w600`
  ///  * `w700`
  ///  * `w800`
  ///  * `w900`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeFontWeight(FontWeight? value) {
    String? result;

    if (value != null) {
      switch (value) {
        // case FontWeight.bold:
        //   result = 'bold';
        //   break;

        // case FontWeight.normal:
        //   result = 'normal';
        //   break;

        case FontWeight.w100:
          result = 'w100';
          break;

        case FontWeight.w200:
          result = 'w200';
          break;

        case FontWeight.w300:
          result = 'w300';
          break;

        case FontWeight.w400:
          result = 'w400';
          break;

        case FontWeight.w500:
          result = 'w500';
          break;

        case FontWeight.w600:
          result = 'w600';
          break;

        case FontWeight.w700:
          result = 'w700';
          break;

        case FontWeight.w800:
          result = 'w800';
          break;

        case FontWeight.w900:
          result = 'w900';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] into a JSON map value.
  ///
  /// This returns the format:
  /// ```json
  /// {
  ///   "axis": "<String>",
  ///   "value": "<double>"
  /// }
  /// ```
  static Map<String, dynamic>? encodeFontVariation(FontVariation? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'axis': value.axis,
        'value': value.value,
      };
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
  ///
  /// See also:
  ///  * [encodeAlignment]
  ///  * [encodeGradientTransform]
  ///  * [encodeTileMode]
  static Map<String, dynamic>? encodeGradient(Gradient? value) {
    assert(value == null ||
        value is LinearGradient ||
        value is RadialGradient ||
        value is SweepGradient);
    Map<String, dynamic>? result;

    if (value != null) {
      if (value is LinearGradient) {
        result = {
          'begin': encodeAlignmentGeometry(value.begin),
          'colors': _encodeList<String?>(
            value.colors,
            (value) => encodeColor(value),
          ),
          'end': encodeAlignmentGeometry(value.end),
          'stops': value.stops,
          'tileMode': encodeTileMode(value.tileMode),
          'transform': encodeGradientTransform(value.transform),
          'type': 'linear',
        };
      } else if (value is RadialGradient) {
        result = {
          'center': encodeAlignmentGeometry(value.center),
          'colors': _encodeList<String?>(
            value.colors,
            (value) => encodeColor(value),
          ),
          'focal': encodeAlignmentGeometry(value.focal),
          'focalRadius': value.focalRadius,
          'radius': value.radius,
          'stops': value.stops,
          'tileMode': encodeTileMode(value.tileMode),
          'transform': encodeGradientTransform(value.transform),
          'type': 'radial',
        };
      } else if (value is SweepGradient) {
        result = {
          'center': encodeAlignmentGeometry(value.center),
          'colors': _encodeList<String?>(
            value.colors,
            (value) => encodeColor(value),
          ),
          'endAngle': value.endAngle,
          'startAngle': value.startAngle,
          'stops': value.stops,
          'tileMode': encodeTileMode(value.tileMode),
          'transform': encodeGradientTransform(value.transform),
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
  static Map<String, dynamic>? encodeGradientTransform(
      GradientTransform? value) {
    assert(value == null || value is GradientRotation);
    Map<String, dynamic>? result;

    if (value != null && value is GradientRotation) {
      result = {
        'radians': value.radians,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `deferToChild`
  ///  * `opaque`
  ///  * `translucent`
  static String? encodeHitTestBehavior(HitTestBehavior? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case HitTestBehavior.deferToChild:
          result = 'deferToChild';
          break;

        case HitTestBehavior.opaque:
          result = 'opaque';
          break;

        case HitTestBehavior.translucent:
          result = 'translucent';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the JSON representation.
  ///
  /// ```json
  /// {
  ///   "color": "<Color>",
  ///   "fill": "<double>",
  ///   "grade": "<double>",
  ///   "icon": "<IconData>",
  ///   "opticalSize": "<double>",
  ///   "semanticLabel": "<String>",
  ///   "shadows": "<List<Shadow>>",
  ///   "size": "<double>",
  ///   "textDirection": "<TextDirection>",
  ///   "weight": "<double>"
  /// }
  /// ```
  static Map<String, dynamic>? encodeIcon(Icon? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'color': encodeColor(value.color),
        'fill': value.fill,
        'grade': value.grade,
        'icon': encodeIconData(value.icon),
        'opticalSize': value.opticalSize,
        'semanticLabel': value.semanticLabel,
        'shadows': value.shadows?.map((e) => encodeShadow(e)).toList(),
        'size': value.size,
        'textDirection': encodeTextDirection(value.textDirection),
        'weight': value.weight,
      };
    }

    return _stripDynamicNull(result);
  }

  /// encodes the given [value] to an JSON map
  ///
  /// ```json
  /// {
  ///   "style": "<ButtonStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeButtonStyle]
  static Map<String, dynamic>? encodeIconButtonThemeData(
    IconButtonThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'style': encodeButtonStyle(value.style),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the JSON representation.
  ///
  /// ```json
  /// {
  ///   "codePoint": "<int>",
  ///   "fontFamily": "<String>",
  ///   "fontPackage": "<String>",
  ///   "matchTextDirection": "<bool>"
  /// }
  /// ```
  static Map<String, dynamic>? encodeIconData(IconData? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'codePoint': value.codePoint,
        'fontFamily': value.fontFamily,
        'fontPackage': value.fontPackage,
        'matchTextDirection': value.matchTextDirection,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "color": "<Color>",
  ///   "fill": "<Color>",
  ///   "grade": "<double>",
  ///   "opacity": "<double>",
  ///   "opticalSize": "<double>",
  ///   "shadows": "<List<Shadow>>",
  ///   "size": "<double>",
  ///   "weight": "<double>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  static Map<String, dynamic>? encodeIconThemeData(IconThemeData? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'color': encodeColor(value.color),
        'fill': value.fill,
        'grade': value.grade,
        'opacity': value.opacity,
        'opticalSize': value.opticalSize,
        'shadows': value.shadows?.map((e) => encodeShadow(e)),
        'size': value.size,
        'weight': value.weight,
      };
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
  static Map<String, dynamic>? encodeImageProvider(
    ImageProvider? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      assert(
          value is AssetImage || value is MemoryImage || value is NetworkImage);
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

  /// Encodes the given [value] into a String representation.  Supported values
  /// are:
  /// * `noRepeat`
  /// * `repeat`
  /// * `repeatX`
  /// * `repeatY`
  static String? encodeImageRepeat(ImageRepeat? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case ImageRepeat.noRepeat:
          result = 'noRepeat';
          break;
        case ImageRepeat.repeat:
          result = 'repeat';
          break;
        case ImageRepeat.repeatX:
          result = 'repeatX';
          break;
        case ImageRepeat.repeatY:
          result = 'repeatY';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  ///
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
  ///
  /// See also:
  ///  * [encodeBorderRadius]
  ///  * [encodeBorderSide]
  static Map<String, dynamic>? encodeInputBorder(InputBorder? value) {
    assert(value == null ||
        value is OutlineInputBorder ||
        value is UnderlineInputBorder);
    Map<String, dynamic>? result;

    if (value != null) {
      if (value is OutlineInputBorder) {
        result = {
          'borderRadius': encodeBorderRadius(value.borderRadius),
          'borderSide': encodeBorderSide(value.borderSide),
          'gapPadding': value.gapPadding,
          'type': 'outline',
        };
      } else if (value is UnderlineInputBorder) {
        result = {
          'borderRadius': encodeBorderRadius(value.borderRadius),
          'borderSide': encodeBorderSide(value.borderSide),
          'type': 'underline',
        };
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "activeIndicatorBorder": "<BorderSide>",
  ///   "alignLabelWithHint": "<bool>",
  ///   "border": "<InputBorder>",
  ///   "constraints": "<BoxConstraints>",
  ///   "contentPadding": "<EdgeInsetsGeometry>",
  ///   "counterStyle": "<TextStyle>",
  ///   "disabledBorder": "<InputBorder>",
  ///   "enabledBorder": "<InputBorder>",
  ///   "errorBorder": "<InputBorder>",
  ///   "errorMaxLines": "<int>",
  ///   "errorStyle": "<TextStyle>",
  ///   "fillColor": "<Color>",
  ///   "filled": "<bool>",
  ///   "floatingLabelAlignment": "<FloatingLabelAlignment>",
  ///   "floatingLabelBehavior": "<FloatingLabelBehavior>",
  ///   "floatingLabelStyle": "<TextStyle>",
  ///   "focusColor": "<Color>",
  ///   "focusedBorder": "<InputBorder>",
  ///   "focusedErrorBorder": "<InputBorder>",
  ///   "helperMaxLines": "<int>",
  ///   "helperStyle": "<TextStyle>",
  ///   "hintFadeDuration": "<Duration>",
  ///   "hintStyle": "<TextStyle>",
  ///   "hoverColor": "<Color>",
  ///   "iconColor": "<Color>",
  ///   "isCollapsed": "<bool>",
  ///   "isDense": "<bool>",
  ///   "labelStyle": "<TextStyle>",
  ///   "outlineBorder": "<BorderSide>",
  ///   "prefixIconColor": "<Color>",
  ///   "prefixStyle": "<TextStyle>",
  ///   "suffixStyle": "<Color>",
  ///   "suffixStyle": "<TextStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBorderSide]
  ///  * [encodeColor]
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeInputBorder]
  ///  * [encodeFloatingLabelBehavior]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeInputDecorationTheme(
    InputDecorationTheme? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'activeIndicatorBorder': encodeBorderSide(value.activeIndicatorBorder),
        'alignLabelWithHint': value.alignLabelWithHint,
        'border': encodeInputBorder(value.border),
        'constraints': encodeBoxConstraints(value.constraints),
        'contentPadding':
            encodeEdgeInsetsGeometry(value.contentPadding as EdgeInsets?),
        'counterStyle': encodeTextStyle(value.counterStyle),
        'disabledBorder': encodeInputBorder(value.disabledBorder),
        'enabledBorder': encodeInputBorder(value.enabledBorder),
        'errorBorder': encodeInputBorder(value.errorBorder),
        'errorMaxLines': value.errorMaxLines,
        'errorStyle': encodeTextStyle(value.errorStyle),
        'fillColor': encodeColor(value.fillColor),
        'filled': value.filled,
        'floatingLabelAlignment': encodeFloatingLabelAlignment(
          value.floatingLabelAlignment,
        ),
        'floatingLabelBehavior': encodeFloatingLabelBehavior(
          value.floatingLabelBehavior,
        ),
        'floatingLabelStyle': encodeTextStyle(value.floatingLabelStyle),
        'focusColor': encodeColor(value.focusColor),
        'focusedBorder': encodeInputBorder(value.focusedBorder),
        'focusedErrorBorder': encodeInputBorder(value.focusedErrorBorder),
        'helperMaxLines': value.helperMaxLines,
        'helperStyle': encodeTextStyle(value.helperStyle),
        'hintFadeDuration': value.hintFadeDuration?.inMilliseconds,
        'hintStyle': encodeTextStyle(value.hintStyle),
        'hoverColor': encodeColor(value.hoverColor),
        'iconColor': encodeColor(value.iconColor),
        'isCollapsed': value.isCollapsed,
        'isDense': value.isDense,
        'labelStyle': encodeTextStyle(value.labelStyle),
        'outlineBorder': encodeBorderSide(value.outlineBorder),
        'prefixIconColor': encodeColor(value.prefixIconColor),
        'prefixStyle': encodeTextStyle(value.prefixStyle),
        'suffixIconColor': encodeColor(value.suffixIconColor),
        'suffixStyle': encodeTextStyle(value.suffixStyle),
      };
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
  static String? encodeInteractiveInkFeatureFactory(
    InteractiveInkFeatureFactory? value,
  ) {
    final splashType = InkSplash.splashFactory.runtimeType;
    final rippleType = InkRipple.splashFactory.runtimeType;
    final sparkleType = InkSparkle.splashFactory.runtimeType;

    assert(value == null ||
        value.runtimeType == splashType ||
        value.runtimeType == rippleType ||
        value.runtimeType == sparkleType);
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

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `drawer`
  ///  * `list`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeListTileStyle(ListTileStyle? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case ListTileStyle.drawer:
          result = 'drawer';
          break;
        case ListTileStyle.list:
          result = 'list';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `bottom`
  ///  * `center`
  ///  * `threeLine`
  ///  * `titleHeight`
  ///  * `top`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeListTileTitleAlignment(ListTileTitleAlignment? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case ListTileTitleAlignment.bottom:
          result = 'bottom';
          break;
        case ListTileTitleAlignment.center:
          result = 'center';
          break;
        case ListTileTitleAlignment.threeLine:
          result = 'threeLine';
          break;
        case ListTileTitleAlignment.titleHeight:
          result = 'titleHeight';
          break;
        case ListTileTitleAlignment.top:
          result = 'top';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a  JSON representation.
  ///
  /// ```json
  /// {
  ///   "contentPadding": "<EdgeInsetsGeometry>",
  ///   "dense": "<bool>",
  ///   "enableFeedback": "<bool>",
  ///   "horizontalTitleGap": "<double>",
  ///   "iconColor": "<Color>",
  ///   "minLeadingWidth": "<double>",
  ///   "minVerticalPadding": "<double>",
  ///   "mouseCursor": "<MaterialStateProperty<MouseCursor>>",
  ///   "selectedColor": "<Color>",
  ///   "selectedTileColor": "<Color>",
  ///   "shape": "<ShapeBorder>",
  ///   "style": "<ListTileStyle>",
  ///   "textColor": "<Color>",
  ///   "tileColor": "<Color>",
  ///   "visualDensity": "<VisualDensity>"
  /// }
  /// ```
  static Map<String, dynamic>? encodeListTileThemeData(
      ListTileThemeData? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'contentPadding': encodeEdgeInsetsGeometry(
          value.contentPadding as EdgeInsets?,
        ),
        'dense': value.dense,
        'enableFeedback': value.enableFeedback,
        'horizontalTitleGap': value.horizontalTitleGap,
        'iconColor': encodeColor(value.iconColor),
        'leadingAndTrailingTextStyle': encodeTextStyle(
          value.leadingAndTrailingTextStyle,
        ),
        'minLeadingWidth': value.minLeadingWidth,
        'minVerticalPadding': value.minVerticalPadding,
        'mouseCursor': encodeWidgetStatePropertyMouseCursor(
          value.mouseCursor,
        ),
        'selectedColor': encodeColor(value.selectedColor),
        'selectedTileColor': encodeColor(value.selectedTileColor),
        'shape': encodeShapeBorder(value.shape),
        'subtitleTextStyle': encodeTextStyle(value.subtitleTextStyle),
        'style': encodeListTileStyle(value.style),
        'textColor': encodeColor(value.textColor),
        'tileColor': encodeColor(value.tileColor),
        'titleTextAlignment': encodeListTileTitleAlignment(
          value.titleAlignment,
        ),
        'visualDensity': encodeVisualDensity(value.visualDensity),
      };
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
  static Map<String, dynamic>? encodeLocale(Locale? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'countryCode': value.countryCode,
        'languageCode': value.languageCode,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `center`
  ///  * `end`
  ///  * `spaceAround`
  ///  * `spaceBetween`
  ///  * `spaceEvenly`
  ///  * `start`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeMainAxisAlignment(MainAxisAlignment? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case MainAxisAlignment.center:
          result = 'center';
          break;
        case MainAxisAlignment.end:
          result = 'end';
          break;
        case MainAxisAlignment.spaceAround:
          result = 'spaceAround';
          break;
        case MainAxisAlignment.spaceBetween:
          result = 'spaceBetween';
          break;
        case MainAxisAlignment.spaceEvenly:
          result = 'spaceEvenly';
          break;
        case MainAxisAlignment.start:
          result = 'start';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `max`
  ///  * `min`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeMainAxisSize(MainAxisSize? value) {
    String? result;
    if (value != null) {
      switch (value) {
        case MainAxisSize.max:
          result = 'max';
          break;
        case MainAxisSize.min:
          result = 'min';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "contentTextStyle": "<TextStyle>",
  ///   "dividerColor": "<Color>",
  ///   "elevation": "<double>",
  ///   "leadingPadding": "<EdgeInsetsGeometry>",
  ///   "padding": "<EdgeInsetsGeometry>",
  ///   "shadowColor": "<Color>",
  ///   "surfaceTintColor": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeMaterialBannerThemeData(
    MaterialBannerThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'backgroundColor': encodeColor(value.backgroundColor),
        'contentTextStyle': encodeTextStyle(value.contentTextStyle),
        'dividerColor': encodeColor(value.dividerColor),
        'elevation': value.elevation,
        'leadingPadding': encodeEdgeInsetsGeometry(
          value.leadingPadding as EdgeInsets?,
        ),
        'padding': encodeEdgeInsetsGeometry(value.padding as EdgeInsets?),
        'shadowColor': encodeColor(value.shadowColor),
        'surfaceTintColor': encodeColor(value.surfaceTintColor),
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
  ///
  /// See also:
  ///  * [encodeColor]
  static Map<String, dynamic>? encodeMaterialColor(MaterialColor? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'primary': encodeColor(Color(value.value)),
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

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `padded`
  ///  * `shrinkWrap`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeMaterialTapTargetSize(MaterialTapTargetSize? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case MaterialTapTargetSize.padded:
          result = 'padded';
          break;
        case MaterialTapTargetSize.shrinkWrap:
          result = 'shrinkWrap';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `button`
  ///  * `canvas`
  ///  * `card`
  ///  * `circle`
  ///  * `transparency`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeMaterialType(MaterialType? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case MaterialType.button:
          result = 'button';
          break;
        case MaterialType.canvas:
          result = 'canvas';
          break;
        case MaterialType.card:
          result = 'card';
          break;
        case MaterialType.circle:
          result = 'circle';
          break;
        case MaterialType.transparency:
          result = 'transparency';
          break;
      }
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
  static List<double>? encodeMatrix4(Matrix4? value) {
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

  /// Encodes the [value] to a [MaxLengthEnforcement].  Supported values are:
  ///  * `enforced`
  ///  * `none`
  ///  * `truncateAfterCompositionEnds`
  static String? encodeMaxLengthEnforcement(
    MaxLengthEnforcement? value, {
    bool validate = true,
  }) {
    String? result;
    if (value != null) {
      switch (value) {
        case MaxLengthEnforcement.enforced:
          result = 'enforced';
          break;
        case MaxLengthEnforcement.none:
          result = 'none';
          break;
        case MaxLengthEnforcement.truncateAfterCompositionEnds:
          result = 'truncateAfterCompositionEnds';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to an JSON map.
  ///
  /// ```json
  /// {
  ///   "style": "<MenuStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeMenuStyle]
  static Map<String, dynamic>? encodeMenuBarThemeData(MenuBarThemeData? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'style': encodeMenuStyle(
          value.style,
        ),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to an JSON map.
  ///
  /// ```json
  /// {
  ///   "style": "<ButtonStyle>",
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeButtonStyle]
  static Map<String, dynamic>? encodeMenuButtonThemeData(
    MenuButtonThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'style': encodeButtonStyle(value.style),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to an JSON map.
  ///
  /// ```json
  /// {
  ///   "alignment": "<Alignment>",
  ///   "backgroundColor": "<MaterialStateProperty<Color>>",
  ///   "elevation": "<MaterialStateProperty<double>>",
  ///   "fixedSize": "<MaterialStateProperty<Size>>",
  ///   "maximumSize": "<MaterialStateProperty<Size>>",
  ///   "minimumSize": "<MaterialStateProperty<Size>>",
  ///   "padding": "<MaterialStateProperty<EdgeInsets>>",
  ///   "shadowColor": "<MaterialStateProperty<Color>>",
  ///   "shape": "<MaterialStateProperty<OutlinedBorder>>",
  ///   "side": "<MaterialStateProperty<BorderSide>>",
  ///   "surfaceTintColor": "<MaterialStateProperty<Color>>",
  ///   "visualDensity": "<VisualDensity>",
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeAlignment]
  ///  * [encodeWidgetStatePropertyBorderSide]
  ///  * [encodeWidgetStatePropertyColor]
  ///  * [encodeWidgetStatePropertyDouble]
  ///  * [encodeWidgetStatePropertyEdgeInsetsGeometry]
  ///  * [encodeWidgetStatePropertyMouseCursor]
  ///  * [encodeWidgetStatePropertySize]
  ///  * [encodeVisualDensity]
  static Map<String, dynamic>? encodeMenuStyle(MenuStyle? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'alignment': encodeAlignmentGeometry(value.alignment),
        'backgroundColor': encodeWidgetStatePropertyColor(
          value.backgroundColor,
        ),
        'elevation': encodeWidgetStatePropertyDouble(value.elevation),
        'fixedSize': encodeWidgetStatePropertySize(value.fixedSize),
        'maximumSize': encodeWidgetStatePropertySize(value.maximumSize),
        'minimumSize': encodeWidgetStatePropertySize(value.minimumSize),
        'mouseCursor': encodeWidgetStatePropertyMouseCursor(
          value.mouseCursor,
        ),
        'padding': encodeWidgetStatePropertyEdgeInsetsGeometry(value.padding),
        'shadowColor': encodeWidgetStatePropertyColor(value.shadowColor),
        'shape': encodeWidgetStatePropertyOutlinedBorder(value.shape),
        'side': encodeWidgetStatePropertyBorderSide(value.side),
        'surfaceTintColor': encodeWidgetStatePropertyColor(
          value.surfaceTintColor,
        ),
        'visualDensity': encodeVisualDensity(value.visualDensity),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to an JSON map.
  ///
  /// ```json
  /// {
  ///   "style": "<MenuStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeMenuStyle]
  static Map<String, dynamic>? encodeMenuThemeData(MenuThemeData? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'style': encodeMenuStyle(value.style),
      };
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
  static Map<String, dynamic>? encodeMouseCursor(MouseCursor? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      if (value == MouseCursor.defer) {
        result = {
          'type': 'defer',
        };
      } else if (value == MouseCursor.uncontrolled) {
        result = {
          'type': 'uncontrolled',
        };
      } else if (WidgetStateMouseCursor.clickable == value) {
        result = {
          'cursor': 'clickable',
          'type': 'material',
        };
      } else if (WidgetStateMouseCursor.textable == value) {
        result = {
          'cursor': 'textable',
          'type': 'material',
        };
      } else if (SystemMouseCursors.alias == value) {
        result = {
          'cursor': 'alias',
          'type': 'system',
        };
      } else if (SystemMouseCursors.allScroll == value) {
        result = {
          'cursor': 'allScroll',
          'type': 'system',
        };
      } else if (SystemMouseCursors.basic == value) {
        result = {
          'cursor': 'basic',
          'type': 'system',
        };
      } else if (SystemMouseCursors.cell == value) {
        result = {
          'cursor': 'cell',
          'type': 'system',
        };
      } else if (SystemMouseCursors.click == value) {
        result = {
          'cursor': 'click',
          'type': 'system',
        };
      } else if (SystemMouseCursors.contextMenu == value) {
        result = {
          'cursor': 'contextMenu',
          'type': 'system',
        };
      } else if (SystemMouseCursors.copy == value) {
        result = {
          'cursor': 'copy',
          'type': 'system',
        };
      } else if (SystemMouseCursors.disappearing == value) {
        result = {
          'cursor': 'disappearing',
          'type': 'system',
        };
      } else if (SystemMouseCursors.forbidden == value) {
        result = {
          'cursor': 'forbidden',
          'type': 'system',
        };
      } else if (SystemMouseCursors.grab == value) {
        result = {
          'cursor': 'grab',
          'type': 'system',
        };
      } else if (SystemMouseCursors.grabbing == value) {
        result = {
          'cursor': 'grabbing',
          'type': 'system',
        };
      } else if (SystemMouseCursors.help == value) {
        result = {
          'cursor': 'help',
          'type': 'system',
        };
      } else if (SystemMouseCursors.move == value) {
        result = {
          'cursor': 'move',
          'type': 'system',
        };
      } else if (SystemMouseCursors.noDrop == value) {
        result = {
          'cursor': 'noDrop',
          'type': 'system',
        };
      } else if (SystemMouseCursors.none == value) {
        result = {
          'cursor': 'none',
          'type': 'system',
        };
      } else if (SystemMouseCursors.precise == value) {
        result = {
          'cursor': 'precise',
          'type': 'system',
        };
      } else if (SystemMouseCursors.progress == value) {
        result = {
          'cursor': 'progress',
          'type': 'system',
        };
      } else if (SystemMouseCursors.resizeColumn == value) {
        result = {
          'cursor': 'resizeColumn',
          'type': 'system',
        };
      } else if (SystemMouseCursors.resizeDown == value) {
        result = {
          'cursor': 'resizeDown',
          'type': 'system',
        };
      } else if (SystemMouseCursors.resizeDownLeft == value) {
        result = {
          'cursor': 'resizeDownLeft',
          'type': 'system',
        };
      } else if (SystemMouseCursors.resizeDownRight == value) {
        result = {
          'cursor': 'resizeDownRight',
          'type': 'system',
        };
      } else if (SystemMouseCursors.resizeLeft == value) {
        result = {
          'cursor': 'resizeLeft',
          'type': 'system',
        };
      } else if (SystemMouseCursors.resizeLeftRight == value) {
        result = {
          'cursor': 'resizeLeftRight',
          'type': 'system',
        };
      } else if (SystemMouseCursors.resizeRight == value) {
        result = {
          'cursor': 'resizeRight',
          'type': 'system',
        };
      } else if (SystemMouseCursors.resizeRow == value) {
        result = {
          'cursor': 'resizeRow',
          'type': 'system',
        };
      } else if (SystemMouseCursors.resizeUp == value) {
        result = {
          'cursor': 'resizeUp',
          'type': 'system',
        };
      } else if (SystemMouseCursors.resizeUpDown == value) {
        result = {
          'cursor': 'resizeUpDown',
          'type': 'system',
        };
      } else if (SystemMouseCursors.resizeUpLeft == value) {
        result = {
          'cursor': 'resizeUpLeft',
          'type': 'system',
        };
      } else if (SystemMouseCursors.resizeUpLeftDownRight == value) {
        result = {
          'cursor': 'resizeUpLeftDownRight',
          'type': 'system',
        };
      } else if (SystemMouseCursors.resizeUpRight == value) {
        result = {
          'cursor': 'resizeUpRight',
          'type': 'system',
        };
      } else if (SystemMouseCursors.resizeUpRightDownLeft == value) {
        result = {
          'cursor': 'resizeUpRightDownLeft',
          'type': 'system',
        };
      } else if (SystemMouseCursors.text == value) {
        result = {
          'cursor': 'text',
          'type': 'system',
        };
      } else if (SystemMouseCursors.verticalText == value) {
        result = {
          'cursor': 'verticalText',
          'type': 'system',
        };
      } else if (SystemMouseCursors.wait == value) {
        result = {
          'cursor': 'wait',
          'type': 'system',
        };
      } else if (SystemMouseCursors.zoomIn == value) {
        result = {
          'cursor': 'zoomIn',
          'type': 'system',
        };
      } else if (SystemMouseCursors.zoomOut == value) {
        result = {
          'cursor': 'zoomOut',
          'type': 'system',
        };
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "elevation": "<double>",
  ///   "height": "<double>",
  ///   "iconTheme": "<MaterialStateProperty<IconThemeData>>",
  ///   "indicatorColor": "<Color>",
  ///   "indicatorShape": "<ShapeBorder>",
  ///   "labelBehavior": "<NavigationDestinationLabelBehavior>",
  ///   "labelTextStyle": "<MaterialStateProperty<TextStyle>>",
  ///   "shadowColor": "<Color>",
  ///   "surfaceTintColor": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeWidgetStatePropertyIconThemeData]
  ///  * [encodeWidgetStatePropertyTextStyle]
  ///  * [encodeNavigationDestinationLabelBehavior]
  static Map<String, dynamic>? encodeNavigationBarThemeData(
    NavigationBarThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'backgroundColor': encodeColor(value.backgroundColor),
        'elevation': value.elevation,
        'height': value.height,
        'iconTheme': encodeWidgetStatePropertyIconThemeData(
          value.iconTheme,
        ),
        'indicatorColor': encodeColor(value.indicatorColor),
        'indicatorShape': encodeShapeBorder(value.indicatorShape),
        'labelBehavior': encodeNavigationDestinationLabelBehavior(
          value.labelBehavior,
        ),
        'labelTextStyle': encodeWidgetStatePropertyTextStyle(
          value.labelTextStyle,
        ),
        'shadowColor': encodeColor(value.shadowColor),
        'surfaceTintColor': encodeColor(value.surfaceTintColor),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `alwaysHide`
  ///  * `alwaysShow`
  ///  * `onlyShowSelected`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeNavigationDestinationLabelBehavior(
    NavigationDestinationLabelBehavior? value, {
    bool validate = true,
  }) {
    String? result;

    if (value != null) {
      switch (value) {
        case NavigationDestinationLabelBehavior.alwaysHide:
          result = 'alwaysHide';
          break;

        case NavigationDestinationLabelBehavior.alwaysShow:
          result = 'alwaysShow';
          break;

        case NavigationDestinationLabelBehavior.onlyShowSelected:
          result = 'onlyShowSelected';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `all`
  ///  * `none`
  ///  * `selected`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeNavigationRailLabelType(NavigationRailLabelType? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case NavigationRailLabelType.all:
          result = 'all';
          break;

        case NavigationRailLabelType.none:
          result = 'none';
          break;

        case NavigationRailLabelType.selected:
          result = 'selected';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "elevation": "<double>",
  ///   "groupAlignment": "<double>",
  ///   "indicatorColor": "<Color>",
  ///   "indicatorShape": "<ShapeBorder>",
  ///   "labelType": "<NavigationRailLabelType>",
  ///   "minExtendedWidth": "<double>",
  ///   "minWidth": "<double>",
  ///   "selectedIconTheme": "<IconThemeData>",
  ///   "selectedLabelTextStyle": "<TextStyle>",
  ///   "unselectedIconTheme": "<IconThemeData>",
  ///   "unselectedLabelTextStyle": "<TextStyle>",
  ///   "useIndicator": "<bool>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeIconThemeData]
  ///  * [encodeNavigationRailLabelType]
  ///  * [encodeShapeBorder]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeNavigationRailThemeData(
    NavigationRailThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'backgroundColor': encodeColor(value.backgroundColor),
        'elevation': value.elevation,
        'groupAlignment': value.groupAlignment,
        'indicatorColor': encodeColor(value.indicatorColor),
        'indicatorShape': encodeShapeBorder(value.indicatorShape),
        'labelType': encodeNavigationRailLabelType(value.labelType),
        'minExtendedWidth': value.minExtendedWidth,
        'minWidth': value.minWidth,
        'selectedIconTheme': encodeIconThemeData(value.selectedIconTheme),
        'selectedLabelTextStyle': encodeTextStyle(
          value.selectedLabelTextStyle,
        ),
        'unselectedIconTheme': encodeIconThemeData(value.unselectedIconTheme),
        'unselectedLabelTextStyle': encodeTextStyle(
          value.unselectedLabelTextStyle,
        ),
        'useIndicator': value.useIndicator,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `circular`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeNotchedShape(NotchedShape? value) {
    assert(value == null || value is CircularNotchedRectangle);
    String? result;

    if (value != null) {
      result = 'circular';
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "dx": "<double>",
  ///   "dy": "<double>"
  /// }
  /// ```
  static Map<String, dynamic>? encodeOffset(Offset? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'dx': value.dx,
        'dy': value.dy,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [OrdinalSortKey] to a JSON representation.  This
  /// produces the given the following structure:
  ///
  /// ```json
  /// {
  ///   "name": "<String>",
  ///   "order": "<double>"
  /// }
  /// ```
  static Map<String, dynamic>? encodeOrdinalSortKey(OrdinalSortKey? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'name': value.name,
        'order': value.order,
      };
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
  ///
  /// See also:
  ///  * [encodeBorderRadius]
  ///  * [encodeBorderSide]
  static Map<String, dynamic>? encodeOutlinedBorder(ShapeBorder? value) {
    assert(value == null ||
        value is BeveledRectangleBorder ||
        value is CircleBorder ||
        value is ContinuousRectangleBorder ||
        value is RoundedRectangleBorder ||
        value is StadiumBorder);
    Map<String, dynamic>? result;

    if (value != null) {
      if (value is BeveledRectangleBorder) {
        result = <String, dynamic>{
          'borderRadius':
              encodeBorderRadius(value.borderRadius as BorderRadius?),
          'side': encodeBorderSide(value.side),
          'type': 'beveled',
        };
      } else if (value is CircleBorder) {
        result = <String, dynamic>{
          'side': encodeBorderSide(value.side),
          'type': 'circle',
        };
      } else if (value is ContinuousRectangleBorder) {
        result = <String, dynamic>{
          'borderRadius':
              encodeBorderRadius(value.borderRadius as BorderRadius?),
          'side': encodeBorderSide(value.side),
          'type': 'rectangle',
        };
      } else if (value is RoundedRectangleBorder) {
        result = <String, dynamic>{
          'borderRadius':
              encodeBorderRadius(value.borderRadius as BorderRadius?),
          'side': encodeBorderSide(value.side),
          'type': 'rounded',
        };
      } else if (value is StadiumBorder) {
        result = <String, dynamic>{
          'side': encodeBorderSide(value.side),
          'type': 'stadium',
        };
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "style": "<ButtonStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeButtonStyle]
  static Map<String, dynamic>? encodeOutlinedButtonThemeData(
    OutlinedButtonThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'style': encodeButtonStyle(value.style),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] to a [String].  Supported values are:
  /// * `deferToChild`
  /// * `max`
  static String? encodeOverflowBoxFit(OverflowBoxFit? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case OverflowBoxFit.deferToChild:
          result = 'deferToChild';
          break;

        case OverflowBoxFit.max:
          result = 'max';
          break;
      }
    }
    return _stripDynamicNull(result);
  }

  /// Encodes the [value] to a [String].  Supported values are:
  /// * `cupertino`
  /// * `fadeUpwards`
  /// * `openUpwards`
  /// * `zoom`
  static String? encodePageTransitionsBuilder(PageTransitionsBuilder? value) {
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

  /// Encodes the given [value] to a JSON representation
  ///
  /// ```json
  /// {
  ///   "builders": "<Map<TargetPlatform, PageTransitionBuilder>>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodePageTransitionsBuilder]
  ///  * [encodeTargetPlatform]
  static Map<String, dynamic>? encodePageTransitionsTheme(
    PageTransitionsTheme? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      final builders = <String, String?>{};
      value.builders.forEach(
        (key, value) =>
            builders[encodeTargetPlatform(key)!] = encodePageTransitionsBuilder(
          value,
        ),
      );

      result = {
        'builders': builders,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [PanAxis] to a string:
  ///  * `aligned`
  ///  * `free`
  ///  * `horizontal`
  ///  * `vertical`
  static String? encodePanAxis(PanAxis? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case PanAxis.aligned:
          result = 'aligned';
          break;

        case PanAxis.free:
          result = 'free';
          break;

        case PanAxis.horizontal:
          result = 'horizontal';
          break;

        case PanAxis.vertical:
          result = 'vertical';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] to a String.  Supported values are:
  ///  * `invertedStylus`
  ///  * `mouse`
  ///  * `stylus`
  ///  * `touch`
  ///  * `trackpad`
  ///  * `unknown`
  static String? encodePointerDeviceKind(PointerDeviceKind? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case PointerDeviceKind.invertedStylus:
          result = 'invertedStylus';
          break;
        case PointerDeviceKind.mouse:
          result = 'mouse';
          break;
        case PointerDeviceKind.stylus:
          result = 'stylus';
          break;
        case PointerDeviceKind.touch:
          result = 'touch';
          break;
        case PointerDeviceKind.trackpad:
          result = 'trackpad';
          break;
        case PointerDeviceKind.unknown:
          result = 'unknown';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [PopupMenuPosition] to a string:
  ///  * `over`
  ///  * `under`
  static String? encodePopupMenuPosition(PopupMenuPosition? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case PopupMenuPosition.over:
          result = 'over';
          break;

        case PopupMenuPosition.under:
          result = 'under';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "color": "<Color>",
  ///   "elevation": "<double>",
  ///   "enableFeedback": "<bool>",
  ///   "iconColor": "<Color>",
  ///   "iconSize": "<double>",
  ///   "labelTextStyle": "<MaterialStateProperty<TextStyle>>",
  ///   "mouseCursor": "<MaterialStateProperty<MouseCursor>>",
  ///   "position": "<PopupMenuPosition>",
  ///   "shadowColor": "<Color>",
  ///   "shape": "<ShapeBorder>",
  ///   "surfaceTintColor": "<Color>",
  ///   "textStyle": "<TextStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeWidgetStatePropertyMouseCursor]
  ///  * [encodeWidgetStatePropertyTextStyle]
  ///  * [encodePopupMenuPosition]
  ///  * [encodeShapeBorder]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodePopupMenuThemeData(
    PopupMenuThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'color': encodeColor(value.color),
        'elevation': value.elevation,
        'enableFeedback': value.enableFeedback,
        'iconColor': encodeColor(value.iconColor),
        'iconSize': value.iconSize,
        'labelTextStyle': encodeWidgetStatePropertyTextStyle(
          value.labelTextStyle,
        ),
        'mouseCursor': encodeWidgetStatePropertyMouseCursor(
          value.mouseCursor,
        ),
        'position': encodePopupMenuPosition(value.position),
        'shadowColor': encodeColor(value.shadowColor),
        'shape': encodeShapeBorder(value.shape),
        'surfaceTintColor': encodeColor(value.surfaceTintColor),
        'textStyle': encodeTextStyle(value.textStyle),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "circularTrackColor": "<Color>",
  ///   "color": "<Color>",
  ///   "linearMinHeight": "<double>",
  ///   "linearTrackColor": "<Color>",
  ///   "refreshBackgroundColor": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  static Map<String, dynamic>? encodeProgressIndicatorThemeData(
    ProgressIndicatorThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'circularTrackColor': encodeColor(value.circularTrackColor),
        'color': encodeColor(value.color),
        'linearMinHeight': value.linearMinHeight,
        'linearTrackColor': encodeColor(value.linearTrackColor),
        'refreshBackgroundColor': encodeColor(value.refreshBackgroundColor),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [RadioThemeData] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "fillColor": "<Color>",
  ///   "materialTapTargetSize": "<MaterialTapTargetSize>",
  ///   "mouseCursor": "<MouseCursor>",
  ///   "overlayColor": "<Color>",
  ///   "splashRadius": "<double>",
  ///   "visualDensity": "<VisualDensity>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeMaterialTapTargetSize]
  ///  * [encodeMouseCursor]
  ///  * [encodeVisualDensity]
  static Map<String, dynamic>? encodeRadioThemeData(
    RadioThemeData? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'fillColor': encodeWidgetStatePropertyColor(
          value.fillColor,
        ),
        'materialTapTargetSize': encodeMaterialTapTargetSize(
          value.materialTapTargetSize,
        ),
        'mouseCursor': encodeWidgetStatePropertyMouseCursor(
          value.mouseCursor,
        ),
        'overlayColor': encodeWidgetStatePropertyColor(
          value.overlayColor,
        ),
        'splashRadius': value.splashRadius,
        'visualDensity': encodeVisualDensity(value.visualDensity),
      };
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
  static Map<String, dynamic>? encodeRadius(Radius? value) {
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
  static Map<String, dynamic>? encodeRangeSliderThumbShape(
    RoundRangeSliderThumbShape? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
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
  static Map<String, dynamic>? encodeRangeSliderTickMarkShape(
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
  ///  * `rectangular`
  ///  * `rounded`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeRangeSliderTrackShape(RangeSliderTrackShape? value) {
    assert(value == null ||
        value is RectangularRangeSliderTrackShape ||
        value is RoundedRectRangeSliderTrackShape);
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

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `paddle`
  ///  * `rectangular`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeRangeSliderValueIndicatorShape(
    RangeSliderValueIndicatorShape? value,
  ) {
    assert(value == null ||
        value is PaddleRangeSliderValueIndicatorShape ||
        value is RectangularRangeSliderValueIndicatorShape);
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
  static Map<String, dynamic>? encodeRect(Rect? value) {
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
  ///
  /// ```json
  /// {
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeAndroidOverscrollIndicator]
  static Map<String, dynamic>? encodeScrollBehavior(
    ScrollBehavior? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {};
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
  static Map<String, dynamic>? encodeScrollPhysics(ScrollPhysics? value) {
    assert(value == null ||
        value is AlwaysScrollableScrollPhysics ||
        value is BouncingScrollPhysics ||
        value is ClampingScrollPhysics ||
        value is FixedExtentScrollPhysics ||
        value is NeverScrollableScrollPhysics ||
        value is PageScrollPhysics ||
        value is RangeMaintainingScrollPhysics);
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
            'Unknown ScrollPhysics class encounted: ${value.runtimeType}');
      }
      result = {
        'parent': encodeScrollPhysics(value.parent),
        'type': type,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] to a String.  Supported values are:
  ///  * `manual`
  ///  * `onDrag`
  static String? encodeScrollViewKeyboardDismissBehavior(
      ScrollViewKeyboardDismissBehavior? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case ScrollViewKeyboardDismissBehavior.manual:
          result = 'manual';
          break;

        case ScrollViewKeyboardDismissBehavior.onDrag:
          result = 'onDrag';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] to a String.  Supported values are:
  ///  * `bottom`
  ///  * `left`
  ///  * `right`
  ///  * `top`
  static String? encodeScrollbarOrientation(ScrollbarOrientation? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case ScrollbarOrientation.bottom:
          result = 'bottom';
          break;

        case ScrollbarOrientation.left:
          result = 'left';
          break;

        case ScrollbarOrientation.right:
          result = 'right';
          break;

        case ScrollbarOrientation.top:
          result = 'top';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [ScrollbarThemeData] to the JSON representation.  This
  /// produces the following structure:
  ///
  /// ```json
  /// {
  ///   "crossAxisMargin": "<double>",
  ///   "interactive": "<bool>",
  ///   "mainAxisMargin": "<double>",
  ///   "minThumbLength": "<double>",
  ///   "radius": "<Radius>",
  ///   "thickness": "<MaterialStateProperty<double>>",
  ///   "thumbColor": "<MaterialStateProperty<Color>>",
  ///   "thumbVisibility": "<MaterialStateProperty<bool>>",
  ///   "trackBorderColor": "<MaterialStateProperty<Color>>",
  ///   "trackColor": "<MaterialStateProperty<Color>>",
  ///   "trackVisibility": "<MaterialStateProperty<bool>>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeWidgetStatePropertyBool]
  ///  * [encodeWidgetStatePropertyColor]
  ///  * [encodeWidgetStatePropertyDouble]
  ///  * [encodeRadius]
  static Map<String, dynamic>? encodeScrollbarThemeData(
    ScrollbarThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'crossAxisMargin': value.crossAxisMargin,
        'interactive': value.interactive,
        'mainAxisMargin': value.mainAxisMargin,
        'minThumbLength': value.minThumbLength,
        'radius': encodeRadius(value.radius),
        'thickness': encodeWidgetStatePropertyDouble(
          value.thickness,
        ),
        'thumbColor': encodeWidgetStatePropertyColor(value.thumbColor),
        'thumbVisibility': encodeWidgetStatePropertyBool(
          value.thumbVisibility,
        ),
        'trackBorderColor': encodeWidgetStatePropertyColor(
          value.trackBorderColor,
        ),
        'trackColor': encodeWidgetStatePropertyColor(value.trackColor),
        'trackVisibility': encodeWidgetStatePropertyBool(
          value.trackVisibility,
        ),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the JSON representation  This provies the
  /// given [value] to follow the structure below:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<MaterialStateProperty<Color>>",
  ///   "constraints": "<BoxConstraints>",
  ///   "elevation": "<MaterialStateProperty<double>>",
  ///   "hintStyle": "<MaterialStateProperty<TextStyle>>",
  ///   "overlayColor": "<MaterialStateProperty<Color>>",
  ///   "padding": "<MaterialStateProperty<EdgeInsetsGeometry>>",
  ///   "shadowColor": "<MaterialStateProperty<Color>>",
  ///   "shape": MaterialStateProperty<OutlinedBorder>,
  ///   "side": "<MaterialStateProperty<BorderSide>>",
  ///   "surfaceTintColor": "<MaterialStateProperty<Color>>",
  ///   "textStyle": "<MaterialStateProperty<TextStyle>>",
  ///   "textCapitalization": "<TextCapitalization>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBoxConstraints]
  ///  * [encodeWidgetStatePropertyBorderSide]
  ///  * [encodeWidgetStatePropertyColor]
  ///  * [encodeWidgetStatePropertyDouble]
  ///  * [encodeWidgetStatePropertyEdgeInsetsGeometry]
  ///  * [encodeWidgetStatePropertyOutlinedBorder]
  ///  * [encodeWidgetStatePropertyTextStyle]
  static Map<String, dynamic>? encodeSearchBarThemeData(
    SearchBarThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'backgroundColor': encodeWidgetStatePropertyColor(
          value.backgroundColor,
        ),
        'constraints': encodeBoxConstraints(value.constraints),
        'elevation': encodeWidgetStatePropertyDouble(value.elevation),
        'hintStyle': encodeWidgetStatePropertyTextStyle(value.hintStyle),
        'overlayColor': encodeWidgetStatePropertyColor(value.overlayColor),
        'padding': encodeWidgetStatePropertyEdgeInsetsGeometry(value.padding),
        'shadowColor': encodeWidgetStatePropertyColor(value.shadowColor),
        'shape': encodeWidgetStatePropertyOutlinedBorder(value.shape),
        'side': encodeWidgetStatePropertyBorderSide(value.side),
        'surfaceTintColor': encodeWidgetStatePropertyColor(
          value.surfaceTintColor,
        ),
        'textStyle': encodeWidgetStatePropertyTextStyle(value.textStyle),
        'textCapitalization': encodeTextCapitalization(
          value.textCapitalization,
        ),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation as follows:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "constraints": "<BoxConstraints>",
  ///   "dividerColor": "<Color>",
  ///   "elevation": "<double>",
  ///   "headerHintStyle": "<TextStyle>",
  ///   "headerTextStyle": "<TextStyle>",
  ///   "shape": "<OutlinedBorder>",
  ///   "side": "<BorderSide>",
  ///   "surfaceTintColor": "<Color>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBorderSide]
  ///  * [encodeBoxConstraints]
  ///  * [encodeColor]
  ///  * [encodeOutlinedBorder]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeSearchViewThemeData(
    SearchViewThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'backgroundColor': encodeColor(value.backgroundColor),
        'constraints': encodeBoxConstraints(value.constraints),
        'dividerColor': encodeColor(value.dividerColor),
        'elevation': value.elevation,
        'headerHintStyle': encodeTextStyle(value.headerHintStyle),
        'headerTextStyle': encodeTextStyle(value.headerTextStyle),
        'shape': encodeOutlinedBorder(value.shape),
        'side': encodeBorderSide(value.side),
        'surfaceTintColor': encodeColor(value.surfaceTintColor),
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
  ///
  /// See also:
  ///  * [encodeButtonStyle]
  ///  * [encodeIcon]
  static Map<String, dynamic>? encodeSegmentedButtonThemeData(
    SegmentedButtonThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      final icon = value.selectedIcon;

      result = {
        'selectedIcon': icon is Icon ? encodeIcon(icon) : null,
        'style': encodeButtonStyle(value.style),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [SemanticsTag] to a JSON representation.  This
  /// produces the given the following structure:
  ///
  /// ```json
  /// {
  ///   "name": "<String>"
  /// }
  /// ```
  static Map<String, dynamic>? encodeSemanticsTag(SemanticsTag? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'name': value.name,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON compatible Map.
  ///
  /// ```json
  /// {
  ///   "blurRadius": "<double>",
  ///   "color": "<Color>",
  ///   "offset": "<Offset>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeOffset]
  static Map<String, dynamic>? encodeShadow(Shadow? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'blurRadius': value.blurRadius,
        'color': encodeColor(value.color),
        'offset': encodeOffset(value.offset),
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
  ///
  /// See also:
  ///  * [encodeBorderRadius]
  ///  * [encodeBorderSide]
  static Map<String, dynamic>? encodeShapeBorder(ShapeBorder? value) {
    assert(value == null ||
        value is CircleBorder ||
        value is ContinuousRectangleBorder ||
        value is RoundedRectangleBorder ||
        value is StadiumBorder);
    Map<String, dynamic>? result;

    if (value != null) {
      if (value is CircleBorder) {
        result = <String, dynamic>{
          'side': encodeBorderSide(value.side),
          'type': 'circle',
        };
      } else if (value is ContinuousRectangleBorder) {
        result = <String, dynamic>{
          'borderRadius':
              encodeBorderRadius(value.borderRadius as BorderRadius?),
          'side': encodeBorderSide(value.side),
          'type': 'rectangle',
        };
      } else if (value is RoundedRectangleBorder) {
        result = <String, dynamic>{
          'borderRadius':
              encodeBorderRadius(value.borderRadius as BorderRadius?),
          'side': encodeBorderSide(value.side),
          'type': 'rounded',
        };
      } else if (value is StadiumBorder) {
        result = <String, dynamic>{
          'side': encodeBorderSide(value.side),
          'type': 'stadium',
        };
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `always`
  ///  * `never`
  ///  * `onlyForContinuous`
  ///  * `onlyForDiscrete`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeShowValueIndicator(ShowValueIndicator? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case ShowValueIndicator.always:
          result = 'always';
          break;

        case ShowValueIndicator.never:
          result = 'never';
          break;

        case ShowValueIndicator.onlyForContinuous:
          result = 'onlyForContinuous';
          break;

        case ShowValueIndicator.onlyForDiscrete:
          result = 'onlyForDiscrete';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON compatible Map.
  ///
  /// This returns the JSON representation to follow the structure:
  /// ```json
  /// {
  ///   "height": "<double>",
  ///   "width": "<double>"
  /// }
  /// ```
  static Map<String, dynamic>? encodeSize(Size? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'height': value.height,
        'width': value.width,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `noOverlay`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeSliderComponentShape(
    SliderComponentShape? value,
  ) {
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

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `slideOnly`
  ///  * `slideThumb`
  ///  * `tapAndSlide``
  ///  * `tapOnly`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeSliderInteraction(
    SliderInteraction? value,
  ) {
    String? result;

    if (value != null) {
      switch (value) {
        case SliderInteraction.slideOnly:
          result = 'slideOnly';
          break;
        case SliderInteraction.slideThumb:
          result = 'slideThumb';
          break;
        case SliderInteraction.tapAndSlide:
          result = 'tapAndSlide';
          break;
        case SliderInteraction.tapOnly:
          result = 'tapOnly';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "activeTickMarkColor": "<Color>",
  ///   "activeTrackColor": "<Color>",
  ///   "allowedInteraction": "<SliderInteraction>",
  ///   "disabledActiveTickMarkColor": "<Color>",
  ///   "disabledActiveTrackColor": "<Color>",
  ///   "disabledInactiveTickMarkColor": "<Color>",
  ///   "disabledInactiveTrackColor": "<Color>",
  ///   "disabledSecondaryActiveTrackColor": "<Color>",
  ///   "disabledThumbColor": "<Color>",
  ///   "inactiveTickMarkColor": "<Color>",
  ///   "inactiveTrackColor": "<Color>",
  ///   "minThumbSeparation": "<double>",
  ///   "mouseCursor": "<MaterialStateProperty<MouseCursor>>",
  ///   "overlappingShapeStrokeColor": "<Color>",
  ///   "overlayColor": "<Color>",
  ///   "overlayShape": "<SliderComponentShape>",
  ///   "rangeThumbShape": "<RangeSliderThumbShape>",
  ///   "rangeTickMarkShape": "<RangeSliderTickMarkShape>",
  ///   "rangeTrackShape": "<RangeSliderTrackShape>",
  ///   "rangeValueIndicatorShape": "<RangeSliderValueIndicatorShape>",
  ///   "secondaryActiveTrackColor": "<Color>",
  ///   "showValueIndicator": "<ShowValueIndicator>",
  ///   "thumbColor": "<Color>",
  ///   "thumbShape": "<SliderComponentShape>",
  ///   "tickMarkShape": "<SliderTickMarkShape>",
  ///   "trackHeight": "<double>",
  ///   "trackShape": "<SliderTrackShape>",
  ///   "valueIndicatorColor": "<Color>",
  ///   "valueIndicatorShape": "<SliderComponentShape>",
  ///   "valueIndicatorTextStyle": "<TextStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeWidgetStatePropertyMouseCursor]
  ///  * [encodeShowValueIndicator]
  ///  * [encodeSliderComponentShape]
  ///  * [encodeSliderInteraction]
  ///  * [encodeSliderTickMarkShape]
  ///  * [encodeRangeSliderThumbShape]
  ///  * [encodeRangeSliderTickMarkShape]
  ///  * [encodeRangeSliderTrackShape]
  ///  * [encodeRangeSliderValueIndicatorShape]
  static Map<String, dynamic>? encodeSliderThemeData(SliderThemeData? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'activeTickMarkColor': encodeColor(value.activeTickMarkColor),
        'activeTrackColor': encodeColor(value.activeTrackColor),
        'disabledActiveTickMarkColor': encodeColor(
          value.disabledActiveTickMarkColor,
        ),
        'disabledActiveTrackColor': encodeColor(value.disabledActiveTrackColor),
        'disabledInactiveTickMarkColor': encodeColor(
          value.disabledInactiveTickMarkColor,
        ),
        'disabledInactiveTrackColor': encodeColor(
          value.disabledInactiveTrackColor,
        ),
        'disabledSecondaryActiveTrackColor': encodeColor(
          value.disabledSecondaryActiveTrackColor,
        ),
        'disabledThumbColor': encodeColor(value.disabledThumbColor),
        'inactiveTickMarkColor': encodeColor(value.inactiveTickMarkColor),
        'inactiveTrackColor': encodeColor(value.inactiveTrackColor),
        'minThumbSeparation': (value.minThumbSeparation),
        'mouseCursor': encodeWidgetStatePropertyMouseCursor(
          value.mouseCursor,
        ),
        'overlappingShapeStrokeColor': encodeColor(
          value.overlappingShapeStrokeColor,
        ),
        'overlayColor': encodeColor(value.overlayColor),
        'overlayShape': encodeSliderComponentShape(value.overlayShape),
        'rangeThumbShape': encodeRangeSliderThumbShape(
            value.rangeThumbShape as RoundRangeSliderThumbShape?),
        'rangeTickMarkShape': encodeRangeSliderTickMarkShape(
          value.rangeTickMarkShape,
        ),
        'rangeTrackShape': encodeRangeSliderTrackShape(value.rangeTrackShape),
        'rangeValueIndicatorShape': encodeRangeSliderValueIndicatorShape(
          value.rangeValueIndicatorShape,
        ),
        'secondaryActiveTrackColor': encodeColor(
          value.secondaryActiveTrackColor,
        ),
        'showValueIndicator': encodeShowValueIndicator(
          value.showValueIndicator,
        ),
        'thumbColor': encodeColor(value.thumbColor),
        'thumbShape': encodeSliderComponentShape(value.thumbShape),
        'tickMarkShape': encodeSliderTickMarkShape(value.tickMarkShape),
        'trackHeight': value.trackHeight,
        'trackShape': encodeSliderTrackShape(value.trackShape),
        'valueIndicatorColor': encodeColor(value.valueIndicatorColor),
        'valueIndicatorShape': encodeSliderComponentShape(
          value.valueIndicatorShape,
        ),
        'valueIndicatorTextStyle': encodeTextStyle(
          value.valueIndicatorTextStyle,
        ),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [SliderTickMarkShape] to a [String].  Supported values are:
  ///  * `noTickMark`
  static String? encodeSliderTickMarkShape(
    SliderTickMarkShape? value, {
    bool validate = true,
  }) {
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
  static Map<String, dynamic>? encodeSliderTrackShape(SliderTrackShape? value) {
    assert(value == null ||
        value is RectangularSliderTrackShape ||
        value is RoundedRectSliderTrackShape);
    Map<String, dynamic>? result;

    if (value != null) {
      if (value is RectangularSliderTrackShape) {
        result = <String, dynamic>{
          'type': 'rectangular',
        };
      } else if (value is RoundedRectSliderTrackShape) {
        result = <String, dynamic>{
          'type': 'rounded',
        };
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `disabled`
  ///  * `enabled`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeSmartDashesType(SmartDashesType? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case SmartDashesType.disabled:
          result = 'disabled';
          break;
        case SmartDashesType.enabled:
          result = 'enabled';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `disabled`
  ///  * `enabled`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeSmartQuotesType(SmartQuotesType? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case SmartQuotesType.disabled:
          result = 'disabled';
          break;
        case SmartQuotesType.enabled:
          result = 'enabled';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `fixed`
  ///  * `floating`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeSnackBarBehavior(SnackBarBehavior? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case SnackBarBehavior.fixed:
          result = 'fixed';
          break;

        case SnackBarBehavior.floating:
          result = 'floating';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the JSON representation.
  ///
  /// ```json
  /// {
  ///   "actionBackgroundColor": "<Color>",
  ///   "actionOverflowThreshold": "<double>",
  ///   "actionTextColor": "<Color>",
  ///   "backgroundColor": "<Color>",
  ///   "behavior": "<SnackBarBehavior>",
  ///   "closeIconColor": "<Color>",
  ///   "contentTextStyle": "<TextStyle>",
  ///   "disabledActionBackgroundColor": "<Color>",
  ///   "disabledActionTextColor": "<Color>",
  ///   "elevation": "<double>",
  ///   "insetPadding": "<EdgeInsets>",
  ///   "shape": "<ShapeBorder>",
  ///   "showCloseIcon": "<bool>",
  ///   "width": "<double>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeSnackBarBehavior]
  ///  * [encodeShapeBorder]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeSnackBarThemeData(
    SnackBarThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'actionBackgroundColor': encodeColor(value.actionBackgroundColor),
        'actionOverflowThreshold': value.actionOverflowThreshold,
        'actionTextColor': encodeColor(value.actionTextColor),
        'backgroundColor': encodeColor(value.backgroundColor),
        'behavior': encodeSnackBarBehavior(value.behavior),
        'closeIconColor': encodeColor(value.closeIconColor),
        'contentTextStyle': encodeTextStyle(value.contentTextStyle),
        'disabledActionBackgroundColor': encodeColor(
          value.disabledActionBackgroundColor,
        ),
        'disabledActionTextColor': encodeColor(value.disabledActionTextColor),
        'elevation': value.elevation,
        'insetPadding': encodeEdgeInsetsGeometry(value.insetPadding),
        'shape': encodeShapeBorder(value.shape),
        'showCloseIcon': value.showCloseIcon,
        'width': value.width,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `expand`
  ///  * `loose`
  ///  * `passthrough`
  static String? encodeStackFit(StackFit? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case StackFit.expand:
          result = 'expand';
          break;

        case StackFit.loose:
          result = 'loose';
          break;

        case StackFit.passthrough:
          result = 'passthrough';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the JSON representation.
  ///
  /// ```json
  /// {
  ///   "fontFamily": "<String>",
  ///   "fontFamilyFallback": "<String[]>",
  ///   "fontSize": "<double>",
  ///   "fontStyle": "<FontStyle>",
  ///   "fontWeight": "<FontWeight>"
  ///   "forceStrutHeight": "<bool>",
  ///   "height": "<double>",
  ///   "leading": "<double>",
  ///   "leadingDistribution": "<TextLeadingDistribution>",
  ///   "package": "<String>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeFontStyle]
  ///  * [encodeFontWeight]
  ///  * [encodeTextLeadingDistribution]
  static Map<String, dynamic>? encodeStrutStyle(StrutStyle? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'fontFamily': value.fontFamily,
        'fontFamilyFallback': value.fontFamilyFallback,
        'fontSize': value.fontSize,
        'fontStyle': encodeFontStyle(value.fontStyle),
        'fontWeight': encodeFontWeight(value.fontWeight),
        'forceStrutHeight': value.forceStrutHeight,
        'height': value.height,
        'leading': value.leading,
        'leadingDistribution': encodeTextLeadingDistribution(
          value.leadingDistribution,
        ),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to it's JSON representation.
  ///
  /// ```json
  /// {
  ///   "materialTapTargetSize": "<MaterialTapTargetSize>",
  ///   "mouseCursor": "<MaterialStateProperty<MouseCursor>>",
  ///   "overlayColor": "<MaterialStateProperty<Color>>",
  ///   "splashRadius": "<double>",
  ///   "thumbColor": "<MaterialStateProperty<Color>>",
  ///   "trackColor": "<MaterialStateProperty<Color>>",
  ///   "trackOutlineColor": "<MaterialStateProperty<Color>>"
  ///   "trackOutlineWidth": "<MaterialStateProperty<double>>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeWidgetStatePropertyColor]
  ///  * [encodeWidgetStatePropertyDouble]
  ///  * [encodeWidgetStatePropertyMouseCursor]
  ///  * [encodeMaterialTapTargetSize]
  ///  * [encodeMouseCursor]
  static Map<String, dynamic>? encodeSwitchThemeData(
    SwitchThemeData? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'materialTapTargetSize': encodeMaterialTapTargetSize(
          value.materialTapTargetSize,
        ),
        'mouseCursor': encodeWidgetStatePropertyMouseCursor(
          value.mouseCursor,
        ),
        'overlayColor': encodeWidgetStatePropertyColor(
          value.overlayColor,
        ),
        'splashRadius': value.splashRadius,
        'thumbColor': encodeWidgetStatePropertyColor(
          value.thumbColor,
        ),
        'trackColor': encodeWidgetStatePropertyColor(
          value.trackColor,
        ),
        'trackOutlineColor': encodeWidgetStatePropertyColor(
          value.trackColor,
        ),
        'trackOutlineWidth': encodeWidgetStatePropertyDouble(
          value.trackOutlineWidth,
        ),
      };
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
  static dynamic encodeSystemUiOverlayStyle(
    SystemUiOverlayStyle? value,
  ) {
    dynamic result;

    if (value != null) {
      if (value == SystemUiOverlayStyle.dark) {
        result = 'dark';
      } else if (value == SystemUiOverlayStyle.light) {
        result = 'light';
      } else {
        result = {
          'statusBarBrightness': encodeBrightness(value.statusBarBrightness),
          'statusBarColor': encodeColor(value.statusBarColor),
          'statusBarIconBrightness': encodeBrightness(
            value.statusBarIconBrightness,
          ),
          'systemNavigationBarColor': encodeColor(
            value.systemNavigationBarColor,
          ),
          'systemNavigationBarContrastEnforced':
              value.systemNavigationBarContrastEnforced,
          'systemNavigationBarDividerColor': encodeColor(
            value.systemNavigationBarDividerColor,
          ),
          'systemNavigationBarIconBrightness': encodeBrightness(
            value.systemNavigationBarIconBrightness,
          ),
          'systemStatusBarContrastEnforced':
              value.systemStatusBarContrastEnforced,
        };
      }
    }

    return result is Map<String, dynamic> ? _stripNull(result) : result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `center`
  ///  * `fill`
  ///  * `start`
  ///  * `startOffset`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeTabAlignment(TabAlignment? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case TabAlignment.center:
          result = 'center';
          break;
        case TabAlignment.fill:
          result = 'fill';
          break;
        case TabAlignment.start:
          result = 'start';
          break;
        case TabAlignment.startOffset:
          result = 'startOffset';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `label`
  ///  * `tab`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeTabBarIndicatorSize(TabBarIndicatorSize? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case TabBarIndicatorSize.label:
          result = 'label';
          break;

        case TabBarIndicatorSize.tab:
          result = 'tab';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the JSON representation.
  ///
  /// ```json
  /// {
  ///   "dividerColor": "<Color>",
  ///   "dividerHeight": "<double>",
  ///   "indicatorColor": "<Color>",
  ///   "indicatorSize": "<TabBarIndicatorSize>",
  ///   "labelPadding": "<EdgeInsetsGeometry>",
  ///   "labelColor": "<Color>",
  ///   "labelStyle": "<TextStyle>",
  ///   "mouseCursor": "<MaterialStateProperty<MouseCursor>>",
  ///   "overlayColor": "<MaterialStateProperty<Color>>",
  ///   "splashFactory": "<InteractiveInkSplashFactory>",
  ///   "tabAlignment": "<TabAlignment>"
  ///   "unselectedLabelColor": "<Color>",
  ///   "unselectedLabelStyle": "<TextStyle>",
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeInteractiveInkFeatureFactory]
  ///  * [encodeWidgetStatePropertyMouseCursor]
  ///  * [encodeWidgetStatePropertyMouseCursor]
  ///  * [encodeTabAlignment]
  ///  * [encodeTabBarIndicatorSize]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeTabBarTheme(TabBarTheme? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'dividerColor': encodeColor(value.dividerColor),
        'dividerHeight': value.dividerHeight,
        'indicatorColor': encodeColor(value.dividerColor),
        'indicatorSize': encodeTabBarIndicatorSize(value.indicatorSize),
        'labelPadding':
            encodeEdgeInsetsGeometry(value.labelPadding as EdgeInsets?),
        'labelColor': encodeColor(value.labelColor),
        'labelStyle': encodeTextStyle(value.labelStyle),
        'mouseCursor': encodeWidgetStatePropertyMouseCursor(
          value.mouseCursor,
        ),
        'overlayColor': encodeWidgetStatePropertyColor(
          value.overlayColor,
        ),
        'splashFactory': encodeInteractiveInkFeatureFactory(
          value.splashFactory,
        ),
        'tabAlignment': encodeTabAlignment(value.tabAlignment),
        'unselectedLabelColor': encodeColor(value.unselectedLabelColor),
        'unselectedLabelStyle': encodeTextStyle(value.unselectedLabelStyle),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the JSON representation.  Supported values
  /// are:
  ///
  /// ```json
  /// {
  ///   "borderRadius": "<BorderRadius>",
  ///   "bottom": "<BorderSide>",
  ///   "horizontalInside": "<BorderSide>",
  ///   "left": "<BorderSide>",
  ///   "right": "<BorderSide>",
  ///   "top": "<BorderSide>",
  ///   "verticalInside": "<BorderSide>",
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBorderRadius]
  ///  * [encodeBorderSide]
  static Map<String, dynamic>? encodeTableBorder(TableBorder? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'borderRadius':
            encodeBorderRadius(value.borderRadius) ?? BorderRadius.zero,
        'bottom': encodeBorderSide(value.bottom) ?? BorderSide.none,
        'horizontalInside':
            encodeBorderSide(value.horizontalInside) ?? BorderSide.none,
        'left': encodeBorderSide(value.left) ?? BorderSide.none,
        'right': encodeBorderSide(value.right) ?? BorderSide.none,
        'top': encodeBorderSide(value.top) ?? BorderSide.none,
        'verticalInside':
            encodeBorderSide(value.verticalInside) ?? BorderSide.none,
      };
    }

    return _stripDynamicNull(result);
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
  static Map<String, dynamic>? encodeTableColumnWidth(TableColumnWidth? value) {
    Map<String, dynamic>? result;

    if (value is FixedColumnWidth) {
      result = {
        'type': 'fixed',
        'value': value.value,
      };
    } else if (value is FlexColumnWidth) {
      result = {
        'type': 'flex',
        'value': value.value,
      };
    } else if (value is FractionColumnWidth) {
      result = {
        'type': 'fraction',
        'value': value.value,
      };
    } else if (value is IntrinsicColumnWidth) {
      result = {
        'type': 'intrinsic',
        'value': value.flex(const <RenderBox>[]),
      };
    } else if (value is MaxColumnWidth) {
      result = {
        'a': encodeTableColumnWidth(value.a),
        'b': encodeTableColumnWidth(value.b),
        'type': 'max',
      };
    } else if (value is MinColumnWidth) {
      result = {
        'a': encodeTableColumnWidth(value.a),
        'b': encodeTableColumnWidth(value.b),
        'type': 'min',
      };
    } else if (value != null) {
      throw Exception(
        '[encodeTableColumnWidth]: unknown value type: [${value.runtimeType}]',
      );
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `android`
  ///  * `fuchsia`
  ///  * `iOS`
  ///  * `linux`
  ///  * `macOS`
  ///  * `windows`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeTargetPlatform(TargetPlatform? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case TargetPlatform.android:
          result = 'android';
          break;

        case TargetPlatform.fuchsia:
          result = 'fuchsia';
          break;

        case TargetPlatform.iOS:
          result = 'iOS';
          break;

        case TargetPlatform.linux:
          result = 'linux';
          break;

        case TargetPlatform.macOS:
          result = 'macOS';
          break;

        case TargetPlatform.windows:
          result = 'windows';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `center`
  ///  * `end`
  ///  * `justify`
  ///  * `left`
  ///  * `right`
  ///  * `start`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeTextAlign(TextAlign? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case TextAlign.center:
          result = 'center';
          break;
        case TextAlign.end:
          result = 'end';
          break;
        case TextAlign.justify:
          result = 'justify';
          break;
        case TextAlign.left:
          result = 'left';
          break;
        case TextAlign.right:
          result = 'right';
          break;
        case TextAlign.start:
          result = 'start';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `bottom`
  ///  * `center`
  ///  * `top`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeTextAlignVertical(TextAlignVertical? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case TextAlignVertical.bottom:
          result = 'bottom';
          break;
        case TextAlignVertical.center:
          result = 'center';
          break;
        case TextAlignVertical.top:
          result = 'top';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `alphabetic`
  ///  * `ideographic`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeTextBaseline(TextBaseline? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case TextBaseline.alphabetic:
          result = 'alphabetic';
          break;

        case TextBaseline.ideographic:
          result = 'ideographic';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "style": "<ButtonStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeButtonStyle]
  static Map<String, dynamic>? encodeTextButtonThemeData(
    TextButtonThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'style': encodeButtonStyle(value.style),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `characters`
  ///  * `none`
  ///  * `sentences`
  ///  * `words`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeTextCapitalization(TextCapitalization? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case TextCapitalization.characters:
          result = 'characters';
          break;

        case TextCapitalization.none:
          result = 'none';
          break;

        case TextCapitalization.sentences:
          result = 'sentences';
          break;

        case TextCapitalization.words:
          result = 'words';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `lineThrough`
  ///  * `none`
  ///  * `overline`
  ///  * `underline`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeTextDecoration(TextDecoration? value) {
    String? result;

    if (value != null) {
      if (value == TextDecoration.lineThrough) {
        result = 'lineThrough';
      } else if (value == TextDecoration.none) {
        result = 'none';
      } else if (value == TextDecoration.overline) {
        result = 'overline';
      } else if (value == TextDecoration.underline) {
        result = 'underline';
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `dashed`
  ///  * `dotted`
  ///  * `double`
  ///  * `solid`
  ///  * `wavy`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeTextDecorationStyle(TextDecorationStyle? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case TextDecorationStyle.dashed:
          result = 'dashed';
          break;

        case TextDecorationStyle.dotted:
          result = 'dotted';
          break;

        case TextDecorationStyle.double:
          result = 'double';
          break;

        case TextDecorationStyle.solid:
          result = 'solid';
          break;

        case TextDecorationStyle.wavy:
          result = 'wavy';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] into a String representation.  Supported values are:
  ///  * `ltr`
  ///  * `rtl`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeTextDirection(TextDirection? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case TextDirection.ltr:
          result = 'ltr';
          break;

        case TextDirection.rtl:
          result = 'rtl';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] into a String representation.  Supported values are:
  ///  * `continueAction`
  ///  * `done`
  ///  * `emergencyCall`
  ///  * `go`
  ///  * `join`
  ///  * `newline`
  ///  * `next`
  ///  * `none`
  ///  * `previous`
  ///  * `route`
  ///  * `search`
  ///  * `send`
  ///  * `unspecified`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeTextInputAction(TextInputAction? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case TextInputAction.continueAction:
          result = 'continueAction';
          break;

        case TextInputAction.done:
          result = 'done';
          break;

        case TextInputAction.emergencyCall:
          result = 'emergencyCall';
          break;

        case TextInputAction.go:
          result = 'go';
          break;

        case TextInputAction.join:
          result = 'join';
          break;

        case TextInputAction.newline:
          result = 'newline';
          break;

        case TextInputAction.next:
          result = 'next';
          break;

        case TextInputAction.none:
          result = 'none';
          break;

        case TextInputAction.previous:
          result = 'previous';
          break;

        case TextInputAction.route:
          result = 'route';
          break;

        case TextInputAction.search:
          result = 'search';
          break;

        case TextInputAction.send:
          result = 'send';
          break;

        case TextInputAction.unspecified:
          result = 'unspecified';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] into a String representation.  Supported values are:
  ///  * `datetime`
  ///  * `emailAddress`
  ///  * `multiline`
  ///  * `name`
  ///  * `none`
  ///  * `number`
  ///  * `phone`
  ///  * `streetAddress`
  ///  * `text`
  ///  * `url`
  ///  * `visiblePassword`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeTextInputType(TextInputType? value) {
    String? result;

    if (value != null) {
      if (value.index == TextInputType.datetime.index) {
        result = 'datetime';
      } else if (value.index == TextInputType.emailAddress.index) {
        result = 'emailAddress';
      } else if (value.index == TextInputType.multiline.index) {
        result = 'multiline';
      } else if (value.index == TextInputType.name.index) {
        result = 'name';
      } else if (value.index == TextInputType.none.index) {
        result = 'none';
      } else if (value.index == TextInputType.number.index) {
        result = 'number';
      } else if (value.index == TextInputType.phone.index) {
        result = 'phone';
      } else if (value.index == TextInputType.streetAddress.index) {
        result = 'streetAddress';
      } else if (value.index == TextInputType.text.index) {
        result = 'text';
      } else if (value.index == TextInputType.url.index) {
        result = 'url';
      } else if (value.index == TextInputType.visiblePassword.index) {
        result = 'visiblePassword';
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the JSON representation.
  ///
  /// ```json
  /// {
  ///   "applyHeightToFirstAscent": "<bool>",
  ///   "applyHeightToLastDescent": "<bool>",
  ///   "leadingDistribution": "<TextLeadingDistribution>"
  /// }
  /// ```
  static Map<String, dynamic>? encodeTextHeightBehavior(
    TextHeightBehavior? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'applyHeightToFirstAscent': value.applyHeightToFirstAscent,
        'applyHeightToLastDescent': value.applyHeightToLastDescent,
        'leadingDistribution': encodeTextLeadingDistribution(
          value.leadingDistribution,
        ),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] into a String representation.  Supported values are:
  ///  * `even`
  ///  * `proportional`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeTextLeadingDistribution(TextLeadingDistribution? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case TextLeadingDistribution.even:
          result = 'even';
          break;

        case TextLeadingDistribution.proportional:
          result = 'proportional';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] into a String representation.  Supported values are:
  ///  * `clip`
  ///  * `ellipsis`
  ///  * `fade`
  ///  * `visible`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeTextOverflow(TextOverflow? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case TextOverflow.clip:
          result = 'clip';
          break;

        case TextOverflow.ellipsis:
          result = 'ellipsis';
          break;

        case TextOverflow.fade:
          result = 'fade';
          break;

        case TextOverflow.visible:
          result = 'visible';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes a given [value] into a JSON compatible Map structure.  This will
  /// return the following structure:
  ///
  /// ```json
  ///   "cursorColor": "<Color>",
  ///   "selectionColor": "<Color>",
  ///   "selectionHandleColor": "<Color>"
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  static Map<String, dynamic>? encodeTextSelectionThemeData(
    TextSelectionThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'cursorColor': encodeColor(
          value.cursorColor,
        ),
        'selectionColor': encodeColor(
          value.selectionColor,
        ),
        'selectionHandleColor': encodeColor(
          value.selectionHandleColor,
        ),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes a [TextStyle] object into a JSON map:
  ///
  /// ```json
  /// {
  ///   "children": "<List<TextSpan>>",
  ///   "locale": "<Locale>",
  ///   "mouseCursor": "<MouseCursor>",
  ///   "onEnter": "<PointerEnterEventListener>",
  ///   "onExit": "<PointerExitEventListener>",
  ///   "recognizer": "<GestureRecognizer>",
  ///   "semanticsLabel": "<String>",
  ///   "spellOut": "<bool>",
  ///   "style": "<TextStyle>",
  ///   "text": "<String>"
  /// }
  /// ```
  ///
  /// See Also:
  ///  * [encodeLocale]
  ///  * [encodeMouseCursor]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeTextSpan(TextSpan? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'children': value.children
            ?.whereType<TextSpan>()
            .map((e) => encodeTextSpan(e)!)
            .toList(),
        'locale': encodeLocale(value.locale),
        'mouseCursor': encodeMouseCursor(value.mouseCursor),
        // 'onEnter': @unencodable,
        // 'onExit': @unencodable,
        // 'recognizer': @unencodable,
        'semanticsLabel': value.semanticsLabel,
        'spellOut': value.spellOut,
        'style': encodeTextStyle(value.style),
        'text': value.text,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes a given [value] into a JSON compatible Map structure.  This will
  /// return the following structure:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "color": "<Color>",
  ///   "decoration": "<TextDecoration>",
  ///   "decorationColor": "<Color>",
  ///   "decorationStyle": "<TextDecorationStyle>",
  ///   "decorationThickness": "<double>",
  ///   "fontFamily": value['fontFamily'],
  ///   "fontFamilyFallback": "<String[]>",
  ///   "fontFeatures": "<FontFeature[]>",
  ///   "fontSize": "<double>",
  ///   "fontStyle": "<FontStyle>",
  ///   "fontVariation": "<FontVariation>",
  ///   "fontWeight": "<FontWeight>",
  ///   "height": "<double>",
  ///   "inherit": "<bool>",
  ///   "leadingDistribution": "<TextLeadingDistribution>",
  ///   "letterSpacing": "<double>",
  ///   "locale": "<Locale>",
  ///   "overflow": "<TextOverflow>",
  ///   "package": "<String>",
  ///   "shadows": "<Shadow[]>",
  ///   "textBaseline": "<TextBaseline>",
  ///   "wordSpacing": "<double>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeFontFeature]
  ///  * [encodeFontStyle]
  ///  * [encodeFontVariation]
  ///  * [encodeFontWeight]
  ///  * [encodeLocale]
  ///  * [encodeShadow]
  ///  * [encodeTextBaseline]
  ///  * [encodeTextDecoration]
  ///  * [encodeTextDecorationStyle]
  ///  * [encodeTextLeadingDistribution]
  ///  * [encodeTextOverflow]
  static Map<String, dynamic>? encodeTextStyle(TextStyle? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'backgroundColor': encodeColor(value.backgroundColor),
        'color': encodeColor(value.color),
        'decoration': encodeTextDecoration(value.decoration),
        'decorationColor': encodeColor(value.decorationColor),
        'decorationStyle': encodeTextDecorationStyle(value.decorationStyle),
        'decorationThickness': value.decorationThickness,
        'fontFamily': value.fontFamily,
        'fontFamilyFallback': value.fontFamilyFallback,
        'fontFeatures': value.fontFeatures
            ?.map(
              (value) => encodeFontFeature(value),
            )
            .toList(),
        'fontSize': value.fontSize,
        'fontStyle': encodeFontStyle(value.fontStyle),
        'fontVariations': value.fontVariations
            ?.map(
              (e) => encodeFontVariation(e),
            )
            .toList(),
        'fontWeight': encodeFontWeight(value.fontWeight),
        'height': value.height,
        'inherit': value.inherit,
        'leadingDistribution': encodeTextLeadingDistribution(
          value.leadingDistribution,
        ),
        'letterSpacing': value.letterSpacing,
        'locale': encodeLocale(value.locale),
        'overflow': encodeTextOverflow(value.overflow),
        'shadows': value.shadows
            ?.map(
              (value) => encodeShadow(value),
            )
            .toList(),
        'textBaseline': encodeTextBaseline(value.textBaseline),
        'wordSpacing': value.wordSpacing,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON compatible Map.  The returned Map will
  /// have the following structure:
  ///
  /// ```json
  /// {
  ///   "bodyLarge": "<TextStyle>",
  ///   "bodyMedium": "<TextStyle>",
  ///   "bodySmall": "<TextStyle>",
  ///   "displayLarge": "<TextStyle>",
  ///   "displayMedium": "<TextStyle>",
  ///   "displaySmall": "<TextStyle>",
  ///   "headlineLarge": "<TextStyle>",
  ///   "headlineMedium": "<TextStyle>",
  ///   "headlineSmall": "<TextStyle>",
  ///   "labelLarge": "<TextStyle>",
  ///   "labelMedium": "<TextStyle>",
  ///   "labelSmall": "<TextStyle>",
  ///   "titleLarge": "<TextStyle>",
  ///   "titleMedium": "<TextStyle>",
  ///   "titleSmall": "<TextStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeTextTheme(TextTheme? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'bodyLarge': encodeTextStyle(value.bodyLarge),
        'bodyMedium': encodeTextStyle(value.bodyMedium),
        'bodySmall': encodeTextStyle(value.bodySmall),
        'displayLarge': encodeTextStyle(value.displayLarge),
        'displayMedium': encodeTextStyle(value.displayMedium),
        'displaySmall': encodeTextStyle(value.displaySmall),
        'headlineLarge': encodeTextStyle(value.headlineLarge),
        'headlineMedium': encodeTextStyle(value.headlineMedium),
        'headlineSmall': encodeTextStyle(value.headlineSmall),
        'labelLarge': encodeTextStyle(value.labelLarge),
        'labelMedium': encodeTextStyle(value.labelMedium),
        'labelSmall': encodeTextStyle(value.labelSmall),
        'titleLarge': encodeTextStyle(value.titleLarge),
        'titleMedium': encodeTextStyle(value.titleMedium),
        'titleSmall': encodeTextStyle(value.titleSmall),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] into a String representation.  Supported values are:
  ///  * `longestLine`
  ///  * `parent`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeTextWidthBasis(TextWidthBasis? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case TextWidthBasis.longestLine:
          result = 'longestLine';
          break;
        case TextWidthBasis.parent:
          result = 'parent';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON compatible Map.  The returned Map will
  /// have the following structure:
  ///
  /// ```json
  /// {
  ///   "actionIconThemeData": "<ActionIconThemeData>",
  ///   "appBarTheme": "<AppBarTheme>",
  ///   "applyElevationOverlayColor": "<bool>",
  ///   "badgeTheme": "<BadgeThemeData>",
  ///   "bannerTheme": "<MaterialBannerThemeData>",
  ///   "bottomAppBarTheme": "<BottomAppBarThemeScheme.id,
  ///   "bottomNavigationBarTheme": "<BottomNavigationBarThemeData>",
  ///   "bottomSheetTheme": "<BottomSheetThemeData>",
  ///   "brightness": "<Brightness>",
  ///   "buttonBarTheme": "<ButtonBarThemeData>",
  ///   "buttonTheme": "<ButtonThemeData>",
  ///   "canvasColor": "<Color>",
  ///   "cardColor": "<Color>",
  ///   "cardTheme": "<CardTheme>",
  ///   "checkboxTheme": "<CheckboxThemeData>",
  ///   "chipTheme": "<ChipThemeData>",
  ///   "colorScheme": "<ColorScheme>",
  ///   "colorSchemeSeed": "<Color>",
  ///   "cupertinoOverrideTheme": "<CupertinoThemeData>",
  ///   "datePickerTheme": "<DatePickerThemeData>",
  ///   "dataTableTheme": "<DataTableThemeData>",
  ///   "dialogBackgroundColor": "<Color>",
  ///   "dialogTheme": "<DialogTheme>",
  ///   "disabledColor": "<Color>",
  ///   "dividerColor": "<Color>",
  ///   "dividerTheme": "<DividerThemeData>",
  ///   "drawerTheme": "<DrawerThemeData>",
  ///   "dropdownMenuTheme": "<DropDownMenuThemeData>",
  ///   "elevatedButtonTheme": "<ElevatedButtonThemeData>",
  ///   "expansionTileTheme": "<ExpansionTileThemeData>",
  ///   "filledButtonTheme": "<FilledButtonThemeDataScheme>"",
  ///   "floatingActionButtonTheme": "<FloatingActionButtonThemeData>",
  ///   "focusColor": "<Color>",
  ///   "fontFamily": "<String>",
  ///   "fontFamilyFallback": "<List<String>>",
  ///   "highlightColor": "<Color>",
  ///   "hintColor": "<Color>",
  ///   "hoverColor": "<Color>",
  ///   "iconButtonTheme": "<IconButtonThemeData>",
  ///   "iconTheme": "<IconThemeData>",
  ///   "indicatorColor": "<Color>",
  ///   "inputDecorationTheme": "<InputDecorationTheme>",
  ///   "listTileTheme": "<ListTileThemeData>",
  ///   "materialTapTargetSize": "<MaterialTapTargetSize>",
  ///   "menuBarTheme": "<MenuBarThemeData>",
  ///   "menuButtonTheme": "<MenuButtonThemeData>",
  ///   "menuTheme": "<MenuThemeData>",
  ///   "navigationBarTheme": "<NavigationBarThemeData>",
  ///   "navigationDrawerTheme": "<NavigationDrawerThemeData>",
  ///   "navigationRailTheme": "<NavigationRailThemeData>",
  ///   "outlinedButtonTheme": "<OutlinedButtonThemeData>",
  ///   "package": "<String>",
  ///   "pageTransitionsTheme": "<PageTransitionsTheme>",
  ///   "platform": "<TargetPlatform>",
  ///   "popupMenuTheme": "<PopupMenuThemeData>",
  ///   "primaryColor": "<Color>",
  ///   "primaryColorDark": "<Color>",
  ///   "primaryColorLight": "<Color>",
  ///   "primaryIconTheme": "<IconThemeData>",
  ///   "primarySwatch": "<MaterialColor>",
  ///   "primaryTextTheme": "<TextTheme>",
  ///   "progressIndicatorTheme": "<ProgressIndicatorThemeData>",
  ///   "radioTheme": "<RadioThemeData>",
  ///   "scaffoldBackgroundColor": "<Color>",
  ///   "scrollbarTheme": "<ScrollbarThemeData>",
  ///   "searchBarTheme": "<SearchBarThemeData>",
  ///   "searchViewTheme": "<SearchViewThemeData>",
  ///   "secondaryHeaderColor": "<Color>",
  ///   "segmentedButtonTheme": "<SegmentedButtonThemeData>",
  ///   "shadowColor": "<Color>",
  ///   "sliderTheme": "<SliderThemeData>",
  ///   "snackBarTheme": "<SnackBarThemeData>",
  ///   "splashColor": "<Color>",
  ///   "splashFactory": "<InteractiveInkFeatureFactory>",
  ///   "switchTheme": "<SwitchThemeData>",
  ///   "tabBarTheme": "<TabBarTheme>",
  ///   "textButtonTheme": "<TextButtonThemeData>",
  ///   "textSelectionTheme": "<TextSelectionThemeData>",
  ///   "textTheme": "<TextTheme>",
  ///   "timePickerTheme": "<TimePickerThemeData>",
  ///   "toggleButtonsTheme": "<ToggleButtonsThemeData>",
  ///   "tooltipTheme": "<TooltipThemeData>",
  ///   "typography": "<Typography>",
  ///   "unselectedWidgetColor": "<Color>",
  ///   "useMaterial3": "<bool>",
  ///   "visualDensity": "<VisualDensity>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeActionIconThemeData]
  ///  * [encodeAppBarTheme]
  ///  * [encodeBadgeThemeData]
  ///  * [encodeBrightness]
  ///  * [encodeBottomAppBarTheme]
  ///  * [encodeBottomSheetThemeData]
  ///  * [encodeButtonBarThemeData]
  ///  * [encodeButtonThemeData]
  ///  * [encodeCardTheme]
  ///  * [encodeCheckboxThemeData]
  ///  * [encodeChipThemeData]
  ///  * [encodeColor]
  ///  * [encodeColorScheme]
  ///  * [encodeDatePickerThemeData]
  ///  * [encodeDataTableThemeData]
  ///  * [encodeDialogTheme]
  ///  * [encodeDividerThemeData]
  ///  * [encodeDrawerThemeData]
  ///  * [encodeElevatedButtonThemeData]
  ///  * [encodeExpansionTileThemeData]
  ///  * [encodeFilledButtonThemeData]
  ///  * [encodeFloatingActionButtonThemeData]
  ///  * [encodeIconButtonThemeData]
  ///  * [encodeIconThemeData]
  ///  * [encodeInputDecorationTheme]
  ///  * [encodeInteractiveInkFeatureFactory]
  ///  * [encodeListTileThemeData]
  ///  * [encodeMaterialBannerThemeData]
  ///  * [encodeMaterialTapTargetSize]
  ///  * [encodeMenuBarThemeData]
  ///  * [encodeMenuButtonThemeData]
  ///  * [encodeMenuThemeData]
  ///  * [encodeNavigationBarThemeData]
  ///  * [encodeNavigationRailThemeData]
  ///  * [encodeOutlinedButtonThemeData]
  ///  * [encodePopupMenuThemeData]
  ///  * [encodeRadioThemeData]
  ///  * [encodeSearchBarThemeData]
  ///  * [encodeSearchViewThemeData]
  ///  * [encodeSegmentedButtonThemeData]
  ///  * [encodeSliderThemeData]
  ///  * [encodeSnackBarThemeData]
  ///  * [encodeSwitchThemeData]
  ///  * [encodeTabBarTheme]
  ///  * [encodeTargetPlatform]
  ///  * [encodeTextButtonThemeData]
  ///  * [encodeTextSelectionThemeData]
  ///  * [encodeTextStyle]
  ///  * [encodeToggleButtonsThemeData]
  ///  * [encodeTypography]
  ///  * [encodeVisualDensity]
  static Map<String, dynamic>? encodeThemeData(ThemeData? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'actionIconTheme': encodeActionIconThemeData(value.actionIconTheme),
        'appBarTheme': encodeAppBarTheme(value.appBarTheme),
        'applyElevationOverlayColor': value.applyElevationOverlayColor,
        'badgeTheme': encodeBadgeThemeData(value.badgeTheme),
        'bannerTheme': encodeMaterialBannerThemeData(value.bannerTheme),
        'bottomAppBarTheme': encodeBottomAppBarTheme(value.bottomAppBarTheme),
        'bottomNavigationBarTheme': encodeBottomNavigationBarThemeData(
          value.bottomNavigationBarTheme,
        ),
        'bottomSheetTheme': encodeBottomSheetThemeData(value.bottomSheetTheme),
        'brightness': encodeBrightness(value.brightness),
        'buttonBarTheme': encodeButtonBarThemeData(value.buttonBarTheme),
        'buttonTheme': encodeButtonThemeData(value.buttonTheme),
        'canvasColor': encodeColor(value.canvasColor),
        'cardColor': encodeColor(value.cardColor),
        'cardTheme': encodeCardTheme(value.cardTheme),
        'checkboxTheme': encodeCheckboxThemeData(value.checkboxTheme),
        'chipTheme': encodeChipThemeData(value.chipTheme),
        'colorScheme': encodeColorScheme(value.colorScheme),
        // 'colorSchemeSeed': @nonexistant,
        'cupertinoOverrideTheme': encodeCupertinoThemeData(
          value.cupertinoOverrideTheme,
        ),
        'datePickerThemeData': encodeDatePickerThemeData(value.datePickerTheme),
        'dataTableTheme': encodeDataTableThemeData(value.dataTableTheme),
        'dialogBackgroundColor': encodeColor(value.dialogBackgroundColor),
        'dialogTheme': encodeDialogTheme(value.dialogTheme),
        'disabledColor': encodeColor(value.disabledColor),
        'dividerColor': encodeColor(value.dividerColor),
        'dividerTheme': encodeDividerThemeData(value.dividerTheme),
        'drawerTheme': encodeDrawerThemeData(value.drawerTheme),
        'elevatedButtonTheme': encodeElevatedButtonThemeData(
          value.elevatedButtonTheme,
        ),
        'expansionTileThemeData': encodeExpansionTileThemeData(
          value.expansionTileTheme,
        ),
        'filledButtonTheme': encodeFilledButtonThemeData(
          value.filledButtonTheme,
        ),
        'floatingActionButtonTheme': encodeFloatingActionButtonThemeData(
          value.floatingActionButtonTheme,
        ),
        'focusColor': encodeColor(value.focusColor),
        'highlightColor': encodeColor(value.highlightColor),
        'hintColor': encodeColor(value.hintColor),
        'hoverColor': encodeColor(value.hoverColor),
        'iconButtonTheme': encodeIconButtonThemeData(value.iconButtonTheme),
        'iconTheme': encodeIconThemeData(value.iconTheme),
        'indicatorColor': encodeColor(value.indicatorColor),
        'inputDecorationTheme': encodeInputDecorationTheme(
          value.inputDecorationTheme,
        ),
        'listTileTheme': encodeListTileThemeData(value.listTileTheme),
        'materialTapTargetSize': encodeMaterialTapTargetSize(
          value.materialTapTargetSize,
        ),
        'menuBarTheme': encodeMenuBarThemeData(value.menuBarTheme),
        'menuButtonTheme': encodeMenuButtonThemeData(value.menuButtonTheme),
        'menuTheme': encodeMenuThemeData(value.menuTheme),
        'navigationBarTheme': encodeNavigationBarThemeData(
          value.navigationBarTheme,
        ),
        'navigationRailTheme': encodeNavigationRailThemeData(
          value.navigationRailTheme,
        ),
        'outlinedButtonTheme': encodeOutlinedButtonThemeData(
          value.outlinedButtonTheme,
        ),
        'platform': encodeTargetPlatform(value.platform),
        'popupMenuTheme': encodePopupMenuThemeData(value.popupMenuTheme),
        'primaryColor': encodeColor(value.primaryColor),
        'primaryColorDark': encodeColor(value.primaryColorDark),
        'primaryColorLight': encodeColor(value.primaryColorLight),
        'primaryIconTheme': encodeIconThemeData(value.primaryIconTheme),
        'primaryTextTheme': encodeTextTheme(value.primaryTextTheme),
        'radioTheme': encodeRadioThemeData(value.radioTheme),
        'scaffoldBackgroundColor': encodeColor(value.scaffoldBackgroundColor),
        'searchBarTheme': encodeSearchBarThemeData(value.searchBarTheme),
        'searchViewTheme': encodeSearchViewThemeData(value.searchViewTheme),
        'secondaryHeaderColor': encodeColor(value.secondaryHeaderColor),
        'shadowColor': encodeColor(value.shadowColor),
        'sliderTheme': encodeSliderThemeData(value.sliderTheme),
        'snackBarTheme': encodeSnackBarThemeData(value.snackBarTheme),
        'splashColor': encodeColor(value.splashColor),
        'splashFactory':
            encodeInteractiveInkFeatureFactory(value.splashFactory),
        'switchTheme': encodeSwitchThemeData(value.switchTheme),
        'tabBarTheme': encodeTabBarTheme(value.tabBarTheme),
        'textButtonTheme': encodeTextButtonThemeData(value.textButtonTheme),
        'textSelectionTheme': encodeTextSelectionThemeData(
          value.textSelectionTheme,
        ),
        'textTheme': encodeTextTheme(value.textTheme),
        'toggleButtonsTheme': encodeToggleButtonsThemeData(
          value.toggleButtonsTheme,
        ),
        'tooltipTheme': encodeTooltipThemeData(value.tooltipTheme),
        'typography': encodeTypography(value.typography),
        'unselectedWidgetColor': encodeColor(value.unselectedWidgetColor),
        'useMaterial3': value.useMaterial3,
        'visualDensity': encodeVisualDensity(value.visualDensity),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the [value] to a [TileMode].  Supported values are:
  ///  * `clamp`
  ///  * `decal`
  ///  * `mirror`
  ///  * `repeated`
  static String? encodeTileMode(TileMode? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case TileMode.clamp:
          result = 'clamp';
          break;

        case TileMode.decal:
          result = 'decal';
          break;

        case TileMode.mirror:
          result = 'mirror';
          break;

        case TileMode.repeated:
          result = 'repeated';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// encodes the given [value] to a [TimePickerThemeData].  This expects the
  /// [value] to have the following structure:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": "<Color>",
  ///   "cancelButtonStyle": "<ButtonStyle>",
  ///   "confirmButtonStyle": "<ButtonStyle>",
  ///   "dayPeriodBorderSide": "<BorderSide>",
  ///   "dayPeriodColor": "<Color>",
  ///   "dayPeriodShape": "<ShapeBorder>",
  ///   "dayPeriodTextColor": "<Color>",
  ///   "dayPeriodTextStyle": "<TextStyle>",
  ///   "dialBackgroundColor": "<Color>",
  ///   "dialHandColor": "<Color>",
  ///   "dialTextColor": "<Color>",
  ///   "dialTextStyle": "<TextStyle>",
  ///   "elevation": "<double>",
  ///   "entryModeIconColor": "<Color>",
  ///   "helpTextStyle": "<TextStyle>",
  ///   "hourMinuteColor": "<Color>",
  ///   "hourMinuteShape": "<ShapeBorder>",
  ///   "hourMinuteTextColor": "<Color>",
  ///   "hourMinuteTextStyle": "<TextStyle>",
  ///   "inputDecorationTheme": "<InputDecorationTheme>",
  ///   "padding": "<EdgeInsetsGeometry>",
  ///   "shape": "<ShapeBorder>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBorderSide]
  ///  * [encodeButtonStyle]
  ///  * [encodeColor]
  ///  * [encodeInputDecorationTheme]
  ///  * [encodeShapeBorder]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeTimePickerThemeData(
    TimePickerThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'backgroundColor': encodeColor(value.backgroundColor),
        'cancelButtonStyle': encodeButtonStyle(value.cancelButtonStyle),
        'confirmButtonStyle': encodeButtonStyle(value.confirmButtonStyle),
        'dayPeriodBorderSide': encodeBorderSide(value.dayPeriodBorderSide),
        'dayPeriodColor': encodeColor(value.dayPeriodColor),
        'dayPeriodShape': encodeShapeBorder(value.dayPeriodShape),
        'dayPeriodTextColor': encodeColor(value.dayPeriodTextColor),
        'dayPeriodTextStyle': encodeTextStyle(value.dayPeriodTextStyle),
        'dialBackgroundColor': encodeColor(value.dialBackgroundColor),
        'dialHandColor': encodeColor(value.dialHandColor),
        'dialTextColor': encodeColor(value.dialTextColor),
        'dialTextStyle': encodeTextStyle(value.dialTextStyle),
        'elevation': value.elevation,
        'entryModeIconColor': encodeColor(value.entryModeIconColor),
        'helpTextStyle': encodeTextStyle(value.helpTextStyle),
        'hourMinuteColor': encodeColor(value.hourMinuteColor),
        'hourMinuteShape': encodeShapeBorder(value.hourMinuteShape),
        'hourMinuteTextColor': encodeColor(value.hourMinuteTextColor),
        'hourMinuteTextStyle': encodeTextStyle(value.hourMinuteTextStyle),
        'inputDecorationTheme': encodeInputDecorationTheme(
          value.inputDecorationTheme,
        ),
        'padding': encodeEdgeInsetsGeometry(value.padding as EdgeInsets?),
        'shape': encodeShapeBorder(value.shape),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON compatible Map.  The returned returned
  /// value will have the following structure.
  ///
  /// ```json
  /// {
  ///   "borderColor": "<Color>",
  ///   "borderRadius": "<BorderRadius>",
  ///   "borderWidth": "<double>",
  ///   "color": "<Color>",
  ///   "constraints": "<BoxConstraints>",
  ///   "disabledBorderColor": "<Color>",
  ///   "disabledColor": "<Color>",
  ///   "fillColor": "<Color>",
  ///   "focusColor": "<Color>",
  ///   "highlightColor": "<Color>",
  ///   "hoverColor": "<Color>",
  ///   "selectedBorderColor": "<Color>",
  ///   "selectedColor": "<Color>",
  ///   "splashColor": "<Color>",
  ///   "textStyle": "<TextStyle>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBorderRadius]
  ///  * [encodeBoxConstraints]
  ///  * [encodeColor]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeToggleButtonsThemeData(
    ToggleButtonsThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'borderColor': encodeColor(value.borderColor),
        'borderRadius': encodeBorderRadius(value.borderRadius),
        'borderWidth': value.borderWidth,
        'color': encodeColor(value.color),
        'constraints': encodeBoxConstraints(value.constraints),
        'disabledBorderColor': encodeColor(value.disabledBorderColor),
        'disabledColor': encodeColor(value.disabledColor),
        'fillColor': encodeColor(value.fillColor),
        'focusColor': encodeColor(value.focusColor),
        'highlightColor': encodeColor(value.highlightColor),
        'hoverColor': encodeColor(value.hoverColor),
        'selectedBorderColor': encodeColor(value.selectedBorderColor),
        'selectedColor': encodeColor(value.selectedColor),
        'splashColor': encodeColor(value.splashColor),
        'textStyle': encodeTextStyle(value.textStyle),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON compatible Map.  The returned returned
  /// value will have the following structure.
  ///
  /// ```json
  /// {
  ///   "enableFeedback": "<bool>",
  ///   "excludeFromSemantics": "<bool>",
  ///   "height": "<double>",
  ///   "margin": "<EdgeInsetsGeometry>",
  ///   "padding": "<EdgeInsetsGeometry>",
  ///   "preferBelow": "<bool>"
  ///   "showDuration": "<int; millis>",
  ///   "textAlign": "<TextAlign>",
  ///   "textStyle": "<TextStyle>",
  ///   "triggerMode": "<TooltipTriggerMode>",
  ///   "verticalOffset": "<double>",
  ///   "waitDuration": "<int; millis>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeTextStyle]
  ///  * [encodeTooltipTriggerMode]
  static Map<String, dynamic>? encodeTooltipThemeData(TooltipThemeData? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'enableFeedback': value.enableFeedback,
        'excludeFromSemantics': value.excludeFromSemantics,
        'height': value.height,
        'margin': encodeEdgeInsetsGeometry(value.margin as EdgeInsets?),
        'padding': encodeEdgeInsetsGeometry(value.padding as EdgeInsets?),
        'preferBelow': value.preferBelow,
        'showDuration': value.showDuration?.inMilliseconds,
        'textAlign': encodeTextAlign(value.textAlign),
        'textStyle': encodeTextStyle(value.textStyle),
        'triggerMode': encodeTooltipTriggerMode(value.triggerMode),
        'verticalOffset': value.verticalOffset,
        'waitDuration': value.waitDuration?.inMilliseconds,
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `longPress`
  ///  * `manual`
  ///  * `tap`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeTooltipTriggerMode(TooltipTriggerMode? value) {
    String? result;

    if (value != null) {
      if (value == TooltipTriggerMode.longPress) {
        result = 'longPress';
      } else if (value == TooltipTriggerMode.manual) {
        result = 'manual';
      } else if (value == TooltipTriggerMode.tap) {
        result = 'tap';
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to a JSON compatible Map.  The returned returned
  /// value will have the following structure.
  ///
  /// ```json
  /// {
  ///   "black": "<TextTheme>",
  ///   "dense": "<TextTheme>",
  ///   "englishLike": "<TextTheme>",
  ///   "platform": "<TargetPlatform>",
  ///   "tall": "<TextTheme>",
  ///   "white": "<TextTheme>",
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeTargetPlatform]
  ///  * [encodeTextTheme]
  static Map<String, dynamic>? encodeTypography(Typography? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'black': encodeTextTheme(value.black),
        'dense': encodeTextTheme(value.dense),
        'englishLike': encodeTextTheme(value.englishLike),
        'tall': encodeTextTheme(value.tall),
        'white': encodeTextTheme(value.white),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `down`
  ///  * `up`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeVerticalDirection(VerticalDirection? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case VerticalDirection.down:
          result = 'down';
          break;
        case VerticalDirection.up:
          result = 'up';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `comfortable`
  ///  * `compact`
  ///  * `standard`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeVisualDensity(VisualDensity? value) {
    String? result;

    if (value != null) {
      if (value == VisualDensity.comfortable) {
        result = 'comfortable';
      } else if (value == VisualDensity.compact) {
        result = 'compact';
      } else if (value == VisualDensity.standard) {
        result = 'standard';
      }
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
  ///
  /// See also:
  ///  * [encodeColor]
  static Map<String, dynamic>? encodeWidgetStateColor(
    WidgetStateColor? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': encodeColor(value.resolve({WidgetState.disabled})),
        'dragged': encodeColor(value.resolve({WidgetState.dragged})),
        'empty': encodeColor(value.resolve({})),
        'error': encodeColor(value.resolve({WidgetState.error})),
        'focused': encodeColor(value.resolve({WidgetState.focused})),
        'hovered': encodeColor(value.resolve({WidgetState.hovered})),
        'pressed': encodeColor(value.resolve({WidgetState.pressed})),
        'scrolledUnder': encodeColor(value.resolve(
          {WidgetState.scrolledUnder},
        )),
        'selected': encodeColor(value.resolve({WidgetState.selected})),
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
  static Map<String, dynamic>? encodeWidgetStatePropertyBool(
    WidgetStateProperty<bool?>? value, {
    bool validate = true,
  }) {
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
  ///
  /// See also:
  ///  * [encodeBorderSide]
  static Map<String, dynamic>? encodeWidgetStatePropertyBorderSide(
    WidgetStateProperty<BorderSide?>? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': encodeBorderSide(value.resolve({WidgetState.disabled})),
        'dragged': encodeBorderSide(value.resolve({WidgetState.dragged})),
        'empty': encodeBorderSide(value.resolve({})),
        'error': encodeBorderSide(value.resolve({WidgetState.error})),
        'focused': encodeBorderSide(value.resolve({WidgetState.focused})),
        'hovered': encodeBorderSide(value.resolve({WidgetState.hovered})),
        'pressed': encodeBorderSide(value.resolve({WidgetState.pressed})),
        'scrolledUnder': encodeBorderSide(value.resolve(
          {WidgetState.scrolledUnder},
        )),
        'selected': encodeBorderSide(value.resolve({WidgetState.selected})),
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
  ///
  /// See also:
  ///  * [encodeColor]
  static Map<String, dynamic>? encodeWidgetStatePropertyColor(
    WidgetStateProperty<Color?>? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': encodeColor(value.resolve({WidgetState.disabled})),
        'dragged': encodeColor(value.resolve({WidgetState.dragged})),
        'empty': encodeColor(value.resolve({})),
        'error': encodeColor(value.resolve({WidgetState.error})),
        'focused': encodeColor(value.resolve({WidgetState.focused})),
        'hovered': encodeColor(value.resolve({WidgetState.hovered})),
        'pressed': encodeColor(value.resolve({WidgetState.pressed})),
        'scrolledUnder': encodeColor(value.resolve(
          {WidgetState.scrolledUnder},
        )),
        'selected': encodeColor(value.resolve({WidgetState.selected})),
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
  static Map<String, dynamic>? encodeWidgetStatePropertyDouble(
    WidgetStateProperty<double?>? value, {
    bool validate = true,
  }) {
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
  ///
  /// See also:
  ///  * [encodeEdgeInsetsGeometry]
  static Map<String, dynamic>? encodeWidgetStatePropertyEdgeInsetsGeometry(
    WidgetStateProperty<EdgeInsetsGeometry?>? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': encodeEdgeInsetsGeometry(
          value.resolve({WidgetState.disabled}) as EdgeInsets?,
        ),
        'dragged': encodeEdgeInsetsGeometry(
          value.resolve({WidgetState.dragged}) as EdgeInsets?,
        ),
        'empty': encodeEdgeInsetsGeometry(
          value.resolve({}) as EdgeInsets?,
        ),
        'error': encodeEdgeInsetsGeometry(
          value.resolve({WidgetState.error}) as EdgeInsets?,
        ),
        'focused': encodeEdgeInsetsGeometry(
          value.resolve({WidgetState.focused}) as EdgeInsets?,
        ),
        'hovered': encodeEdgeInsetsGeometry(
          value.resolve({WidgetState.hovered}) as EdgeInsets?,
        ),
        'pressed': encodeEdgeInsetsGeometry(
          value.resolve({WidgetState.pressed}) as EdgeInsets?,
        ),
        'scrolledUnder': encodeEdgeInsetsGeometry(
          value.resolve({WidgetState.scrolledUnder}) as EdgeInsets?,
        ),
        'selected': encodeEdgeInsetsGeometry(
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
  ///
  /// See also:
  ///  * [encodeIconThemeData]
  static Map<String, dynamic>? encodeWidgetStatePropertyIconThemeData(
    WidgetStateProperty<IconThemeData?>? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': encodeIconThemeData(
          value.resolve({WidgetState.disabled}),
        ),
        'dragged': encodeIconThemeData(value.resolve({WidgetState.dragged})),
        'empty': encodeIconThemeData(value.resolve({})),
        'error': encodeIconThemeData(value.resolve({WidgetState.error})),
        'focused': encodeIconThemeData(value.resolve({WidgetState.focused})),
        'hovered': encodeIconThemeData(value.resolve({WidgetState.hovered})),
        'pressed': encodeIconThemeData(value.resolve({WidgetState.pressed})),
        'scrolledUnder': encodeIconThemeData(
          value.resolve({WidgetState.selected}),
        ),
        'selected': encodeIconThemeData(
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
  ///
  /// See also:
  ///  * [encodeMouseCursor]
  static Map<String, dynamic>? encodeWidgetStatePropertyMouseCursor(
    WidgetStateProperty<MouseCursor?>? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': encodeMouseCursor(value.resolve({WidgetState.disabled})),
        'dragged': encodeMouseCursor(value.resolve({WidgetState.dragged})),
        'empty': encodeMouseCursor(value.resolve({})),
        'error': encodeMouseCursor(value.resolve({WidgetState.error})),
        'focused': encodeMouseCursor(value.resolve({WidgetState.focused})),
        'hovered': encodeMouseCursor(value.resolve({WidgetState.hovered})),
        'pressed': encodeMouseCursor(value.resolve({WidgetState.pressed})),
        'scrolledUnder': encodeMouseCursor(value.resolve(
          {WidgetState.scrolledUnder},
        )),
        'selected': encodeMouseCursor(value.resolve({WidgetState.selected})),
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
  ///
  /// See also:
  ///  * [encodeOutlinedBorder]
  static Map<String, dynamic>? encodeWidgetStatePropertyOutlinedBorder(
    WidgetStateProperty<OutlinedBorder?>? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': encodeOutlinedBorder(
          value.resolve({WidgetState.disabled}),
        ),
        'dragged': encodeOutlinedBorder(value.resolve({WidgetState.dragged})),
        'empty': encodeOutlinedBorder(value.resolve({})),
        'error': encodeOutlinedBorder(value.resolve({WidgetState.error})),
        'focused': encodeOutlinedBorder(value.resolve({WidgetState.focused})),
        'hovered': encodeOutlinedBorder(value.resolve({WidgetState.hovered})),
        'pressed': encodeOutlinedBorder(value.resolve({WidgetState.pressed})),
        'scrolledUnder': encodeOutlinedBorder(
          value.resolve({WidgetState.scrolledUnder}),
        ),
        'selected': encodeOutlinedBorder(
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
  ///
  /// See also:
  ///  * [encodeSize]
  static Map<String, dynamic>? encodeWidgetStatePropertySize(
    WidgetStateProperty<Size?>? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': encodeSize(value.resolve({WidgetState.disabled})),
        'dragged': encodeSize(value.resolve({WidgetState.dragged})),
        'empty': encodeSize(value.resolve({})),
        'error': encodeSize(value.resolve({WidgetState.error})),
        'focused': encodeSize(value.resolve({WidgetState.focused})),
        'hovered': encodeSize(value.resolve({WidgetState.hovered})),
        'pressed': encodeSize(value.resolve({WidgetState.pressed})),
        'scrolledUnder': encodeSize(value.resolve({WidgetState.scrolledUnder})),
        'selected': encodeSize(value.resolve({WidgetState.selected})),
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
  /// See also:
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeWidgetStatePropertyTextStyle(
    WidgetStateProperty<TextStyle?>? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': encodeTextStyle(value.resolve({WidgetState.disabled})),
        'dragged': encodeTextStyle(value.resolve({WidgetState.dragged})),
        'empty': encodeTextStyle(value.resolve({})),
        'error': encodeTextStyle(value.resolve({WidgetState.error})),
        'focused': encodeTextStyle(value.resolve({WidgetState.focused})),
        'hovered': encodeTextStyle(value.resolve({WidgetState.hovered})),
        'pressed': encodeTextStyle(value.resolve({WidgetState.pressed})),
        'scrolledUnder': encodeTextStyle(value.resolve(
          {WidgetState.scrolledUnder},
        )),
        'selected': encodeTextStyle(value.resolve({WidgetState.selected})),
      };
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `center`
  ///  * `end`
  ///  * `spaceAround`
  ///  * `spaceBetween`
  ///  * `spaceEvenly`
  ///  * `start`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeWrapAlignment(WrapAlignment? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case WrapAlignment.center:
          result = 'center';
          break;
        case WrapAlignment.end:
          result = 'end';
          break;
        case WrapAlignment.spaceAround:
          result = 'spaceAround';
          break;
        case WrapAlignment.spaceBetween:
          result = 'spaceBetween';
          break;
        case WrapAlignment.spaceEvenly:
          result = 'spaceEvenly';
          break;
        case WrapAlignment.start:
          result = 'start';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `center`
  ///  * `end`
  ///  * `start`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeWrapCrossAlignment(WrapCrossAlignment? value) {
    String? result;

    if (value != null) {
      switch (value) {
        case WrapCrossAlignment.center:
          result = 'center';
          break;
        case WrapCrossAlignment.end:
          result = 'end';
          break;
        case WrapCrossAlignment.start:
          result = 'start';
          break;
      }
    }

    return _stripDynamicNull(result);
  }

  static dynamic _stripDynamicNull(dynamic input) {
    var result = input;

    if (input is Map<String, dynamic>) {
      result = _stripNull(input);
    }

    return result;
  }

  static Map<String, dynamic>? _stripNull(Map<String, dynamic>? input) {
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

  static List<T>? _encodeList<T>(
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
