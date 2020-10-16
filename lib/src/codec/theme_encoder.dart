import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';

/// Encoder capable of converting Flutter Theme related classes and enums into
/// JSON compatible values.
///
/// Unless otherwise stated, each function will return [null] when given an
/// input of [null].
@immutable
class ThemeEncoder {
  ThemeEncoder._();

  /// Encodes the given [value] to an String representation of the [Alignment].
  /// Supported values are:
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
  /// All other values, including [null], will result in [null].
  static String encodeAlignment(Alignment value) {
    String result;

    if (value != null) {
      if (value.x == Alignment.bottomCenter.x &&
          value.y == Alignment.bottomCenter.y) {
        result = 'bottomCenter';
      }
      if (value.x == Alignment.bottomLeft.x &&
          value.y == Alignment.bottomLeft.y) {
        result = 'bottomLeft';
      }
      if (value.x == Alignment.bottomRight.x &&
          value.y == Alignment.bottomRight.y) {
        result = 'bottomRight';
      }

      if (value.x == Alignment.center.x && value.y == Alignment.center.y) {
        result = 'center';
      }
      if (value.x == Alignment.centerLeft.x &&
          value.y == Alignment.centerLeft.y) {
        result = 'centerLeft';
      }
      if (value.x == Alignment.centerRight.x &&
          value.y == Alignment.centerRight.y) {
        result = 'centerRight';
      }

      if (value.x == Alignment.topCenter.x &&
          value.y == Alignment.topCenter.y) {
        result = 'topCenter';
      }
      if (value.x == Alignment.topLeft.x && value.y == Alignment.topLeft.y) {
        result = 'topLeft';
      }
      if (value.x == Alignment.topRight.x && value.y == Alignment.topRight.y) {
        result = 'topRight';
      }
    }

    return result;
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "actionsIconTheme": <IconThemeData>,
  ///   "brightness": <Brightness>,
  ///   "centerTitle": <bool>,
  ///   "color": <Color>,
  ///   "elevation": <double>,
  ///   "iconTheme": <IconThemeData>,
  ///   "shadowColor": <Color>,
  ///   "textTheme": <TextTheme>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBrightness]
  ///  * [encodeColor]
  ///  * [encodeIconThemeData]
  static Map<String, dynamic> encodeAppBarTheme(AppBarTheme value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'actionsIconTheme': encodeIconThemeData(value.actionsIconTheme),
        'brightness': encodeBrightness(value.brightness),
        'centerTitle': value.centerTitle,
        'color': encodeColor(value.color),
        'elevation': value.elevation,
        'iconTheme': encodeIconThemeData(value.iconTheme),
        'shadowColor': encodeColor(value.shadowColor),
        'textTheme': encodeTextTheme(value.textTheme),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `horizontal`
  ///  * `vertical`
  static String encodeAxis(Axis value) {
    String result;

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

    return result;
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
  static String encodeBlendMode(BlendMode value) {
    String result;

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

      return result;
    }

    return result;
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "bottomLeft": <Radius>,
  ///   "bottomRight": <Radius>,
  ///   "topLeft": <Radius>,
  ///   "topRight": <Radius>,
  ///   "type": "only"
  /// }
  /// ```
  ///  ///
  /// See also:
  ///  * [encodeRadius]
  static Map<String, dynamic> encodeBorderRadius(BorderRadius value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'bottomLeft': encodeRadius(value.bottomLeft),
        'bottomRight': encodeRadius(value.bottomRight),
        'topLeft': encodeRadius(value.topLeft),
        'topRight': encodeRadius(value.topRight),
        'type': 'only',
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "color": <Color>,
  ///   "style": <BorderStyle>,
  ///   "width": <double>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBorderStyle]
  ///  * [encodeColor]
  static Map<String, dynamic> encodeBorderSide(BorderSide value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'color': encodeColor(value.color),
        'style': encodeBorderStyle(value.style),
        'width': value.width,
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `none`
  ///  * `solid`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeBorderStyle(BorderStyle value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "color": <Color>,
  ///   "elevation": <double>,
  ///   "shape": <NotchedShape>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeNotchedShape]
  static Map<String, dynamic> encodeBottomAppBarTheme(BottomAppBarTheme value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'color': encodeColor(value.color),
        'elevation': value.elevation,
        'shape': encodeNotchedShape(value.shape),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [BottomNavigationBarThemeData] to a JSON compatible map.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": <Color>,
  ///   "elevation": <double>,
  ///   "selectedIconTheme": <IconThemeData>,
  ///   "selectedIconColor": <Color>,
  ///   "selectedLabelStyle": <TextStyle>,
  ///   "showSelectedLabels": <bool>,
  ///   "showUnselectedLabels": <bool>,
  ///   "type": <BottomNavigationBarType>,
  ///   "unselectedIconTheme": <IconThemeData>,
  ///   "unselectedItemColor": <Color>,
  ///   "unselectedLabelStyle": <TextStyle>,
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBottomNavigationBarType]
  ///  * [encodeColor]
  ///  * [encodeIconThemeData]
  ///  * [encodeTextStyle]
  static Map<String, dynamic> encodeBottomNavigationBarThemeData(
    BottomNavigationBarThemeData value,
  ) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'backgroundColor': encodeColor(value.backgroundColor),
        'elevation': value.elevation,
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

    return _stripNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `fixed`
  ///  * `shifting`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeBottomNavigationBarType(BottomNavigationBarType value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": <Color>,
  ///   "clipBehavior": <Clip>,
  ///   "elevation": <double>,
  ///   "modalBackgroundColor": <Color>,
  ///   "modalElevation": <double>,
  ///   "shape": <ShapeBorder>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeClip]
  ///  * [encodeColor]
  ///  * [encodeShapeBorder]
  static Map<String, dynamic> encodeBottomSheetThemeData(
    BottomSheetThemeData value,
  ) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'backgroundColor': encodeColor(value.backgroundColor),
        'clipBehavior': encodeClip(value.clipBehavior),
        'elevation': value.elevation,
        'modalBackgroundColor': encodeColor(value.modalBackgroundColor),
        'modalElevation': value.modalElevation,
        'shape': encodeShapeBorder(value.shape),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] into a JSON compatible map.  This produces a Map
  /// in the following format:
  ///
  /// ```json
  /// {
  ///   "bottom": <BorderSide>,
  ///   "left": <BorderSide>,
  ///   "right": <BorderSide>,
  ///   "top": <BorderSide>
  /// }
  /// ```
  /// A [value] of [null] will result in [null] being returned.
  ///
  /// See also:
  ///  * [encodeBorderSide]
  static Map<String, dynamic> encodeBoxBorder(Border value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = {
        'bottom': encodeBorderSide(value.bottom),
        'left': encodeBorderSide(value.left),
        'right': encodeBorderSide(value.right),
        'top': encodeBorderSide(value.top),
      };
    }

    return result;
  }

  /// Encodes the given [value] into a JSON compatible map.  This produces a Map
  /// in the following format:
  ///
  /// ```json
  /// {
  ///   "maxHeight": <double>,
  ///   "maxWidth": <double>,
  ///   "minHeight": <double>,
  ///   "minWidth": <double>
  /// }
  /// ```
  ///
  /// A [value] of [null] will result in [null] being returned.
  static Map<String, dynamic> encodeBoxConstraints(BoxConstraints value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'maxHeight':
            value.maxHeight == double.infinity ? null : value.maxHeight,
        'maxWidth': value.maxWidth == double.infinity ? null : value.maxWidth,
        'minHeight': value.minHeight,
        'minWidth': value.minWidth,
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] into a JSON compatible map.  This produces a Map
  /// in the following format:
  ///
  /// ```json
  /// {
  ///   "backgroundBlendMode": <BlendMode>,
  ///   "border": <BoxBorder>,
  ///   "borderRadius": <BorderRadius>,
  ///   "boxShadow": <BoxShadow[]>
  ///   "color": <Color>,
  ///   "image": <DecorationImage>,
  ///   "gradient": <Gradient>,
  ///   "shape": <BoxShape>
  /// }
  /// ```
  ///
  /// A [value] of [null] will result in [null] being returned.
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
  static Map<String, dynamic> encodeBoxDecoration(BoxDecoration value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = {
        'backgroundBlendMode': encodeBlendMode(value.backgroundBlendMode),
        'border': encodeBoxBorder(value.border),
        'borderRadius': encodeBorderRadius(value.borderRadius),
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

    return result;
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
  static String encodeBoxFit(BoxFit value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] into a JSON compatible map.  This produces a Map
  /// in the following format:
  ///
  /// ```json
  /// {
  ///   "blurRadius": <double>,
  ///   "color": <Color>,
  ///   "offset": <Offset>,
  ///   "spreadRadius": <double>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeOffset]
  static Map<String, dynamic> encodeBoxShadow(dynamic value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = {
        'blurRadius': value.blurRadius,
        'color': encodeColor(value.color),
        'offset': encodeOffset(value.offset),
        'spreadRadius': value.spreadRadius,
      };
    }

    return result;
  }

  /// Encodes the given [value] to a [BoxShape].  Supported values are:
  ///  * `circle`
  ///  * `rectangle`
  static String encodeBoxShape(BoxShape value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `dark`
  ///  * `light`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeBrightness(Brightness value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `constrained`
  ///  * `padded`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeButtonBarLayoutBehavior(ButtonBarLayoutBehavior value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "alignment": <MainAxisAlignment>,
  ///   "buttonAlignedDropdown": <bool>,
  ///   "buttonHeight": <double>,
  ///   "buttonMinWidth": <double>,
  ///   "buttonPadding": <EdgeInsetsGeometry>,
  ///   "buttonTextTheme": <ButtonTextTheme>,
  ///   "layoutBehavior": <ButtonBarLayoutBehavior>,
  ///   "mainAxisSize": <MainAxisSize>,
  ///   "overflowDirection": <VerticalDirection>,
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
  static Map<String, dynamic> encodeButtonBarThemeData(
    ButtonBarThemeData value,
  ) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'alignment': encodeMainAxisAlignment(value.alignment),
        'buttonAlignedDropdown': value.buttonAlignedDropdown,
        'buttonHeight': value.buttonHeight,
        'buttonMinWidth': value.buttonMinWidth,
        'buttonPadding': encodeEdgeInsetsGeometry(value.buttonPadding),
        'buttonTextTheme': encodeButtonTextTheme(value.buttonTextTheme),
        'layoutBehavior': encodeButtonBarLayoutBehavior(value.layoutBehavior),
        'mainAxisSize': encodeMainAxisSize(value.mainAxisSize),
        'overflowDirection': encodeVerticalDirection(value.overflowDirection),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "animationDuration": <double>,
  ///   "backgroundColor": <Color>,
  ///   "elevation": <double>,
  ///   "enableFeedback": <bool>,
  ///   "foregroundColor": <Color>,
  ///   "minimumSize": <Size>,
  ///   "mouseCursor": <MouseCursor>,
  ///   "overlayColor": <Color>,
  ///   "padding": <EdgeInsetsGeometry>,
  ///   "shadowColor": <Color>,
  ///   "shape": <OutlinedBorder>,
  ///   "side": <BorderSide>,
  ///   "tapTargetSize": <MaterialTapTargetSize,
  ///   "textStyle": <TextStyle>,
  ///   "visualDensity": <VisualDensity>
  /// }
  /// ```
  ///
  /// This won't maintain the [MaterialStateProperty] of each corresponding
  /// property, instead will resolve them by using an empty set of states,
  /// returning and encoding the resolved object.
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeSize]
  ///  * [encodeMouseCursor]
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeOutlinedBorder]
  ///  * [encodeBorderSide]
  ///  * [encodeMaterialTapTargetSize]
  ///  * [encodeTextStyle]
  ///  * [encodeVisualDensity]
  static Map<String, dynamic> encodeButtonStyle(
    ButtonStyle value,
  ) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'animationDuration': value.animationDuration?.inMilliseconds,
        'backgroundColor': encodeColor(
          _resolveMaterialStateProperty<Color>(
            value.backgroundColor,
          ),
        ),
        'elevation': _resolveMaterialStateProperty<double>(
          value.elevation,
        ),
        'enableFeedback': value.enableFeedback,
        'foregroundColor': encodeColor(
          _resolveMaterialStateProperty<Color>(
            value.foregroundColor,
          ),
        ),
        'minimumSize': encodeSize(
          _resolveMaterialStateProperty<Size>(
            value.minimumSize,
          ),
        ),
        'mouseCursor': encodeMouseCursor(
          _resolveMaterialStateProperty<MouseCursor>(
            value.mouseCursor,
          ),
        ),
        'overlayColor': encodeColor(
          _resolveMaterialStateProperty<Color>(
            value.overlayColor,
          ),
        ),
        'padding': encodeEdgeInsetsGeometry(
          _resolveMaterialStateProperty<EdgeInsetsGeometry>(
            value.padding,
          ),
        ),
        'shadowColor': encodeColor(
          _resolveMaterialStateProperty<Color>(
            value.shadowColor,
          ),
        ),
        'shape': encodeOutlinedBorder(
          _resolveMaterialStateProperty<OutlinedBorder>(
            value.shape,
          ),
        ),
        'side': encodeBorderSide(
          _resolveMaterialStateProperty<BorderSide>(
            value.side,
          ),
        ),
        'tapTargetSize': encodeMaterialTapTargetSize(
          value.tapTargetSize,
        ),
        'textStyle': encodeTextStyle(
          _resolveMaterialStateProperty<TextStyle>(
            value.textStyle,
          ),
        ),
        'visualDensity': encodeVisualDensity(
          value.visualDensity,
        ),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `accent`
  ///  * `normal`
  ///  * `primary`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeButtonTextTheme(ButtonTextTheme value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "alignedDropdown": <bool>,
  ///   "buttonColor": <Color>,
  ///   "colorScheme": <ColorScheme>,
  ///   "disabledColor": <Color>,
  ///   "focusColor": <Color>,
  ///   "height": <double>,
  ///   "highlightColor": <Color>,
  ///   "hoverColor": <Color>,
  ///   "layoutBehavior": <ButtonBarLayoutBehavior>,
  ///   "materialTapTargetSize": <MaterialTapTargetSize>,
  ///   "minWidth": <double>,
  ///   "padding": <EdgeInsetsGeometry>,
  ///   "shape": <ShapeBorder>,
  ///   "splashColor": <Color>,
  ///   "textTheme": <ButtonTextTheme>
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
  static Map<String, dynamic> encodeButtonThemeData(ButtonThemeData value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'alignedDropdown': value.alignedDropdown,
        'colorScheme': encodeColorScheme(value.colorScheme),
        'height': value.height,
        'layoutBehavior': encodeButtonBarLayoutBehavior(value.layoutBehavior),
        'minWidth': value.minWidth,
        'padding': encodeEdgeInsetsGeometry(value.padding),
        'shape': encodeShapeBorder(value.shape),
        'textTheme': encodeButtonTextTheme(value.textTheme),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "clipBehavior": <Clip>,
  ///   "color": <Color>,
  ///   "elevation": <double>,
  ///   "margin": <EdgeInsetsGeometry>,
  ///   "shadowColor": <Color>,
  ///   "shape": <ShapeBorder>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeClip]
  ///  * [encodeColor]
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeShapeBorder]
  static Map<String, dynamic> encodeCardTheme(CardTheme value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'clipBehavior': encodeClip(value.clipBehavior),
        'color': encodeColor(value.color),
        'elevation': value.elevation,
        'margin': encodeEdgeInsetsGeometry(value.margin),
        'shadowColor': encodeColor(value.shadowColor),
        'shape': encodeShapeBorder(value.shape),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": <Color>,
  ///   "brightness": <Brightness>,
  ///   "checkmarkColor": <Color>,
  ///   "deleteIconColor": <Color>,
  ///   "disabledColor": <Color>,
  ///   "elevation": <double>,
  ///   "labelPadding": <EdgeInsetsGeometry>,
  ///   "labelStyle": <TextStyle>,
  ///   "padding": <EdgeInsetsGeometry>,
  ///   "pressElevation": <double>,
  ///   "secondaryLabelStyle": <TextStyle>,
  ///   "secondarySelectedColor": <Color>,
  ///   "selectedColor": <Color>,
  ///   "shape": <ShapeBorder>,
  ///   "selectedShadowColor": <Color>,
  ///   "shadowColor": <Color>,
  ///   "showCheckmark": <bool>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBrightness]
  ///  * [encodeColor]
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeShapeBorder]
  ///  * [encodeTextStyle]
  static Map<String, dynamic> encodeChipThemeData(ChipThemeData value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'backgroundColor': encodeColor(value.backgroundColor),
        'brightness': encodeBrightness(value.brightness),
        'checkmarkColor': encodeColor(value.checkmarkColor),
        'deleteIconColor': encodeColor(value.deleteIconColor),
        'disabledColor': encodeColor(value.disabledColor),
        'elevation': value.elevation,
        'labelPadding': encodeEdgeInsetsGeometry(value.labelPadding),
        'labelStyle': encodeTextStyle(value.labelStyle),
        'padding': encodeEdgeInsetsGeometry(value.padding),
        'pressElevation': value.pressElevation,
        'secondaryLabelStyle': encodeTextStyle(value.secondaryLabelStyle),
        'secondarySelectedColor': encodeColor(value.secondarySelectedColor),
        'selectedColor': encodeColor(value.selectedColor),
        'shape': encodeShapeBorder(value.shape),
        'selectedShadowColor': encodeColor(value.selectedShadowColor),
        'shadowColor': encodeColor(value.shadowColor),
        'showCheckmark': value.showCheckmark,
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `antiAlias`
  ///  * `antiAliasWithSaveLayer`
  ///  * `hardEdge`
  ///  * `none`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeClip(Clip value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to the String representation.  This will always
  /// use a hash encoded 8 digit string: "#aarrbbgg" format.
  ///
  /// This will return [null] if the value is [null].
  static String encodeColor(Color value) {
    String result;

    if (value != null) {
      var hex = value.value.toRadixString(16).padLeft(8, '0');
      result = '#$hex';
    }

    return result;
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "background": <Color>,
  ///   "brightness": <Brightness>,
  ///   "error": <Color>,
  ///   "onBackground": <Color>,
  ///   "onError": <Color>,
  ///   "onPrimary": <Color>,
  ///   "onSecondary": <Color>,
  ///   "onSurface": <Color>,
  ///   "primary": <Color>,
  ///   "primaryVariant": <Color>,
  ///   "secondary": <Color>,
  ///   "secondaryVariant": <Color>,
  ///   "surface": <Color>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBrightness]
  ///  * [encodeColor]
  static Map<String, dynamic> encodeColorScheme(ColorScheme value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'background': encodeColor(value.background),
        'brightness': encodeBrightness(value.brightness),
        'error': encodeColor(value.error),
        'onBackground': encodeColor(value.onBackground),
        'onError': encodeColor(value.onError),
        'onPrimary': encodeColor(value.onPrimary),
        'onSecondary': encodeColor(value.onSecondary),
        'onSurface': encodeColor(value.onSurface),
        'primary': encodeColor(value.primary),
        'primaryVariant': encodeColor(value.primaryVariant),
        'secondary': encodeColor(value.secondary),
        'secondaryVariant': encodeColor(value.secondaryVariant),
        'surface': encodeColor(value.surface),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `baseline`
  ///  * `center`
  ///  * `end`
  ///  * `start`
  ///  * `stretch`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeCrossAxisAlignment(CrossAxisAlignment value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `showFirst`
  ///  * `showSecond`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeCrossFadeState(CrossFadeState value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "actionTextStyle": <TextStyle>,
  ///   "dateTimePickerTextStyle": <TextStyle>,
  ///   "navActionTextStyle": <TextStyle>,
  ///   "navLargeTitleTextStyle":<TextStyle>,
  ///   "navTitleTextStyle": <TextStyle>,
  ///   "pickerTextStyle": <TextStyle>,
  ///   "primaryColor": <Color>
  ///   "tabLabelTextStyle": <TextStyle>,
  ///   "textStyle": <TextStyle>,
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeTextStyle]
  static Map<String, dynamic> encodeCupertinoTextThemeData(
    CupertinoTextThemeData value,
  ) {
    Map<String, dynamic> result;

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

    return _stripNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "barBackgroundColor": <Color>,
  ///   "brightness": <Brightness>,
  ///   "primaryColor": <Color>,
  ///   "primaryContrastingColor": <Color>,
  ///   "scaffoldBackgroundColor": <Color>,
  ///   "textTheme": <CupertinoTextThemeData>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBrightness]
  ///  * [encodeColor]
  ///  * [encodeCupertinoTextThemeData]
  static Map<String, dynamic> encodeCupertinoThemeData(
    CupertinoThemeData value,
  ) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'barBackgroundColor': encodeColor(value.barBackgroundColor),
        'brightness': encodeBrightness(value.brightness),
        'primaryColor': encodeColor(value.primaryColor),
        'primaryContrastingColor': encodeColor(value.primaryContrastingColor),
        'scaffoldBackgroundColor': encodeColor(value.scaffoldBackgroundColor),
        'textTheme': encodeCupertinoTextThemeData(value.textTheme),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "columnSpacing": <double,
  ///   "dataRowColor": <Color>,
  ///   "dataRowHeight": <double>,
  ///   "dataTextStyle": <TextStyle,
  ///   "dividerThickness": <double>,
  ///   "headingRowColor": <Color>,
  ///   "headingRowHeight": <double>,
  ///   "headingTextStyle": <TextStyle>,
  ///   "horizontalMargin": <double>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeTextStyle]
  static Map<String, dynamic> encodeDataTableThemeData(
      DataTableThemeData value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'columnSpacing': value.columnSpacing,
        'dataRowColor': encodeColor(
          _resolveMaterialStateProperty<Color>(
            value.dataRowColor,
          ),
        ),
        'dataRowHeight': value.dataRowHeight,
        'dataTextStyle': encodeTextStyle(
          value.dataTextStyle,
        ),
        'dividerThickness': value.dividerThickness,
        'headingRowColor': encodeColor(
          _resolveMaterialStateProperty<Color>(
            value.headingRowColor,
          ),
        ),
        'headingRowHeight': value.headingRowHeight,
        'headingTextStyle': encodeTextStyle(
          value.headingTextStyle,
        ),
        'horizontalMargin': value.horizontalMargin,
      };
    }

    return result;
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "alignment": <Alignment>,
  ///   "centerSlice": <Rect>,
  ///   "fit": <BoxFit>,
  ///   "image": <ImageProvider>,
  ///   "matchTextDirection": <bool>,
  ///   "repeat": <ImageRepeat>,
  ///   "scale": <double>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeAlignment]
  ///  * [encodeBoxFit]
  ///  * [encodeImageProvider]
  ///  * [encodeImageRepeat]
  ///  * [encodeRect]
  static Map<String, dynamic> encodeDecorationImage(DecorationImage value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'alignment': encodeAlignment(value.alignment),
        'centerSlice': encodeRect(value.centerSlice),
        'fit': encodeBoxFit(value.fit),
        'image': encodeImageProvider(value.image),
        'matchTextDirection': value.matchTextDirection,
        'repeat': encodeImageRepeat(value.repeat),
        'scale': value.scale,
      };
    }

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `background`
  ///  * `foreground`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeDecorationPosition(DecorationPosition value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": <Color>,
  ///   "contentTextStyle": <TextStyle>,
  ///   "elevation": <double>,
  ///   "shape": <ShapeBorder>,
  ///   "titleTextStyle": <TextStyle>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBrightness]
  ///  * [encodeShapeBorder]
  ///  * [encodeTextStyle]
  static Map<String, dynamic> encodeDialogTheme(DialogTheme value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'backgroundColor': encodeColor(value.backgroundColor),
        'contentTextStyle': encodeTextStyle(value.contentTextStyle),
        'elevation': value.elevation,
        'shape': encodeShapeBorder(value.shape),
        'titleTextStyle': encodeTextStyle(value.titleTextStyle),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "color": <Color>,
  ///   "endIndent": <double>,
  ///   "indent": <double>,
  ///   "space": <double>,
  ///   "thickness": <double>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  static Map<String, dynamic> encodeDividerThemeData(DividerThemeData value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'color': encodeColor(value.color),
        'endIndent': value.endIndent,
        'indent': value.indent,
        'space': value.space,
        'thickness': value.thickness,
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `down`
  ///  * `start`
  static String encodeDragStartBehavior(DragStartBehavior value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to a JSON compatible [Map].  The returned result
  /// will always have the following format:
  ///
  /// ```json
  /// {
  ///   "bottom": <double>,
  ///   "left": <double>,
  ///   "right": <double>,
  ///   "top": <double>
  /// }
  /// ```
  static Map<String, dynamic> encodeEdgeInsetsGeometry(EdgeInsets value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'bottom': value.bottom,
        'left': value.left,
        'right': value.right,
        'top': value.top,
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "style": <ButtonStyle>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeButtonStyle]
  static Map<String, dynamic> encodeElevatedButtonThemeData(
    ElevatedButtonThemeData value,
  ) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'style': encodeButtonStyle(value.style),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `high`
  ///  * `low`
  ///  * `medium`
  ///  * `none`
  static String encodeFilterQuality(FilterQuality value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `loose`
  ///  * `tight`
  static String encodeFlexFit(FlexFit value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `scaling`
  static String encodeFloatingActionButtonAnimator(
    FloatingActionButtonAnimator value,
  ) {
    assert(value == null || value == FloatingActionButtonAnimator.scaling);
    String result;

    if (value != null) {
      if (value == FloatingActionButtonAnimator.scaling) {
        result = 'scaling';
      }
    }

    return result;
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
  static String encodeFloatingActionButtonLocation(
    FloatingActionButtonLocation value,
  ) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": <Color>,
  ///   "disabledElevation": <double>,
  ///   "elevation": <double>,
  ///   "focusColor": <Color>,
  ///   "focusElevation": <double>,
  ///   "foregroundColor": <Color>,
  ///   "highlightElevation": <double>,
  ///   "hoverColor": <Color>,
  ///   "hoverElevation": <double>,
  ///   "shape": <ShapeBorder>,
  ///   "splashColor": <Color>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeShapeBorder]
  static Map<String, dynamic> encodeFloatingActionButtonThemeData(
    FloatingActionButtonThemeData value,
  ) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'backgroundColor': encodeColor(value.backgroundColor),
        'disabledElevation': value.disabledElevation,
        'elevation': value.elevation,
        'focusColor': encodeColor(value.focusColor),
        'focusElevation': value.focusElevation,
        'foregroundColor': encodeColor(value.foregroundColor),
        'highlightElevation': value.highlightElevation,
        'hoverColor': encodeColor(value.hoverColor),
        'hoverElevation': value.hoverElevation,
        'shape': encodeShapeBorder(value.shape),
        'splashColor': encodeColor(value.splashColor),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `always`
  ///  * `auto`
  ///  * `never`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeFloatingLabelBehavior(FloatingLabelBehavior value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "feature": <String>,
  ///   "value": <int>
  /// }
  /// ```
  static Map<String, dynamic> encodeFontFeature(FontFeature value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'feature': value.feature,
        'value': value.value,
      };
    }

    return _stripNull(result);
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
  /// All other values, including [null], will result in [null].
  static String encodeFontWeight(FontWeight value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `italic`
  ///  * `normal`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeFontStyle(FontStyle value) {
    String result;

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

    return result;
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
  ///   "begin": <Alignment>,
  ///   "colors": <Color[]>,
  ///   "end": <Alignment>,
  ///   "stops": <double[]>,
  ///   "tileMode": <TileMode>,
  ///   "transform": <GradientTransform>
  ///   "type": "linear",
  /// }
  /// ```
  ///
  /// [RadialGradient]
  /// ```json
  /// {
  ///   "center": <Alignment>,
  ///   "colors": <Color[]>,
  ///   "focal": <Alignment>,
  ///   "focalRadius": <double>,
  ///   "radius": <double>,
  ///   "stops": <double[]>,
  ///   "tileMode": <TileMode>,
  ///   "transform": <GradientTransform>
  ///   "type": "radial",
  /// }
  /// ```
  ///
  /// [SweepGradient]
  /// ```json
  /// {
  ///   "center": <Alignment>,
  ///   "colors": <Color[]>,
  ///   "endAngle": <double>,
  ///   "startAngle": <double>,
  ///   "stops": <double[]>,
  ///   "tileMode": <TileMode>,
  ///   "transform": <GradientTransform>
  ///   "type": "sweep",
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeAlignment]
  ///  * [encodeGradientTransform]
  ///  * [encodeTileMode]
  static Map<String, dynamic> encodeGradient(Gradient value) {
    assert(value == null ||
        value is LinearGradient ||
        value is RadialGradient ||
        value is SweepGradient);
    Map<String, dynamic> result;

    if (value != null) {
      if (value is LinearGradient) {
        result = {
          'begin': encodeAlignment(value.begin),
          'colors': _encodeList<String>(
            value.colors,
            (value) => encodeColor(value),
          ),
          'end': encodeAlignment(value.end),
          'stops': value.stops,
          'tileMode': encodeTileMode(value.tileMode),
          'transform': encodeGradientTransform(value.transform),
          'type': 'linear',
        };
      } else if (value is RadialGradient) {
        result = {
          'center': encodeAlignment(value.center),
          'colors': _encodeList<String>(
            value.colors,
            (value) => encodeColor(value),
          ),
          'focal': encodeAlignment(value.focal),
          'focalRadius': value.focalRadius,
          'radius': value.radius,
          'stops': value.stops,
          'tileMode': encodeTileMode(value.tileMode),
          'transform': encodeGradientTransform(value.transform),
          'type': 'radial',
        };
      } else if (value is SweepGradient) {
        result = {
          'center': encodeAlignment(value.center),
          'colors': _encodeList<String>(
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

    return result;
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
  ///   "radians": <double>
  /// }
  /// ```
  static Map<String, dynamic> encodeGradientTransform(GradientTransform value) {
    assert(value == null || value is GradientRotation);
    Map<String, dynamic> result;

    if (value != null && value is GradientRotation) {
      result = {
        'radians': value.radians,
      };
    }

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `deferToChild`
  ///  * `opaque`
  ///  * `translucent`
  static String encodeHitTestBehavior(HitTestBehavior value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to the JSON representation.
  ///
  /// ```json
  /// {
  ///   "codePoint": <int>,
  ///   "fontFamily": <String>,
  ///   "fontPackage": <String>,
  ///   "matchTextDirection": <bool>
  /// }
  /// ```
  static Map<String, dynamic> encodeIconData(IconData value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = {
        'codePoint': value.codePoint,
        'fontFamily': value.fontFamily,
        'fontPackage': value.fontPackage,
        'matchTextDirection': value.matchTextDirection,
      };
    }

    return result;
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "color": <Color>,
  ///   "opacity": <double>,
  ///   "size": <double>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  static Map<String, dynamic> encodeIconThemeData(IconThemeData value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'color': encodeColor(value.color),
        'opacity': value.opacity,
        'size': value.size,
      };
    }

    return _stripNull(result);
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
  ///   "assetName": <String>,
  ///   "type": "asset",
  ///   "package": <String>
  /// }
  /// ```
  ///
  /// Type: `memory`
  /// ```json
  /// {
  ///   "bytes": <String>,
  ///   "type": "memory",
  ///   "scale": <double>
  /// }
  /// ```
  ///
  /// Type: `network`
  /// ```json
  /// {
  ///   "headers": <Map<String, String>>,
  ///   "type": "network"
  ///   "scale": <double>,
  ///   "url": <String>
  /// }
  /// ```
  static Map<String, dynamic> encodeImageProvider(
    ImageProvider value, {
    bool validate = true,
  }) {
    Map<String, dynamic> result;

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

    return result;
  }

  /// Encodes the given [value] into a String representation.  Supported values
  /// are:
  /// * `noRepeat`
  /// * `repeat`
  /// * `repeatX`
  /// * `repeatY`
  static String encodeImageRepeat(ImageRepeat value) {
    String result;

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

    return result;
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
  ///   borderRadius: <BorderRadius>,
  ///   borderSide: <BorderSide>,
  ///   gapPadding: <double>
  /// }
  /// ```
  ///
  /// `UnderlineInputborder`
  /// ```json
  /// {
  ///   borderRadius: <BorderRadius>,
  ///   borderSide: <BorderSide>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBorderRadius]
  ///  * [encodeBorderSide]
  static Map<String, dynamic> encodeInputBorder(InputBorder value) {
    assert(value == null ||
        value is OutlineInputBorder ||
        value is UnderlineInputBorder);
    Map<String, dynamic> result;

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

    return _stripNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "alignLabelWithHint": <bool>,
  ///   "border": <InputBorder>,
  ///   "contentPadding": <EdgeInsetsGeometry>,
  ///   "counterStyle": <TextStyle>,
  ///   "disabledBorder": <InputBorder>,
  ///   "enabledBorder": <InputBorder>,
  ///   "errorBorder": <InputBorder>,
  ///   "errorMaxLines": <int>,
  ///   "errorStyle": <TextStyle>,
  ///   "fillColor": <Color>,
  ///   "filled": <bool>,
  ///   "floatingLabelBehavior": <FloatingLabelBehavior>,
  ///   "focusColor": <Color>,
  ///   "focusedBorder": <InputBorder>,
  ///   "focusedErrorBorder": <InputBorder>,
  ///   "helperMaxLines": <int>,
  ///   "helperStyle": <TextStyle>,
  ///   "hintStyle": <TextStyle>,
  ///   "hoverColor": <Color>,
  ///   "isCollapsed": <bool>,
  ///   "isDense": <bool>,
  ///   "labelStyle": <TextStyle>,
  ///   "prefixStyle": <TextStyle>,
  ///   "suffixStyle": <TextStyle>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeInputBorder]
  ///  * [encodeFloatingLabelBehavior]
  ///  * [encodeTextStyle]
  static Map<String, dynamic> encodeInputDecorationTheme(
    InputDecorationTheme value,
  ) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'alignLabelWithHint': value.alignLabelWithHint,
        'border': encodeInputBorder(value.border),
        'contentPadding': encodeEdgeInsetsGeometry(value.contentPadding),
        'counterStyle': encodeTextStyle(value.counterStyle),
        'disabledBorder': encodeInputBorder(value.disabledBorder),
        'enabledBorder': encodeInputBorder(value.enabledBorder),
        'errorBorder': encodeInputBorder(value.errorBorder),
        'errorMaxLines': value.errorMaxLines,
        'errorStyle': encodeTextStyle(value.errorStyle),
        'fillColor': encodeColor(value.fillColor),
        'filled': value.filled,
        'floatingLabelBehavior': encodeFloatingLabelBehavior(
          value.floatingLabelBehavior,
        ),
        'focusColor': encodeColor(value.focusColor),
        'focusedBorder': encodeInputBorder(value.focusedBorder),
        'focusedErrorBorder': encodeInputBorder(value.focusedErrorBorder),
        'helperMaxLines': value.helperMaxLines,
        'helperStyle': encodeTextStyle(value.helperStyle),
        'hintStyle': encodeTextStyle(value.hintStyle),
        'hoverColor': encodeColor(value.hoverColor),
        'isCollapsed': value.isCollapsed,
        'isDense': value.isDense,
        'labelStyle': encodeTextStyle(value.labelStyle),
        'prefixStyle': encodeTextStyle(value.prefixStyle),
        'suffixStyle': encodeTextStyle(value.suffixStyle),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `splash`
  ///  * `ripple`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeInteractiveInkFeatureFactory(
    InteractiveInkFeatureFactory value,
  ) {
    var splashType = InkSplash.splashFactory.runtimeType;
    var rippleType = InkRipple.splashFactory.runtimeType;

    assert(value == null ||
        value.runtimeType == splashType ||
        value.runtimeType == rippleType);
    String result;

    if (value != null) {
      if (value.runtimeType == splashType) {
        result = 'splash';
      } else if (value.runtimeType == rippleType) {
        result = 'ripple';
      }
    }

    return result;
  }

  /// Encodes the given [value] to a  JSON representation.
  ///
  /// ```json
  /// {
  ///   "countryCode": <String>,
  ///   "languageCode": <String>
  /// }
  /// ```
  static Map<String, dynamic> encodeLocale(Locale value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'countryCode': value.countryCode,
        'languageCode': value.languageCode,
      };
    }

    return _stripNull(result);
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
  /// All other values, including [null], will result in [null].
  static String encodeMainAxisAlignment(MainAxisAlignment value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `max`
  ///  * `min`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeMainAxisSize(MainAxisSize value) {
    String result;
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

    return result;
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": <Color>,
  ///   "contentTextStyle": <TextStyle>,
  ///   "leadingPadding": <EdgeInsetsGeometry>,
  ///   "padding": <EdgeInsetsGeometry>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeTextStyle]
  static Map<String, dynamic> encodeMaterialBannerThemeData(
    MaterialBannerThemeData value,
  ) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'backgroundColor': encodeColor(value.backgroundColor),
        'contentTextStyle': encodeTextStyle(value.contentTextStyle),
        'leadingPadding': encodeEdgeInsetsGeometry(value.leadingPadding),
        'padding': encodeEdgeInsetsGeometry(value.padding),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "primary": <Color>,
  ///   "swatches": <Map<String, Color>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  static Map<String, dynamic> encodeMaterialColor(MaterialColor value) {
    Map<String, dynamic> result;

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

    return _stripNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `padded`
  ///  * `shrinkWrap`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeMaterialTapTargetSize(MaterialTapTargetSize value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `button`
  ///  * `canvas`
  ///  * `card`
  ///  * `circle`
  ///  * `transparency`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeMaterialType(MaterialType value) {
    String result;

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

    return result;
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
  static List<double> encodeMatrix4(Matrix4 value) {
    List<double> result;

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

    return result;
  }

  /// Encodes the given [value] to a JSON representation.  There will be a
  /// "type" attribute that is one of:
  ///  * `defer`
  ///  * `system`
  ///  * `uncontrolled`
  ///
  /// When the `type` is `system`, this will create a `cursor` that is one of:
  ///  * `basic`
  ///  * `click`
  ///  * `forbidden`
  ///  * `grab`
  ///  * `grabbing`
  ///  * `none`
  ///  * `text`
  static Map<String, dynamic> encodeMouseCursor(MouseCursor value) {
    Map<String, dynamic> result;

    if (value != null) {
      if (value == MouseCursor.defer) {
        result = {
          'type': 'defer',
        };
      } else if (value == MouseCursor.uncontrolled) {
        result = {
          'type': 'uncontrolled',
        };
      } else if (MaterialStateMouseCursor.clickable == value) {
        result = {
          'cursor': 'clickable',
          'type': 'material',
        };
      } else if (MaterialStateMouseCursor.textable == value) {
        result = {
          'cursor': 'textable',
          'type': 'material',
        };
      } else if (SystemMouseCursors.basic == value) {
        result = {
          'cursor': 'basic',
          'type': 'system',
        };
      } else if (SystemMouseCursors.click == value) {
        result = {
          'cursor': 'click',
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
      } else if (SystemMouseCursors.none == value) {
        result = {
          'cursor': 'none',
          'type': 'system',
        };
      } else if (SystemMouseCursors.text == value) {
        result = {
          'cursor': 'text',
          'type': 'system',
        };
      }
    }

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `all`
  ///  * `none`
  ///  * `selected`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeNavigationRailLabelType(NavigationRailLabelType value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": <Color>,
  ///   "elevation": <double>,
  ///   "groupAlignment": <double>,
  ///   "labelType": <NavigationRailLabelType>,
  ///   "selectedIconTheme": <IconThemeData>,
  ///   "selectedLabelTextStyle": <TextStyle>,
  ///   "unselectedIconTheme": <IconThemeData>,
  ///   "unselectedLabelTextStyle": <TextStyle>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeIconThemeData]
  ///  * [encodeNavigationRailLabelType]
  ///  * [encodeTextStyle]
  static Map<String, dynamic> encodeNavigationRailThemeData(
    NavigationRailThemeData value,
  ) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'backgroundColor': encodeColor(value.backgroundColor),
        'elevation': value.elevation,
        'groupAlignment': value.groupAlignment,
        'labelType': encodeNavigationRailLabelType(value.labelType),
        'selectedIconTheme': encodeIconThemeData(value.selectedIconTheme),
        'selectedLabelTextStyle': encodeTextStyle(
          value.selectedLabelTextStyle,
        ),
        'unselectedIconTheme': encodeIconThemeData(value.unselectedIconTheme),
        'unselectedLabelTextStyle': encodeTextStyle(
          value.unselectedLabelTextStyle,
        ),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `circular`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeNotchedShape(NotchedShape value) {
    assert(value == null || value is CircularNotchedRectangle);
    String result;

    if (value != null) {
      result = 'circular';
    }

    return result;
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "dx": <double>,
  ///   "dy": <double>
  /// }
  /// ```
  static Map<String, dynamic> encodeOffset(Offset value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'dx': value.dx,
        'dy': value.dy,
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to a JSON compatible Map.  The value structure
  /// returned the type of the [OutlinedBorder] passed in.
  ///
  /// `BeveledRectangleBorder`
  /// ```json
  /// {
  ///   "borderRadius": <BorderRadius>,
  ///   "side": <BorderSide>,
  ///   "type": "beveled"
  /// }
  /// ```
  ///
  /// `CircleBorder`
  /// ```json
  /// {
  ///   "side": <BorderSide>,
  ///   "type": "circle"
  /// }
  /// ```
  ///
  /// `ContinuousRectangleBorder`
  /// ```json
  /// {
  ///   "borderRadius": <BorderRadius>,
  ///   "side": <BorderSide>,
  ///   "type": "rectangle"
  /// }
  /// ```
  ///
  /// `RoundedRectangleBorder`
  /// ```json
  /// {
  ///   "borderRadius": <BorderRadius>,
  ///   "side": <BorderSide>,
  ///   "type": "rounded"
  /// }
  /// ```
  ///
  /// `StadiumBorder`
  /// ```json
  /// {
  ///   "side": <BorderSide>,
  ///   "type": "stadium"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBorderRadius]
  ///  * [encodeBorderSide]
  static Map<String, dynamic> encodeOutlinedBorder(ShapeBorder value) {
    assert(value == null ||
        value is BeveledRectangleBorder ||
        value is CircleBorder ||
        value is ContinuousRectangleBorder ||
        value is RoundedRectangleBorder ||
        value is StadiumBorder);
    Map<String, dynamic> result;

    if (value != null) {
      if (value is BeveledRectangleBorder) {
        result = <String, dynamic>{
          'borderRadius': encodeBorderRadius(value.borderRadius),
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
          'borderRadius': encodeBorderRadius(value.borderRadius),
          'side': encodeBorderSide(value.side),
          'type': 'rectangle',
        };
      } else if (value is RoundedRectangleBorder) {
        result = <String, dynamic>{
          'borderRadius': encodeBorderRadius(value.borderRadius),
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

    return _stripNull(result);
  }

  /// Encodes the [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "color": <Color>,
  ///   "elevation": <double>,
  ///   "shape": <ShapeBorder>,
  ///   "textStyle": <TextStyle>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeShapeBorder]
  ///  * [encodeTextStyle]
  static Map<String, dynamic> encodePopupMenuThemeData(
    PopupMenuThemeData value,
  ) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'color': encodeColor(value.color),
        'elevation': value.elevation,
        'shape': encodeShapeBorder(value.shape),
        'textStyle': encodeTextStyle(value.textStyle),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to a JSON compatible map.
  ///
  /// ```json
  /// {
  ///  "type": "elliptical",
  ///   "x": <double>,
  ///   "y": <double>
  /// }
  /// ```
  static Map<String, dynamic> encodeRadius(Radius value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'type': 'elliptical',
        'x': value.x,
        'y': value.y,
      };
    }

    return _stripNull(result);
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
  ///   "disabledThumbRadius": <double>,
  ///   "elevation": <double>,
  ///   "enabledThumbRadius": <double>,
  ///   "pressedElevation": <double>,
  ///   "type": "round"
  /// }
  /// ```
  static Map<String, dynamic> encodeRangeSliderThumbShape(
    RoundRangeSliderThumbShape value,
  ) {
    assert(value == null || value is RoundRangeSliderThumbShape);
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'disabledThumbRadius': value.disabledThumbRadius,
        'elevation': value.elevation,
        'enabledThumbRadius': value.enabledThumbRadius,
        'pressedElevation': value.pressedElevation,
        'type': 'round',
      };
    }

    return _stripNull(result);
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
  ///   "tickMarkRadius": <double>,
  ///   "type": "round"
  /// }
  /// ```
  static Map<String, dynamic> encodeRangeSliderTickMarkShape(
    RangeSliderTickMarkShape value,
  ) {
    assert(value == null || value is RoundRangeSliderTickMarkShape);
    Map<String, dynamic> result;

    if (value != null) {
      RoundRangeSliderTickMarkShape shape = value;
      result = <String, dynamic>{
        'tickMarkRadius': shape.tickMarkRadius,
        'type': 'round',
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `rectangular`
  ///  * `rounded`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeRangeSliderTrackShape(RangeSliderTrackShape value) {
    assert(value == null ||
        value is RectangularRangeSliderTrackShape ||
        value is RoundedRectRangeSliderTrackShape);
    String result;

    if (value != null) {
      if (value is RectangularRangeSliderTrackShape) {
        result = 'rectangular';
      } else if (value is RoundedRectRangeSliderTrackShape) {
        result = 'rounded';
      }
    }

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `paddle`
  ///  * `rectangular`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeRangeSliderValueIndicatorShape(
    RangeSliderValueIndicatorShape value,
  ) {
    assert(value == null ||
        value is PaddleRangeSliderValueIndicatorShape ||
        value is RectangularRangeSliderValueIndicatorShape);
    String result;

    if (value != null) {
      if (value is PaddleRangeSliderValueIndicatorShape) {
        result = 'paddle';
      } else if (value is RectangularRangeSliderValueIndicatorShape) {
        result = 'rectangular';
      }
    }

    return result;
  }

  /// Encodes the given [value] to a JSON compatible Map.
  ///
  /// This returns the JSON representation to follow the structure:
  /// ```json
  /// {
  ///   "bottom": <double>,
  ///   "left": <double>,
  ///   "right": <double>,
  ///   "top": <double>,
  ///   "type": "ltrb"
  /// }
  /// ```
  static Map<String, dynamic> encodeRect(Rect value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = {
        'bottom': value.bottom,
        'left': value.left,
        'right': value.right,
        'top': value.top,
        'type': 'ltrb',
      };
    }

    return result;
  }

  /// Encodes the given [value] to a JSON compatible Map.
  ///
  /// This returns the JSON representation to follow the structure:
  /// ```json
  /// {
  ///   "parent": <ScrollPhysics>,
  ///   "type": <String>
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
  static Map<String, dynamic> encodeScrollPhysics(ScrollPhysics value) {
    assert(value == null ||
        value is AlwaysScrollableScrollPhysics ||
        value is BouncingScrollPhysics ||
        value is ClampingScrollPhysics ||
        value is FixedExtentScrollPhysics ||
        value is NeverScrollableScrollPhysics ||
        value is PageScrollPhysics ||
        value is RangeMaintainingScrollPhysics);
    Map<String, dynamic> result;

    if (value != null) {
      String type;

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

    return result;
  }

  /// Encodes the [value] to a String.  Supported values are:
  ///  * `manual`
  ///  * `onDrag`
  static String encodeScrollViewKeyboardDismissBehavior(
      ScrollViewKeyboardDismissBehavior value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to a JSON compatible Map.
  ///
  /// ```json
  /// {
  ///   "blurRadius": <double>,
  ///   "color": <Color>,
  ///   "offset": <Offset>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeOffset]
  static Map<String, dynamic> encodeShadow(Shadow value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'blurRadius': value.blurRadius,
        'color': encodeColor(value.color),
        'offset': encodeOffset(value.offset),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to a JSON compatible Map.  The value structure
  /// returned the type of the [ShapeBorder] passed in.
  ///
  /// `CircleBorder`
  /// ```json
  /// {
  ///   "side": <BorderSide>,
  ///   "type": "circle"
  /// }
  /// ```
  ///
  /// `ContinuousRectangleBorder`
  /// ```json
  /// {
  ///   "borderRadius": <BorderRadius>,
  ///   "side": <BorderSide>,
  ///   "type": "rectangle"
  /// }
  /// ```
  ///
  /// `RoundedRectangleBorder`
  /// ```json
  /// {
  ///   "borderRadius": <BorderRadius>,
  ///   "side": <BorderSide>,
  ///   "type": "rounded"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBorderRadius]
  ///  * [encodeBorderSide]
  static Map<String, dynamic> encodeShapeBorder(ShapeBorder value) {
    assert(value == null ||
        value is CircleBorder ||
        value is ContinuousRectangleBorder ||
        value is RoundedRectangleBorder);
    Map<String, dynamic> result;

    if (value != null) {
      if (value is CircleBorder) {
        result = <String, dynamic>{
          'side': encodeBorderSide(value.side),
          'type': 'circle',
        };
      } else if (value is ContinuousRectangleBorder) {
        result = <String, dynamic>{
          'borderRadius': encodeBorderRadius(value.borderRadius),
          'side': encodeBorderSide(value.side),
          'type': 'rectangle',
        };
      } else if (value is RoundedRectangleBorder) {
        result = <String, dynamic>{
          'borderRadius': encodeBorderRadius(value.borderRadius),
          'side': encodeBorderSide(value.side),
          'type': 'rounded',
        };
      }
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `always`
  ///  * `never`
  ///  * `onlyForContinuous`
  ///  * `onlyForDiscrete`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeShowValueIndicator(ShowValueIndicator value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to a JSON compatible Map.
  ///
  /// This returns the JSON representation to follow the structure:
  /// ```json
  /// {
  ///   "height": <double>,
  ///   "width": <double>
  /// }
  /// ```
  static Map<String, dynamic> encodeSize(Size value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = {
        'height': value.height,
        'width': value.width,
      };
    }

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `noOverlay`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeSliderComponentShape(
    SliderComponentShape value,
  ) {
    String result;

    if (value != null) {
      // This one's a bit strange because both noOverlay and noThumb actually
      // point to the exact same no-op class, so there's no way to tell them
      // apart.  Might as well just pick the one that comes first
      // alphabetically.
      if (value.runtimeType == SliderComponentShape.noOverlay.runtimeType) {
        result = 'noOverlay';
      }
    }

    return result;
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "activeTickMarkColor": <Color>,
  ///   "activeTrackColor": <Color>,
  ///   "disabledActiveTickMarkColor": <Color>,
  ///   "disabledActiveTrackColor": <Color>,
  ///   "disabledInactiveTickMarkColor": <Color>,
  ///   "disabledInactiveTrackColor": <Color>,
  ///   "disabledThumbColor": <Color>,
  ///   "inactiveTickMarkColor": <Color>,
  ///   "inactiveTrackColor": <Color>,
  ///   "minThumbSeparation": <double>,
  ///   "overlappingShapeStrokeColor": <Color>,
  ///   "overlayColor": <Color>,
  ///   "overlayShape": <SliderComponentShape>,
  ///   "rangeThumbShape": <RangeSliderThumbShape>,
  ///   "rangeTickMarkShape": <RangeSliderTickMarkShape>,
  ///   "rangeTrackShape": <RangeSliderTrackShape>,
  ///   "rangeValueIndicatorShape": <RangeSliderValueIndicatorShape>,
  ///   "showValueIndicator": <ShowValueIndicator>,
  ///   "thumbColor": <Color>,
  ///   "thumbShape": <SliderComponentShape>,
  ///   "tickMarkShape": <SliderTickMarkShape>,
  ///   "trackHeight": <double>,
  ///   "trackShape": <SliderTrackShape>,
  ///   "valueIndicatorColor": <Color>,
  ///   "valueIndicatorShape": <SliderComponentShape>,
  ///   "valueIndicatorTextStyle": <TextStyle>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeShowValueIndicator]
  ///  * [encodeSliderComponentShape]
  ///  * [encodeSliderTickMarkShape]
  ///  * [encodeRangeSliderThumbShape]
  ///  * [encodeRangeSliderTickMarkShape]
  ///  * [encodeRangeSliderTrackShape]
  ///  * [encodeRangeSliderValueIndicatorShape]
  static Map<String, dynamic> encodeSliderThemeData(SliderThemeData value) {
    Map<String, dynamic> result;

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
        'disabledInactiveTrackColor':
            encodeColor(value.disabledInactiveTrackColor),
        'disabledThumbColor': encodeColor(value.disabledThumbColor),
        'inactiveTickMarkColor': encodeColor(value.inactiveTickMarkColor),
        'inactiveTrackColor': encodeColor(value.inactiveTrackColor),
        'minThumbSeparation': (value.minThumbSeparation),
        'overlappingShapeStrokeColor': encodeColor(
          value.overlappingShapeStrokeColor,
        ),
        'overlayColor': encodeColor(value.overlayColor),
        'overlayShape': encodeSliderComponentShape(value.overlayShape),
        'rangeThumbShape': encodeRangeSliderThumbShape(value.rangeThumbShape),
        'rangeTickMarkShape': encodeRangeSliderTickMarkShape(
          value.rangeTickMarkShape,
        ),
        'rangeTrackShape': encodeRangeSliderTrackShape(value.rangeTrackShape),
        'rangeValueIndicatorShape': encodeRangeSliderValueIndicatorShape(
          value.rangeValueIndicatorShape,
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

    return _stripNull(result);
  }

  /// Encodes the [SliderTickMarkShape] to a [String].  Supported values are:
  ///  * `noTickMark`
  static String encodeSliderTickMarkShape(
    SliderTickMarkShape value, {
    bool validate = true,
  }) {
    String result;

    if (value == SliderTickMarkShape.noTickMark) {
      result = 'noTickMark';
    }

    return result;
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
  ///   "disabledThumbGapWidth": <double>,
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
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeShowValueIndicator]
  ///  * [encodeSliderComponentShape]
  ///  * [encodeRangeSliderThumbShape]
  ///  * [encodeRangeSliderTickMarkShape]
  ///  * [encodeRangeSliderTrackShape]
  ///  * [encodeRangeSliderValueIndicatorShape]
  static Map<String, dynamic> encodeSliderTrackShape(SliderTrackShape value) {
    assert(value == null ||
        value is RectangularSliderTrackShape ||
        value is RoundedRectSliderTrackShape);
    Map<String, dynamic> result;

    if (value != null) {
      if (value is RectangularSliderTrackShape) {
        result = <String, dynamic>{
          'disabledThumbGapWidth': value.disabledThumbGapWidth,
          'type': 'rectangular',
        };
      } else if (value is RoundedRectSliderTrackShape) {
        result = <String, dynamic>{
          'type': 'rounded',
        };
      }
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `disabled`
  ///  * `enabled`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeSmartDashesType(SmartDashesType value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `disabled`
  ///  * `enabled`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeSmartQuotesType(SmartQuotesType value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `fixed`
  ///  * `floating`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeSnackBarBehavior(SnackBarBehavior value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to the JSON representation.
  ///
  /// ```json
  /// {
  ///   "actionTextColor": <Color>,
  ///   "backgroundColor": <Color>,
  ///   "behavior": <SnackBarBehavior>,
  ///   "contentTextStyle": <TextStyle>,
  ///   "disabledActionTextColor": <Color>,
  ///   "elevation": <double>,
  ///   "shape": <ShapeBorder>,
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeSnackBarBehavior]
  ///  * [encodeShapeBorder]
  ///  * [encodeTextStyle]
  static Map<String, dynamic> encodeSnackBarThemeData(SnackBarThemeData value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'actionTextColor': encodeColor(value.actionTextColor),
        'backgroundColor': encodeColor(value.backgroundColor),
        'behavior': encodeSnackBarBehavior(value.behavior),
        'contentTextStyle': encodeTextStyle(value.contentTextStyle),
        'disabledActionTextColor': encodeColor(value.disabledActionTextColor),
        'elevation': value.elevation,
        'shape': encodeShapeBorder(value.shape),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `expand`
  ///  * `loose`
  ///  * `passthrough`
  static String encodeStackFit(StackFit value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to the JSON representation.
  ///
  /// ```json
  /// {
  ///   "fontFamily": <String>,
  ///   "fontFamilyFallback": <String[]>,
  ///   "fontSize": <double>,
  ///   "fontStyle": <FontStyle>,
  ///   "fontWeight": <FontWeight>
  ///   "forceStrutHeight": <bool>,
  ///   "height": <double>,
  ///   "leading": <double>,
  ///   "package": <String>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeFontStyle]
  ///  * [encodeFontWeight]
  static Map<String, dynamic> encodeStrutStyle(StrutStyle value) {
    Map<String, dynamic> result;

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
      };
    }

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `label`
  ///  * `tab`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeTabBarIndicatorSize(TabBarIndicatorSize value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to the JSON representation.
  ///
  /// ```json
  /// {
  ///   "indicatorSize": <TabBarIndicatorSize>,
  ///   "labelPadding": <EdgeInsetsGeometry>,
  ///   "labelColor": <Color>,
  ///   "labelStyle": <TextStyle>,
  ///   "unselectedLabelColor": <Color>,
  ///   "unselectedLabelStyle": <TextStyle>,
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeTabBarIndicatorSize]
  ///  * [encodeTextStyle]
  static Map<String, dynamic> encodeTabBarTheme(TabBarTheme value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'indicatorSize': encodeTabBarIndicatorSize(value.indicatorSize),
        'labelPadding': encodeEdgeInsetsGeometry(value.labelPadding),
        'labelColor': encodeColor(value.labelColor),
        'labelStyle': encodeTextStyle(value.labelStyle),
        'unselectedLabelColor': encodeColor(value.unselectedLabelColor),
        'unselectedLabelStyle': encodeTextStyle(value.unselectedLabelStyle),
      };
    }

    return _stripNull(result);
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
  /// All other values, including [null], will result in [null].
  static String encodeTargetPlatform(TargetPlatform value) {
    String result;

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

    return result;
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
  /// All other values, including [null], will result in [null].
  static String encodeTextAlign(TextAlign value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `bottom`
  ///  * `center`
  ///  * `top`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeTextAlignVertical(TextAlignVertical value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `alphabetic`
  ///  * `ideographic`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeTextBaseline(TextBaseline value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `characters`
  ///  * `none`
  ///  * `sentences`
  ///  * `words`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeTextCapitalization(TextCapitalization value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `lineThrough`
  ///  * `none`
  ///  * `overline`
  ///  * `underline`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeTextDecoration(TextDecoration value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `dashed`
  ///  * `dotted`
  ///  * `double`
  ///  * `solid`
  ///  * `wavy`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeTextDecorationStyle(TextDecorationStyle value) {
    String result;

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

    return result;
  }

  /// Encodes the [value] into a String representation.  Supported values are:
  ///  * `ltr`
  ///  * `rtl`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeTextDirection(TextDirection value) {
    String result;

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

    return result;
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
  /// All other values, including [null], will result in [null].
  static String encodeTextInputAction(TextInputAction value) {
    String result;

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

    return result;
  }

  /// Encodes the [value] into a String representation.  Supported values are:
  ///  * `datetime`
  ///  * `emailAddress`
  ///  * `name`
  ///  * `multiline`
  ///  * `number`
  ///  * `phone`
  ///  * `streetAddress`
  ///  * `text`
  ///  * `url`
  ///  * `visiblePassword`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeTextInputType(TextInputType value) {
    String result;

    if (value != null) {
      if (value.index == TextInputType.datetime.index) {
        result = 'datetime';
      } else if (value.index == TextInputType.emailAddress.index) {
        result = 'emailAddress';
      } else if (value.index == TextInputType.multiline.index) {
        result = 'multiline';
      } else if (value.index == TextInputType.name.index) {
        result = 'name';
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

    return result;
  }

  /// Encodes the given [value] to the JSON representation.
  ///
  /// ```json
  /// {
  ///   "applyHeightToFirstAscent": <bool>,
  ///   "applyHeightToLastDescent": <bool>
  /// }
  /// ```
  static Map<String, dynamic> encodeTextHeightBehavior(
    TextHeightBehavior value,
  ) {
    Map<String, dynamic> result;

    if (value != null) {
      result = {
        'applyHeightToFirstAscent': value.applyHeightToFirstAscent,
        'applyHeightToLastDescent': value.applyHeightToLastDescent,
      };
    }

    return result;
  }

  /// Encodes the [value] into a String representation.  Supported values are:
  ///  * `clip`
  ///  * `ellipsis`
  ///  * `fade`
  ///  * `visible`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeTextOverflow(TextOverflow value) {
    String result;

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

    return result;
  }

  /// Encodes a given [value] into a JSON compatible Map structure.  This will
  /// return the following structure:
  ///
  /// ```json
  ///   "cursorColor": <Color>,
  ///   "selectionColor": <Color>,
  ///   "selectionHandleColor": <Color>
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  static Map<String, dynamic> encodeTextSelectionThemeData(
      TextSelectionThemeData value) {
    Map<String, dynamic> result;

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

    return _stripNull(result);
  }

  /// Encodes a given [value] into a JSON compatible Map structure.  This will
  /// return the following structure:
  ///
  /// ```json
  ///   "backgroundColor": <Color>,
  ///   "color": <Color>,
  ///   "decoration": <TextDecoration>,
  ///   "decorationColor": <Color>,
  ///   "decorationStyle": <TextDecorationStyle>,
  ///   "decorationThickness": <double>,
  ///   "fontFamily": value['fontFamily'],
  ///   "fontFamilyFallback": <String[]>,
  ///   "fontFeatures": <FontFeature[]>,
  ///   "fontWeight": <FontWeight>,
  ///   "fontSize": <double>,
  ///   "fontStyle": <FontStyle>,
  ///   "height": <double>,
  ///   "inherit": <bool>,
  ///   "letterSpacing": <double>,
  ///   "locale": <Locale>,
  ///   "package": <String>,
  ///   "shadows": <Shadow[]>,
  ///   "textBaseline": <TextBaseline>,
  ///   "wordSpacing": <double>
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeFontFeature]
  ///  * [encodeFontStyle]
  ///  * [encodeFontWeight]
  ///  * [encodeLocale]
  ///  * [encodeShadow]
  ///  * [encodeTextbaseline]
  ///  * [encodeTextDecoration]
  ///  * [encodeTextDecorationStyle]
  static Map<String, dynamic> encodeTextStyle(TextStyle value) {
    Map<String, dynamic> result;

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
        'fontFeatures': value.fontFeatures == null
            ? null
            : value.fontFeatures
                .map(
                  (value) => encodeFontFeature(value),
                )
                .toList(),
        'fontWeight': encodeFontWeight(value.fontWeight),
        'fontSize': value.fontSize,
        'fontStyle': encodeFontStyle(value.fontStyle),
        'height': value.height,
        'inherit': value.inherit,
        'letterSpacing': value.letterSpacing,
        'locale': encodeLocale(value.locale),
        'shadows': value.shadows == null
            ? null
            : value.shadows
                .map(
                  (value) => encodeShadow(value),
                )
                .toList(),
        'textBaseline': encodeTextBaseline(value.textBaseline),
        'wordSpacing': value.wordSpacing,
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to a JSON compatible Map.  The returned Map will
  /// have the following structure:
  ///
  /// ```json
  /// {
  ///   "bodyText1": <TextStyle>,
  ///   "bodyText2": <TextStyle>,
  ///   "button": <TextStyle>,
  ///   "caption": <TextStyle>,
  ///   "headline1": <TextStyle>,
  ///   "headline2": <TextStyle>,
  ///   "headline3": <TextStyle>,
  ///   "headline4": <TextStyle>,
  ///   "headline5": <TextStyle>,
  ///   "headline6": <TextStyle>,
  ///   "overline": <TextStyle>,
  ///   "subtitle1": <TextStyle>,
  ///   "subtitle2": <TextStyle>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeTextStyle]
  static Map<String, dynamic> encodeTextTheme(TextTheme value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'bodyText1': encodeTextStyle(value.bodyText1),
        'bodyText2': encodeTextStyle(value.bodyText2),
        'button': encodeTextStyle(value.button),
        'caption': encodeTextStyle(value.caption),
        'headline1': encodeTextStyle(value.headline1),
        'headline2': encodeTextStyle(value.headline2),
        'headline3': encodeTextStyle(value.headline3),
        'headline4': encodeTextStyle(value.headline4),
        'headline5': encodeTextStyle(value.headline5),
        'headline6': encodeTextStyle(value.headline6),
        'overline': encodeTextStyle(value.overline),
        'subtitle1': encodeTextStyle(value.subtitle1),
        'subtitle2': encodeTextStyle(value.subtitle2),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the [value] into a String representation.  Supported values are:
  ///  * `longestLine`
  ///  * `parent`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeTextWidthBasis(TextWidthBasis value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to a JSON compatible Map.  The returned Map will
  /// have the following structure:
  ///
  /// ```json
  /// {
  ///   "accentColor": <Color>,
  ///   "accentColorBrightness": <Brightness>,
  ///   "accentIconTheme": <IconThemeData>,
  ///   "accentTextTheme": <TextTheme>,
  ///   "appBarTheme": <AppBarTheme>,
  ///   "applyElevationOverlayColor": <bool>,
  ///   "bannerTheme": <MaterialBannerThemeData>,
  ///   "backgroundColor": <Color>,
  ///   "bottomAppBarColor": <Color>,
  ///   "bottomAppBarTheme": <BottomAppBarTheme>,
  ///   "brightness": <Brightness>,
  ///   "bottomSheetTheme": <BottomSheetThemeData>,
  ///   "buttonColor": <Color>,
  ///   "buttonBarTheme": <ButtonBarThemeData>,
  ///   "buttonTheme": <ButtonThemeData>,
  ///   "canvasColor": <Color>,
  ///   "cardColor": <Color>,
  ///   "cardTheme": <CardTheme>,
  ///   "chipTheme": <ChipThemeData>,
  ///   "colorScheme": <ColorScheme>,
  ///   "cupertinoOverrideTheme": <CupertinoThemeData>,
  ///   "dialogBackgroundColor": <Color>,
  ///   "dialogTheme": <DialogTheme>,
  ///   "disabledColor": <Color>,
  ///   "dividerColor": <Color>,
  ///   "dividerTheme": <DividerThemeData>,
  ///   "errorColor": <Color>,
  ///   "floatingActionButtonTheme": <FloatingActionButtonThemeData>,
  ///   "focusColor": <Color>,
  ///   "fontFamily": <String>,
  ///   "highlightColor": <Color>,
  ///   "hintColor": <Color>,
  ///   "hoverColor": <Color>,
  ///   "iconTheme": <IconThemeData>,
  ///   "indicatorColor": <Color>,
  ///   "inputDecorationTheme": <InputDecorationTheme>,
  ///   "materialTapTargetSize": <MaterialTapTargetSize>,
  ///   "navigationRailTheme": <NavigationRailThemeData>,
  ///   "platform": <TargetPlatform>,
  ///   "popupMenuTheme": <PopupMenuThemeData>,
  ///   "primaryColor": <Color>,
  ///   "primaryColorBrightness": <Brightness>,
  ///   "primaryColorDark": <Color>,
  ///   "primaryColorLight": <Color>,
  ///   "primaryIconTheme": <IconThemeData>,
  ///   "primarySwatch": <MaterialColor>,
  ///   "primaryTextTheme": <TextTheme>,
  ///   "scaffoldBackgroundColor": <Color>,
  ///   "secondaryHeaderColor": <Color>,
  ///   "selectedRowColor": <Color>,
  ///   "sliderTheme": <SliderThemeData>,
  ///   "snackBarTheme": SnackBarThemeData>,
  ///   "splashColor": <Color>,
  ///   "splashFactory": <InteractiveInkFeatureFactory>,
  ///   "tabBarTheme": <TabBarTheme>,
  ///   "textTheme": <TextTheme>,
  ///   "toggleButtonsTheme": <ToggleButtonsThemeData>,
  ///   "toggleableActiveColor": <Color>,
  ///   "tooltipTheme": <TooltipThemeData>,
  ///   "typography": <Typography>,
  ///   "unselectedWidgetColor": <Color>,
  ///   "visualDensity": <VisualDensity>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeAppBarTheme]
  ///  * [encodeBrightness]
  ///  * [encodeBottomAppBarTheme]
  ///  * [encodeBottomSheetThemeData]
  ///  * [encodeButtonBarThemeData]
  ///  * [encodeButtonThemeData]
  ///  * [encodeCardTheme]
  ///  * [encodeChipThemeData]
  ///  * [encodeColor]
  ///  * [encodeColorScheme]
  ///  * [encodeDialogTheme]
  ///  * [encodeDividerThemeData]
  ///  * [encodeFloatingActionButtonThemeData]
  ///  * [encodeIconThemeData]
  ///  * [encodeInputDecorationTheme]
  ///  * [encodeInteractiveInkFeatureFactory]
  ///  * [encodeMaterialBannerThemeData]
  ///  * [encodeMaterialTapTargetSize]
  ///  * [encodeNavigationRailThemeData]
  ///  * [encodePopupMenuThemeData]
  ///  * [encodeSliderThemeData]
  ///  * [encodeSnackBarThemeData]
  ///  * [encodeTabBarTheme]
  ///  * [encodeTargetPlatform]
  ///  * [encodeTextStyle]
  ///  * [encodeToggleButtonsThemeData]
  ///  * [encodeTypography]
  ///  * [encodeVisualDensity]
  static Map<String, dynamic> encodeThemeData(ThemeData value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'accentColor': encodeColor(value.accentColor),
        'accentColorBrightness': encodeBrightness(value.accentColorBrightness),
        'accentIconTheme': encodeIconThemeData(value.accentIconTheme),
        'accentTextTheme': encodeTextTheme(value.accentTextTheme),
        'appBarTheme': encodeAppBarTheme(value.appBarTheme),
        'applyElevationOverlayColor': value.applyElevationOverlayColor,
        'bannerTheme': encodeMaterialBannerThemeData(value.bannerTheme),
        'backgroundColor': encodeColor(value.backgroundColor),
        'bottomAppBarColor': encodeColor(value.bottomAppBarColor),
        'bottomAppBarTheme': encodeBottomAppBarTheme(value.bottomAppBarTheme),
        'bottomNavigationBarTheme': encodeBottomNavigationBarThemeData(
          value.bottomNavigationBarTheme,
        ),
        'brightness': encodeBrightness(value.brightness),
        'bottomSheetTheme': encodeBottomSheetThemeData(value.bottomSheetTheme),
        'buttonColor': encodeColor(value.buttonColor),
        'buttonBarTheme': encodeButtonBarThemeData(value.buttonBarTheme),
        'buttonTheme': encodeButtonThemeData(value.buttonTheme),
        'canvasColor': encodeColor(value.canvasColor),
        'cardColor': encodeColor(value.cardColor),
        'cardTheme': encodeCardTheme(value.cardTheme),
        'chipTheme': encodeChipThemeData(value.chipTheme),
        'colorScheme': encodeColorScheme(value.colorScheme),
        'cupertinoOverrideTheme': encodeCupertinoThemeData(
          value.cupertinoOverrideTheme,
        ),
        'dialogBackgroundColor': encodeColor(value.dialogBackgroundColor),
        'dialogTheme': encodeDialogTheme(value.dialogTheme),
        'disabledColor': encodeColor(value.disabledColor),
        'dividerColor': encodeColor(value.dividerColor),
        'dividerTheme': encodeDividerThemeData(value.dividerTheme),
        'errorColor': encodeColor(value.errorColor),
        'fixTextFieldOutlineLabel': value.fixTextFieldOutlineLabel,
        'floatingActionButtonTheme': encodeFloatingActionButtonThemeData(
          value.floatingActionButtonTheme,
        ),
        'focusColor': encodeColor(value.focusColor),
        'highlightColor': encodeColor(value.highlightColor),
        'hintColor': encodeColor(value.hintColor),
        'hoverColor': encodeColor(value.hoverColor),
        'iconTheme': encodeIconThemeData(value.iconTheme),
        'indicatorColor': encodeColor(value.indicatorColor),
        'inputDecorationTheme': encodeInputDecorationTheme(
          value.inputDecorationTheme,
        ),
        'materialTapTargetSize': encodeMaterialTapTargetSize(
          value.materialTapTargetSize,
        ),
        'navigationRailTheme': encodeNavigationRailThemeData(
          value.navigationRailTheme,
        ),
        'platform': encodeTargetPlatform(value.platform),
        'popupMenuTheme': encodePopupMenuThemeData(value.popupMenuTheme),
        'primaryColor': encodeColor(value.primaryColor),
        'primaryColorBrightness': encodeBrightness(
          value.primaryColorBrightness,
        ),
        'primaryColorDark': encodeColor(value.primaryColorDark),
        'primaryColorLight': encodeColor(value.primaryColorLight),
        'primaryIconTheme': encodeIconThemeData(value.primaryIconTheme),
        'primaryTextTheme': encodeTextTheme(value.primaryTextTheme),
        'scaffoldBackgroundColor': encodeColor(value.scaffoldBackgroundColor),
        'secondaryHeaderColor': encodeColor(value.secondaryHeaderColor),
        'selectedRowColor': encodeColor(value.selectedRowColor),
        'sliderTheme': encodeSliderThemeData(value.sliderTheme),
        'snackBarTheme': encodeSnackBarThemeData(value.snackBarTheme),
        'splashColor': encodeColor(value.splashColor),
        'splashFactory':
            encodeInteractiveInkFeatureFactory(value.splashFactory),
        'tabBarTheme': encodeTabBarTheme(value.tabBarTheme),
        'textTheme': encodeTextTheme(value.textTheme),
        'toggleButtonsTheme': encodeToggleButtonsThemeData(
          value.toggleButtonsTheme,
        ),
        'toggleableActiveColor': encodeColor(value.toggleableActiveColor),
        'tooltipTheme': encodeTooltipThemeData(value.tooltipTheme),
        'typography': encodeTypography(value.typography),
        'unselectedWidgetColor': encodeColor(value.unselectedWidgetColor),
        'visualDensity': encodeVisualDensity(value.visualDensity),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the [value] to a [TileMode].  Supported values are:
  ///  * `clamp`
  ///  * `mirror`
  ///  * `repeated`
  static String encodeTileMode(TileMode value) {
    String result;

    if (value != null) {
      switch (value) {
        case TileMode.clamp:
          result = 'clamp';
          break;

        case TileMode.mirror:
          result = 'mirror';
          break;

        case TileMode.repeated:
          result = 'repeated';
          break;
      }
    }

    return result;
  }

  /// encodes the given [value] to a [TimePickerThemeData].  This expects the
  /// [value] to have the following structure:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": <Color>,
  ///   "dayPeriodBorderSide": <BorderSide>,
  ///   "dayPeriodColor": <Color>,
  ///   "dayPeriodShape": <ShapeBorder>,
  ///   "dayPeriodTextColor": <Color>,
  ///   "dayPeriodTextStyle": <TextStyle>,
  ///   "dialBackgroundColor": <Color>,
  ///   "dialHandColor": <Color>,
  ///   "dialTextColor": <Color>,
  ///   "entryModeIconColor": <Color>,
  ///   "helpTextStyle": <TextStyle>,
  ///   "hourMinuteColor": <Color>,
  ///   "hourMinuteShape": <ShapeBorder>,
  ///   "hourMinuteTextColor": <Color>,
  ///   "hourMinuteTextStyle": <TextStyle>,
  ///   "inputDecorationTheme": <InputDecorationTheme>,
  ///   "shape": <ShapeBorder>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBorderSide]
  ///  * [encodeColor]
  ///  * [encodeInputDecorationTheme]
  ///  * [encodeShapeBorder]
  ///  * [encodeTextStyle]
  static Map<String, dynamic> encodeTimePickerThemeData(
    TimePickerThemeData value,
  ) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'backgroundColor': encodeColor(value.backgroundColor),
        'dayPeriodBorderSide': encodeBorderSide(value.dayPeriodBorderSide),
        'dayPeriodColor': encodeColor(value.dayPeriodColor),
        'dayPeriodShape': encodeShapeBorder(value.dayPeriodShape),
        'dayPeriodTextColor': encodeColor(value.dayPeriodTextColor),
        'dayPeriodTextStyle': encodeTextStyle(value.dayPeriodTextStyle),
        'dialBackgroundColor': encodeColor(value.dialBackgroundColor),
        'dialHandColor': encodeColor(value.dialHandColor),
        'dialTextColor': encodeColor(value.dialTextColor),
        'entryModeIconColor': encodeColor(value.entryModeIconColor),
        'helpTextStyle': encodeTextStyle(value.helpTextStyle),
        'hourMinuteColor': encodeColor(value.hourMinuteColor),
        'hourMinuteShape': encodeShapeBorder(value.hourMinuteShape),
        'hourMinuteTextColor': encodeColor(value.hourMinuteTextColor),
        'hourMinuteTextStyle': encodeTextStyle(value.hourMinuteTextStyle),
        'inputDecorationTheme':
            encodeInputDecorationTheme(value.inputDecorationTheme),
        'shape': encodeShapeBorder(value.shape),
      };
    }

    return result;
  }

  /// Encodes the given [value] to a JSON compatible Map.  The returned returned
  /// value will have the following structure.
  ///
  /// ```json
  /// {
  ///   "borderColor": <Color>,
  ///   "borderRadius": <BorderRadius>,
  ///   "borderWidth": <double>,
  ///   "color": <Color>,
  ///   "constraints": <BoxConstraints>,
  ///   "disabledBorderColor": <Color>,
  ///   "disabledColor": <Color>,
  ///   "fillColor": <Color>,
  ///   "focusColor": <Color>,
  ///   "highlightColor": <Color>,
  ///   "hoverColor": <Color>,
  ///   "selectedBorderColor": <Color>,
  ///   "selectedColor": <Color>,
  ///   "splashColor": <Color>,
  ///   "textStyle": <TextStyle>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBorderRadius]
  ///  * [encodeBoxConstraints]
  ///  * [encodeColor]
  ///  * [encodeTextStyle]
  static Map<String, dynamic> encodeToggleButtonsThemeData(
    ToggleButtonsThemeData value,
  ) {
    Map<String, dynamic> result;

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

    return _stripNull(result);
  }

  /// Encodes the given [value] to a JSON compatible Map.  The returned returned
  /// value will have the following structure.
  ///
  /// ```json
  /// {
  ///   "copy": <bool>,
  ///   "cut": <bool>,
  ///   "paste": <bool>,
  ///   "selectAll": <bool>
  /// }
  /// ```
  static Map<String, dynamic> encodeToolbarOptions(ToolbarOptions value) {
    Map<String, dynamic> result;
    if (value != null) {
      result = {
        'copy': value.copy,
        'cut': value.cut,
        'paste': value.paste,
        'selectAll': value.selectAll,
      };
    }

    return result;
  }

  /// Encodes the given [value] to a JSON compatible Map.  The returned returned
  /// value will have the following structure.
  ///
  /// ```json
  /// {
  ///   "excludeFromSemantics": <bool>,
  ///   "height": <double>,
  ///   "margin": <EdgeInsetsGeometry>,
  ///   "padding": <EdgeInsetsGeometry>,
  ///   "preferBelow": <bool>
  ///   "showDuration": <int; millis>,
  ///   "textStyle": <TextStyle>,
  ///   "verticalOffset": <double>,
  ///   "waitDuration": <int; millis>,
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeTextStyle]
  static Map<String, dynamic> encodeTooltipThemeData(TooltipThemeData value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'excludeFromSemantics': value.excludeFromSemantics,
        'height': value.height,
        'margin': encodeEdgeInsetsGeometry(value.margin),
        'padding': encodeEdgeInsetsGeometry(value.padding),
        'preferBelow': value.preferBelow,
        'showDuration': value.showDuration?.inMilliseconds,
        'textStyle': encodeTextStyle(value.textStyle),
        'verticalOffset': value.verticalOffset,
        'waitDuration': value.waitDuration?.inMilliseconds,
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to a JSON compatible Map.  The returned returned
  /// value will have the following structure.
  ///
  /// ```json
  /// {
  ///   "black": <TextTheme>,
  ///   "dense": <TextTheme>,
  ///   "englishLike": <TextTheme>,
  ///   "platform": <TargetPlatform>,
  ///   "tall": <TextTheme>,
  ///   "white": <TextTheme>,
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeTargetPlatform]
  ///  * [encodeTextTheme]
  static Map<String, dynamic> encodeTypography(Typography value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'black': encodeTextTheme(value.black),
        'dense': encodeTextTheme(value.dense),
        'englishLike': encodeTextTheme(value.englishLike),
        'tall': encodeTextTheme(value.tall),
        'white': encodeTextTheme(value.white),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `down`
  ///  * `up`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeVerticalDirection(VerticalDirection value) {
    String result;

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

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `comfortable`
  ///  * `compact`
  ///  * `standard`
  ///
  /// All other values, including [null], will result in [null].
  static String encodeVisualDensity(VisualDensity value) {
    String result;

    if (value != null) {
      if (value == VisualDensity.comfortable) {
        result = 'comfortable';
      } else if (value == VisualDensity.compact) {
        result = 'compact';
      } else if (value == VisualDensity.standard) {
        result = 'standard';
      }
    }

    return result;
  }

  static Map<String, dynamic> _stripNull(Map<String, dynamic> input) {
    Map<String, dynamic> result;

    if (input != null) {
      result ??= <String, dynamic>{};

      for (var entry in input.entries) {
        if (entry.value != null) {
          if (entry.value is Map) {
            var processed = _stripNull(entry.value);
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

  static List<T> _encodeList<T>(
    Iterable<dynamic> list,
    T Function(dynamic value) encoder,
  ) {
    List<T> result;

    if (list != null) {
      result = [];
      for (var value in list) {
        result.add(encoder(value));
      }
    }

    return result;
  }

  static T _resolveMaterialStateProperty<T>(MaterialStateProperty<T> value) {
    T result;
    if (value != null) {
      result = value.resolve({});
    }
    return result;
  }
}
