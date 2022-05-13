import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';

/// Encoder capable of converting Flutter Theme related classes and enums into
/// JSON compatible values.
///
/// Unless otherwise stated, each function will return `null` when given an
/// input of `null`.
@immutable
class ThemeEncoder {
  ThemeEncoder._();

  /// Encodes the given [value] to either a String representation of the
  /// [Alignment] or a JSON map that follows the structure:
  ///
  /// ```json
  /// {
  ///   "x": <double>,
  ///   "y": <double>
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

    return result;
  }

  /// Encodes the given [value] to a [String].  Supported values are:
  /// * `glow`
  /// * `stretch`
  static String? encodeAndroidOverscrollIndicator(
      AndroidOverscrollIndicator? value) {
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

    return result;
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "actionsIconTheme": <IconThemeData>,
  ///   "backgroundColor": <Color>,
  ///   "centerTitle": <bool>,
  ///   "elevation": <double>,
  ///   "foregroundColor": <Color>,
  ///   "iconTheme": <IconThemeData>,
  ///   "shadowColor": <Color>,
  ///   "systemOverlayStyle": <SystemUiOverlayStyle>,
  ///   "titleSpacing": <double>,
  ///   "titleTextStyle": <TextStyle>,
  ///   "toolbarHeight": <double>,
  ///   "toolbarTextStyle": <TextStyle>
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
        'shadowColor': encodeColor(value.shadowColor),
        'systemOverlayStyle':
            encodeSystemUiOverlayStyle(value.systemOverlayStyle),
        'titleSpacing': value.titleSpacing,
        'titleTextStyle': encodeTextStyle(value.titleTextStyle),
        'toolbarHeight': value.toolbarHeight,
        'toolbarTextStyle': encodeTextStyle(value.toolbarTextStyle),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to a [String].  Supported values are:
  /// * `always`
  /// * `disabled`
  /// * `onUserInteraction`
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
      }
    }

    return result;
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

    return result;
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
  static Map<String, dynamic>? encodeBorderSide(BorderSide? value) {
    Map<String, dynamic>? result;

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
  static Map<String, dynamic>? encodeBottomAppBarTheme(
      BottomAppBarTheme? value) {
    Map<String, dynamic>? result;

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
  ///   "landscapeLayout": <BottomNavigationBarLandscapeLayout>,
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

    return _stripNull(result);
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

    return result;
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

    return result;
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": <Color>,
  ///   "clipBehavior": <Clip>,
  ///   "constraints": <BoxConstraints>,
  ///   "elevation": <double>,
  ///   "modalBackgroundColor": <Color>,
  ///   "modalElevation": <double>,
  ///   "shape": <ShapeBorder>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBoxConstraints]
  ///  * [encodeClip]
  ///  * [encodeColor]
  ///  * [encodeShapeBorder]
  static Map<String, dynamic>? encodeBottomSheetThemeData(
    BottomSheetThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'backgroundColor': encodeColor(value.backgroundColor),
        'clipBehavior': encodeClip(value.clipBehavior),
        'constraints': encodeBoxConstraints(value.constraints),
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

    return _stripNull(result);
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

    return _stripNull(result);
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

    return result;
  }

  /// Encodes the given [value] into a JSON compatible map.  This produces a Map
  /// in the following format:
  ///
  /// ```json
  /// {
  ///   "blurRadius": <double>,
  ///   "blurStyle": <BlurStyle>,
  ///   "color": <Color>,
  ///   "offset": <Offset>,
  ///   "spreadRadius": <double>
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

    return _stripNull(result);
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

    return result;
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

    return _stripNull(result);
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "alignment": <AlignmentGeometry>,
  ///   "animationDuration": <MaterialStateProperty<double>>,
  ///   "backgroundColor": <MaterialStateProperty<Color>>,
  ///   "elevation": <MaterialStateProperty<double>>,
  ///   "enableFeedback": <bool>,
  ///   "fixedSize": <MaterialStateProperty<double>>,
  ///   "foregroundColor": <MaterialStateProperty<Color>>,
  ///   "maximumSize": <MaterialStateProperty<double>>,
  ///   "minimumSize": <MaterialStateProperty<Size>>,
  ///   "mouseCursor": <MaterialStateProperty<MouseCursor>>,
  ///   "overlayColor": <MaterialStateProperty<Color>>,
  ///   "padding": <MaterialStateProperty<EdgeInsetsGeometry>>,
  ///   "shadowColor": <MaterialStateProperty<Color>>,
  ///   "shape": <MaterialStateProperty<OutlinedBorder>>,
  ///   "side": <MaterialStateProperty<BorderSide>>,
  ///   "tapTargetSize": <MaterialTapTargetSize>,
  ///   "textStyle": <MaterialStateProperty<TextStyle>>,
  ///   "visualDensity": <VisualDensity>
  /// }
  /// ```
  ///
  /// This won't maintain the [MaterialStateProperty] of each corresponding
  /// property, instead will resolve them by using an empty set of states,
  /// returning and encoding the resolved object.
  ///
  /// See also:
  ///  * [encodeBorderSide]
  ///  * [encodeColor]
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeMaterialStatePropertyBorderSide]
  ///  * [encodeMaterialStatePropertyColor]
  ///  * [encodeMaterialStatePropertyDouble]
  ///  * [encodeMaterialStatePropertyEdgeInsetsGeometry]
  ///  * [encodeMaterialStatePropertyMouseCursor]
  ///  * [encodeMaterialStatePropertyOutlinedBorder]
  ///  * [encodeMaterialStatePropertySize]
  ///  * [encodeMaterialStatePropertyTextStyle]
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
        'alignment': encodeAlignment(value.alignment as Alignment?),
        'animationDuration': value.animationDuration?.inMilliseconds,
        'backgroundColor': encodeMaterialStatePropertyColor(
          value.backgroundColor,
        ),
        'elevation': encodeMaterialStatePropertyDouble(value.elevation),
        'enableFeedback': value.enableFeedback,
        'fixedSize': encodeMaterialStatePropertySize(value.fixedSize),
        'foregroundColor': encodeMaterialStatePropertyColor(
          value.foregroundColor,
        ),
        'maximumSize': encodeMaterialStatePropertySize(value.maximumSize),
        'minimumSize': encodeMaterialStatePropertySize(value.minimumSize),
        'mouseCursor': encodeMaterialStatePropertyMouseCursor(
          value.mouseCursor,
        ),
        'overlayColor': encodeMaterialStatePropertyColor(value.overlayColor),
        'padding': encodeMaterialStatePropertyEdgeInsetsGeometry(value.padding),
        'shadowColor': encodeMaterialStatePropertyColor(value.shadowColor),
        'shape': encodeMaterialStatePropertyOutlinedBorder(value.shape),
        'side': encodeMaterialStatePropertyBorderSide(value.side),
        'tapTargetSize': encodeMaterialTapTargetSize(
          value.tapTargetSize,
        ),
        'textStyle': encodeMaterialStatePropertyTextStyle(value.textStyle),
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
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [CheckboxThemeData] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "checkColor": <Color>,
  ///   "fillColor": <MaterialStateProperty<Color>>,
  ///   "materialTapTargetSize": <MaterialTapTargetSize>,
  ///   "mouseCursor": <MaterialStateProperty<MouseCursor>>,
  ///   "overlayColor": <MaterialStateProperty<Color>>,
  ///   "shape": <OutlinedBorder>,
  ///   "side": <BorderSide>,
  ///   "splashRadius": <double>,
  ///   "visualDensity": <VisualDensity>
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
        'checkColor': encodeMaterialStatePropertyColor(
          value.checkColor,
        ),
        'fillColor': encodeMaterialStatePropertyColor(
          value.fillColor,
        ),
        'materialTapTargetSize': encodeMaterialTapTargetSize(
          value.materialTapTargetSize,
        ),
        'mouseCursor': encodeMaterialStatePropertyMouseCursor(
          value.mouseCursor,
        ),
        'overlayColor': encodeMaterialStatePropertyColor(
          value.overlayColor,
        ),
        'shape': encodeOutlinedBorder(value.shape),
        'side': encodeBorderSide(value.side),
        'splashRadius': value.splashRadius,
        'visualDensity': encodeVisualDensity(value.visualDensity),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": <Color>,
  ///   "borderSide": <BorderSide>,
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
  ///  * [encodeBorderSide]
  ///  * [encodeBrightness]
  ///  * [encodeColor]
  ///  * [encodeEdgeInsetsGeometry]
  ///  * [encodeShapeBorder]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeChipThemeData(ChipThemeData? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'backgroundColor': encodeColor(value.backgroundColor),
        'brightness': encodeBrightness(value.brightness),
        'checkmarkColor': encodeColor(value.checkmarkColor),
        'deleteIconColor': encodeColor(value.deleteIconColor),
        'disabledColor': encodeColor(value.disabledColor),
        'elevation': value.elevation,
        'labelPadding':
            encodeEdgeInsetsGeometry(value.labelPadding as EdgeInsets?),
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

    return result;
  }

  /// Encodes the given [value] to the String representation.  This will always
  /// use a hash encoded 8 digit string: "#aarrbbgg" format.
  ///
  /// This will return `null` if the value is `null`.
  static String? encodeColor(Color? value) {
    String? result;

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
  ///   "errorContainer": <Color>,
  ///   "inversePrimary": <Color>,
  ///   "inverseSurface": <Color>,
  ///   "onBackground": <Color>,
  ///   "onError": <Color>,
  ///   "onErrorContainer": <Color>,
  ///   "onInverseSurface": <Color>,
  ///   "onPrimary": <Color>,
  ///   "onPrimaryContainer": <Color>,
  ///   "onSecondary": <Color>,
  ///   "onSecondaryContainer": <Color>,
  ///   "onSurface": <Color>,
  ///   "onSurfaceVariant": <Color>,
  ///   "onTertiary": <Color>,
  ///   "onTertiaryContainer": <Color>,
  ///   "outline": <Color>,
  ///   "primary": <Color>,
  ///   "primaryContainer": <Color>,
  ///   "secondary": <Color>,
  ///   "secondaryContainer": <Color>,
  ///   "shadow": <Color>,
  ///   "surface": <Color>,
  ///   "tertiary": <Color>,
  ///   "tertiaryContainer": <Color>
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
        'background': encodeColor(value.background),
        'brightness': encodeBrightness(value.brightness),
        'error': encodeColor(value.error),
        'errorContainer': encodeColor(value.errorContainer),
        'inversePrimary': encodeColor(value.inversePrimary),
        'inverseSurface': encodeColor(value.inverseSurface),
        'onBackground': encodeColor(value.onBackground),
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
        'primary': encodeColor(value.primary),
        'primaryContainer': encodeColor(value.primaryContainer),
        'secondary': encodeColor(value.secondary),
        'secondaryContainer': encodeColor(value.secondaryContainer),
        'shadow': encodeColor(value.shadow),
        'surface': encodeColor(value.surface),
        'tertiary': encodeColor(value.tertiary),
        'tertiaryContainer': encodeColor(value.tertiaryContainer),
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

    return result;
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
  static Map<String, dynamic>? encodeCupertinoThemeData(
    // Set as dynamic rather than CupertinoThemeData to be compatible with 1.22 and 1.24 where the type switches.
    dynamic value,

    // TODO: 1.24
    // NoDefaultCupertinoThemeData value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      var runtimeTypeStr = value.runtimeType.toString();
      // In Flutter < 1.24, the type is: CupertinoThemeData or _NoDefaultCupertinoThemeData
      // In Flutter >= 1.24, the type is: NoDefaultCupertinoThemeData
      assert(runtimeTypeStr == 'CupertinoThemeData' ||
          runtimeTypeStr == 'NoDefaultCupertinoThemeData' ||
          runtimeTypeStr == '_NoDefaultCupertinoThemeData');

      if (runtimeTypeStr == 'CupertinoThemeData' ||
          runtimeTypeStr == 'NoDefaultCupertinoThemeData' ||
          runtimeTypeStr == '_NoDefaultCupertinoThemeData') {
        result = <String, dynamic>{
          'barBackgroundColor': encodeColor(value.barBackgroundColor),
          'brightness': encodeBrightness(value.brightness),
          'primaryColor': encodeColor(value.primaryColor),
          'primaryContrastingColor': encodeColor(value.primaryContrastingColor),
          'scaffoldBackgroundColor': encodeColor(value.scaffoldBackgroundColor),
          'textTheme': encodeCupertinoTextThemeData(value.textTheme),
        };
      } else {
        throw Exception(
          'Unknown type passed in to [encodeCupertinoThemeData]: [$runtimeTypeStr]',
        );
      }
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "checkboxHorizontalMargin": <double>,
  ///   "columnSpacing": <double>,
  ///   "dataRowColor": <MaterialStateProperty<Color>>,
  ///   "dataRowHeight": <double>,
  ///   "dataTextStyle": <TextStyle,
  ///   "decoration": <BoxDecoration>,
  ///   "dividerThickness": <double>,
  ///   "headingRowColor": <MaterialStateProperty<Color>>,
  ///   "headingRowHeight": <double>,
  ///   "headingTextStyle": <TextStyle>,
  ///   "horizontalMargin": <double>
  /// }
  /// ```
  ///
  /// This won't maintain the [MaterialStateProperty] of each corresponding
  /// property, instead will resolve them by using an empty set of states,
  /// returning and encoding the resolved object.
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeDataTableThemeData(
      DataTableThemeData? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'checkboxHorizontalMargin': value.checkboxHorizontalMargin,
        'columnSpacing': value.columnSpacing,
        'dataRowColor': encodeMaterialStatePropertyColor(
          value.dataRowColor,
        ),
        'dataRowHeight': value.dataRowHeight,
        'dataTextStyle': encodeTextStyle(
          value.dataTextStyle,
        ),
        'decoration': encodeBoxDecoration(
          value.decoration is! BoxDecoration
              ? null
              : value.decoration as BoxDecoration,
        ),
        'dividerThickness': value.dividerThickness,
        'headingRowColor': encodeMaterialStatePropertyColor(
          value.headingRowColor,
        ),
        'headingRowHeight': value.headingRowHeight,
        'headingTextStyle': encodeTextStyle(
          value.headingTextStyle,
        ),
        'horizontalMargin': value.horizontalMargin,
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "alignment": <Alignment>,
  ///   "centerSlice": <Rect>,
  ///   "filterQuality": <FilterQuality>,
  ///   "fit": <BoxFit>,
  ///   "image": <ImageProvider>,
  ///   "invertColors": <bool>,
  ///   "isAntiAlias": <bool>,
  ///   "matchTextDirection": <bool>,
  ///   "opacity": <double>,
  ///   "repeat": <ImageRepeat>,
  ///   "scale": <double>
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
        'alignment': encodeAlignment(value.alignment as Alignment?),
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

    return _stripNull(result);
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

    return result;
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "alignment": <Alignment>,
  ///   "backgroundColor": <Color>,
  ///   "contentTextStyle": <TextStyle>,
  ///   "elevation": <double>,
  ///   "shape": <ShapeBorder>,
  ///   "titleTextStyle": <TextStyle>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeAlignment]
  ///  * [encodeBrightness]
  ///  * [encodeShapeBorder]
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeDialogTheme(DialogTheme? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'alignment': encodeAlignment(value.alignment as Alignment?),
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

    return _stripNull(result);
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

    return result;
  }

  /// Encodes the given [value] to a JSON compatible [Map].  The returned result
  /// will always have the following format:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": <Color>,
  ///   "elevation": <double>,
  ///   "scrimColor": <Color>,
  ///   "shape": <ShapeBorder>,
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
        'scrimColor': encodeColor(value.scrimColor),
        'shape': encodeShapeBorder(value.shape),
      };
    }

    return _stripNull(result);
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
  static Map<String, dynamic>? encodeEdgeInsetsGeometry(EdgeInsets? value) {
    Map<String, dynamic>? result;

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
  static Map<String, dynamic>? encodeElevatedButtonThemeData(
    ElevatedButtonThemeData? value,
  ) {
    Map<String, dynamic>? result;

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

    return result;
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

    return result;
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

    return result;
  }

  /// Encodes the given [value] into a JSON representation.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": <Color>,
  ///   "disabledElevation": <double>,
  ///   "elevation": <double>,
  ///   "extendedIconLabelSpacing": <double>,
  ///   "extendedPadding": <EdgeInsetsGeometry>,
  ///   "extendedSizeConstraints": <BoxConstraints>,
  ///   "extendedTextStyle": <TextStyle>
  ///   "focusColor": <Color>,
  ///   "focusElevation": <double>,
  ///   "foregroundColor": <Color>,
  ///   "highlightElevation": <double>,
  ///   "hoverColor": <Color>,
  ///   "hoverElevation": <double>,
  ///   "largeSizeConstraints": <BoxConstraints>,
  ///   "shape": <ShapeBorder>,
  ///   "sizeConstraints": <BoxConstraints>,
  ///   "smallSizeConstraints": <BoxConstraints>,
  ///   "splashColor": <Color>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBoxConstraints]
  ///  * [encodeColor]
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
        'largeSizeConstraints': encodeBoxConstraints(
          value.largeSizeConstraints,
        ),
        'shape': encodeShapeBorder(value.shape),
        'sizeConstraints': encodeBoxConstraints(value.sizeConstraints),
        'smallSizeConstraints': encodeBoxConstraints(
          value.smallSizeConstraints,
        ),
        'splashColor': encodeColor(value.splashColor),
      };
    }

    return _stripNull(result);
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

    return result;
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
  static Map<String, dynamic>? encodeFontFeature(FontFeature? value) {
    Map<String, dynamic>? result;

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

    return result;
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
  static Map<String, dynamic>? encodeGradient(Gradient? value) {
    assert(value == null ||
        value is LinearGradient ||
        value is RadialGradient ||
        value is SweepGradient);
    Map<String, dynamic>? result;

    if (value != null) {
      if (value is LinearGradient) {
        result = {
          'begin': encodeAlignment(value.begin as Alignment?),
          'colors': _encodeList<String?>(
            value.colors,
            (value) => encodeColor(value),
          ),
          'end': encodeAlignment(value.end as Alignment?),
          'stops': value.stops,
          'tileMode': encodeTileMode(value.tileMode),
          'transform': encodeGradientTransform(value.transform),
          'type': 'linear',
        };
      } else if (value is RadialGradient) {
        result = {
          'center': encodeAlignment(value.center as Alignment?),
          'colors': _encodeList<String?>(
            value.colors,
            (value) => encodeColor(value),
          ),
          'focal': encodeAlignment(value.focal as Alignment?),
          'focalRadius': value.focalRadius,
          'radius': value.radius,
          'stops': value.stops,
          'tileMode': encodeTileMode(value.tileMode),
          'transform': encodeGradientTransform(value.transform),
          'type': 'radial',
        };
      } else if (value is SweepGradient) {
        result = {
          'center': encodeAlignment(value.center as Alignment?),
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

    return _stripNull(result);
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
  static Map<String, dynamic>? encodeGradientTransform(
      GradientTransform? value) {
    assert(value == null || value is GradientRotation);
    Map<String, dynamic>? result;

    if (value != null && value is GradientRotation) {
      result = {
        'radians': value.radians,
      };
    }

    return _stripNull(result);
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

    return _stripNull(result);
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
  static Map<String, dynamic>? encodeIconThemeData(IconThemeData? value) {
    Map<String, dynamic>? result;

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

    return _stripNull(result);
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

    return _stripNull(result);
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "alignLabelWithHint": <bool>,
  ///   "border": <InputBorder>,
  ///   "constraints": <BoxConstraints>,
  ///   "contentPadding": <EdgeInsetsGeometry>,
  ///   "counterStyle": <TextStyle>,
  ///   "disabledBorder": <InputBorder>,
  ///   "enabledBorder": <InputBorder>,
  ///   "errorBorder": <InputBorder>,
  ///   "errorMaxLines": <int>,
  ///   "errorStyle": <TextStyle>,
  ///   "fillColor": <Color>,
  ///   "filled": <bool>,
  ///   "floatingLabelAlignment": <FloatingLabelAlignment>,
  ///   "floatingLabelBehavior": <FloatingLabelBehavior>,
  ///   "floatingLabelStyle": <TextStyle>,
  ///   "focusColor": <Color>,
  ///   "focusedBorder": <InputBorder>,
  ///   "focusedErrorBorder": <InputBorder>,
  ///   "helperMaxLines": <int>,
  ///   "helperStyle": <TextStyle>,
  ///   "hintStyle": <TextStyle>,
  ///   "hoverColor": <Color>,
  ///   "iconColor": <Color>,
  ///   "isCollapsed": <bool>,
  ///   "isDense": <bool>,
  ///   "labelStyle": <TextStyle>,
  ///   "prefixIconColor": <Color>,
  ///   "prefixStyle": <TextStyle>,
  ///   "suffixIconColor": <Color>,
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
  static Map<String, dynamic>? encodeInputDecorationTheme(
    InputDecorationTheme? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
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
        'hintStyle': encodeTextStyle(value.hintStyle),
        'hoverColor': encodeColor(value.hoverColor),
        'iconColor': encodeColor(value.iconColor),
        'isCollapsed': value.isCollapsed,
        'isDense': value.isDense,
        'labelStyle': encodeTextStyle(value.labelStyle),
        'prefixIconColor': encodeColor(value.prefixIconColor),
        'prefixStyle': encodeTextStyle(value.prefixStyle),
        'suffixIconColor': encodeColor(value.suffixIconColor),
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
  /// All other values, including `null`, will result in `null`.
  static String? encodeInteractiveInkFeatureFactory(
    InteractiveInkFeatureFactory? value,
  ) {
    var splashType = InkSplash.splashFactory.runtimeType;
    var rippleType = InkRipple.splashFactory.runtimeType;

    assert(value == null ||
        value.runtimeType == splashType ||
        value.runtimeType == rippleType);
    String? result;

    if (value != null) {
      if (value.runtimeType == splashType) {
        result = 'splash';
      } else if (value.runtimeType == rippleType) {
        result = 'ripple';
      }
    }

    return result;
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

    return result;
  }

  /// Encodes the given [value] to a  JSON representation.
  ///
  /// ```json
  /// {
  ///   "contentPadding": <EdgeInsetsGeometry>,
  ///   "dense": <bool>,
  ///   "enableFeedback": <bool>,
  ///   "horizontalTitleGap": <double>,
  ///   "iconColor": <Color>,
  ///   "minLeadingWidth": <double>,
  ///   "minVerticalPadding": <double>,
  ///   "selectedColor": <Color>,
  ///   "selectedTileColor": <Color>,
  ///   "shape": <ShapeBorder>,
  ///   "style": <ListTileStyle>,
  ///   "textColor": <Color>,
  ///   "tileColor": <Color>
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
        'minLeadingWidth': value.minLeadingWidth,
        'minVerticalPadding': value.minVerticalPadding,
        'selectedColor': encodeColor(value.selectedColor),
        'selectedTileColor': encodeColor(value.selectedTileColor),
        'shape': encodeShapeBorder(value.shape),
        'style': encodeListTileStyle(value.style),
        'textColor': encodeColor(value.textColor),
        'tileColor': encodeColor(value.tileColor),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to a  JSON representation.
  ///
  /// ```json
  /// {
  ///   "countryCode": <String>,
  ///   "languageCode": <String>
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

    return result;
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

    return result;
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": <Color>,
  ///   "contentTextStyle": <TextStyle>,
  ///   "elevation": <double>,
  ///   "leadingPadding": <EdgeInsetsGeometry>,
  ///   "padding": <EdgeInsetsGeometry>
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
        'elevation': value.elevation,
        'leadingPadding':
            encodeEdgeInsetsGeometry(value.leadingPadding as EdgeInsets?),
        'padding': encodeEdgeInsetsGeometry(value.padding as EdgeInsets?),
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

    return _stripNull(result);
  }

  /// Encodes the [value] into a JSON representation.
  ///
  ///
  /// ```json
  /// {
  ///   "disabled": <bool>,
  ///   "dragged": <bool>,
  ///   "empty": <bool>,
  ///   "error": <bool>,
  ///   "focused": <bool>,
  ///   "hovered": <bool>,
  ///   "pressed": <bool>,
  ///   "scrolledUnder": <bool>,
  ///   "selected": <bool>
  /// }
  /// ```
  static Map<String, dynamic>? encodeMaterialStatePropertyBool(
    MaterialStateProperty<bool?>? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': value.resolve({MaterialState.disabled}),
        'dragged': value.resolve({MaterialState.dragged}),
        'empty': value.resolve({}),
        'error': value.resolve({MaterialState.error}),
        'focused': value.resolve({MaterialState.focused}),
        'hovered': value.resolve({MaterialState.hovered}),
        'pressed': value.resolve({MaterialState.pressed}),
        'scrolledUnder': value.resolve({MaterialState.scrolledUnder}),
        'selected': value.resolve({MaterialState.selected}),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the [value] into a JSON representation.
  ///
  ///
  /// ```json
  /// {
  ///   "disabled": <BorderSide>,
  ///   "dragged": <BorderSide>,
  ///   "empty": <BorderSide>,
  ///   "error": <BorderSide>,
  ///   "focused": <BorderSide>,
  ///   "hovered": <BorderSide>,
  ///   "pressed": <BorderSide>,
  ///   "scrolledUnder": <BorderSide>,
  ///   "selected": <BorderSide>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeBorderSide]
  static Map<String, dynamic>? encodeMaterialStatePropertyBorderSide(
    MaterialStateProperty<BorderSide?>? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': encodeBorderSide(value.resolve({MaterialState.disabled})),
        'dragged': encodeBorderSide(value.resolve({MaterialState.dragged})),
        'empty': encodeBorderSide(value.resolve({})),
        'error': encodeBorderSide(value.resolve({MaterialState.error})),
        'focused': encodeBorderSide(value.resolve({MaterialState.focused})),
        'hovered': encodeBorderSide(value.resolve({MaterialState.hovered})),
        'pressed': encodeBorderSide(value.resolve({MaterialState.pressed})),
        'scrolledUnder': encodeBorderSide(value.resolve(
          {MaterialState.scrolledUnder},
        )),
        'selected': encodeBorderSide(value.resolve({MaterialState.selected})),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the [value] into a JSON representation.
  ///
  ///
  /// ```json
  /// {
  ///   "disabled": <Color>,
  ///   "dragged": <Color>,
  ///   "empty": <Color>,
  ///   "error": <Color>,
  ///   "focused": <Color>,
  ///   "hovered": <Color>,
  ///   "pressed": <Color>,
  ///   "scrolledUnder": <Color>,
  ///   "selected": <Color>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  static Map<String, dynamic>? encodeMaterialStatePropertyColor(
    MaterialStateProperty<Color?>? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': encodeColor(value.resolve({MaterialState.disabled})),
        'dragged': encodeColor(value.resolve({MaterialState.dragged})),
        'empty': encodeColor(value.resolve({})),
        'error': encodeColor(value.resolve({MaterialState.error})),
        'focused': encodeColor(value.resolve({MaterialState.focused})),
        'hovered': encodeColor(value.resolve({MaterialState.hovered})),
        'pressed': encodeColor(value.resolve({MaterialState.pressed})),
        'scrolledUnder': encodeColor(value.resolve(
          {MaterialState.scrolledUnder},
        )),
        'selected': encodeColor(value.resolve({MaterialState.selected})),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the [value] into a JSON representation.
  ///
  ///
  /// ```json
  /// {
  ///   "disabled": <double>,
  ///   "dragged": <double>,
  ///   "empty": <double>,
  ///   "error": <double>,
  ///   "focused": <double>,
  ///   "hovered": <double>,
  ///   "pressed": <double>,
  ///   "scrolledUnder": <double>,
  ///   "selected": <double>
  /// }
  /// ```
  static Map<String, dynamic>? encodeMaterialStatePropertyDouble(
    MaterialStateProperty<double?>? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': value.resolve({MaterialState.disabled}),
        'dragged': value.resolve({MaterialState.dragged}),
        'empty': value.resolve({}),
        'error': value.resolve({MaterialState.error}),
        'focused': value.resolve({MaterialState.focused}),
        'hovered': value.resolve({MaterialState.hovered}),
        'pressed': value.resolve({MaterialState.pressed}),
        'scrolledUnder': value.resolve({MaterialState.scrolledUnder}),
        'selected': value.resolve({MaterialState.selected}),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the [value] into a JSON representation.
  ///
  ///
  /// ```json
  /// {
  ///   "disabled": <EdgeInsetsGeometry>,
  ///   "dragged": <EdgeInsetsGeometry>,
  ///   "empty": <EdgeInsetsGeometry>,
  ///   "error": <EdgeInsetsGeometry>,
  ///   "focused": <EdgeInsetsGeometry>,
  ///   "hovered": <EdgeInsetsGeometry>,
  ///   "pressed": <EdgeInsetsGeometry>,
  ///   "scrolledUnder": <EdgeInsetsGeometry>,
  ///   "selected": <EdgeInsetsGeometry>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeEdgeInsetsGeometry]
  static Map<String, dynamic>? encodeMaterialStatePropertyEdgeInsetsGeometry(
    MaterialStateProperty<EdgeInsetsGeometry?>? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': encodeEdgeInsetsGeometry(
          value.resolve({MaterialState.disabled}) as EdgeInsets?,
        ),
        'dragged': encodeEdgeInsetsGeometry(
          value.resolve({MaterialState.dragged}) as EdgeInsets?,
        ),
        'empty': encodeEdgeInsetsGeometry(
          value.resolve({}) as EdgeInsets?,
        ),
        'error': encodeEdgeInsetsGeometry(
          value.resolve({MaterialState.error}) as EdgeInsets?,
        ),
        'focused': encodeEdgeInsetsGeometry(
          value.resolve({MaterialState.focused}) as EdgeInsets?,
        ),
        'hovered': encodeEdgeInsetsGeometry(
          value.resolve({MaterialState.hovered}) as EdgeInsets?,
        ),
        'pressed': encodeEdgeInsetsGeometry(
          value.resolve({MaterialState.pressed}) as EdgeInsets?,
        ),
        'scrolledUnder': encodeEdgeInsetsGeometry(
          value.resolve({MaterialState.scrolledUnder}) as EdgeInsets?,
        ),
        'selected': encodeEdgeInsetsGeometry(
          value.resolve({MaterialState.selected}) as EdgeInsets?,
        ),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the [value] into a JSON representation.
  ///
  ///
  /// ```json
  /// {
  ///   "disabled": <IconThemeData>,
  ///   "dragged": <IconThemeData>,
  ///   "empty": <IconThemeData>,
  ///   "error": <IconThemeData>,
  ///   "focused": <IconThemeData>,
  ///   "hovered": <IconThemeData>,
  ///   "pressed": <IconThemeData>,
  ///   "scrolledUnder": <IconThemeData>,
  ///   "selected": <IconThemeData>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeIconThemeData]
  static Map<String, dynamic>? encodeMaterialStatePropertyIconThemeData(
    MaterialStateProperty<IconThemeData?>? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': encodeIconThemeData(
          value.resolve({MaterialState.disabled}),
        ),
        'dragged': encodeIconThemeData(value.resolve({MaterialState.dragged})),
        'empty': encodeIconThemeData(value.resolve({})),
        'error': encodeIconThemeData(value.resolve({MaterialState.error})),
        'focused': encodeIconThemeData(value.resolve({MaterialState.focused})),
        'hovered': encodeIconThemeData(value.resolve({MaterialState.hovered})),
        'pressed': encodeIconThemeData(value.resolve({MaterialState.pressed})),
        'scrolledUnder': encodeIconThemeData(
          value.resolve({MaterialState.selected}),
        ),
        'selected': encodeIconThemeData(
          value.resolve({MaterialState.selected}),
        ),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the [value] into a JSON representation.
  ///
  ///
  /// ```json
  /// {
  ///   "disabled": <MouseCursor>,
  ///   "dragged": <MouseCursor>,
  ///   "empty": <MouseCursor>,
  ///   "error": <MouseCursor>,
  ///   "focused": <MouseCursor>,
  ///   "hovered": <MouseCursor>,
  ///   "pressed": <MouseCursor>,
  ///   "scrolledUnder": <MouseCursor>,
  ///   "selected": <MouseCursor>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeMouseCursor]
  static Map<String, dynamic>? encodeMaterialStatePropertyMouseCursor(
    MaterialStateProperty<MouseCursor?>? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': encodeMouseCursor(value.resolve({MaterialState.disabled})),
        'dragged': encodeMouseCursor(value.resolve({MaterialState.dragged})),
        'empty': encodeMouseCursor(value.resolve({})),
        'error': encodeMouseCursor(value.resolve({MaterialState.error})),
        'focused': encodeMouseCursor(value.resolve({MaterialState.focused})),
        'hovered': encodeMouseCursor(value.resolve({MaterialState.hovered})),
        'pressed': encodeMouseCursor(value.resolve({MaterialState.pressed})),
        'scrolledUnder': encodeMouseCursor(value.resolve(
          {MaterialState.scrolledUnder},
        )),
        'selected': encodeMouseCursor(value.resolve({MaterialState.selected})),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the [value] into a JSON representation.
  ///
  ///
  /// ```json
  /// {
  ///   "disabled": <OutlinedBorder>,
  ///   "dragged": <OutlinedBorder>,
  ///   "empty": <OutlinedBorder>,
  ///   "error": <OutlinedBorder>,
  ///   "focused": <OutlinedBorder>,
  ///   "hovered": <OutlinedBorder>,
  ///   "pressed": <OutlinedBorder>,
  ///   "scrolledUnder": <OutlinedBorder>,
  ///   "selected": <OutlinedBorder>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeOutlinedBorder]
  static Map<String, dynamic>? encodeMaterialStatePropertyOutlinedBorder(
    MaterialStateProperty<OutlinedBorder?>? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': encodeOutlinedBorder(
          value.resolve({MaterialState.disabled}),
        ),
        'dragged': encodeOutlinedBorder(value.resolve({MaterialState.dragged})),
        'empty': encodeOutlinedBorder(value.resolve({})),
        'error': encodeOutlinedBorder(value.resolve({MaterialState.error})),
        'focused': encodeOutlinedBorder(value.resolve({MaterialState.focused})),
        'hovered': encodeOutlinedBorder(value.resolve({MaterialState.hovered})),
        'pressed': encodeOutlinedBorder(value.resolve({MaterialState.pressed})),
        'scrolledUnder': encodeOutlinedBorder(
          value.resolve({MaterialState.scrolledUnder}),
        ),
        'selected': encodeOutlinedBorder(
          value.resolve({MaterialState.selected}),
        ),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the [value] into a JSON representation.
  ///
  ///
  /// ```json
  /// {
  ///   "disabled": <Size>,
  ///   "dragged": <Size>,
  ///   "empty": <Size>,
  ///   "error": <Size>,
  ///   "focused": <Size>,
  ///   "hovered": <Size>,
  ///   "pressed": <Size>,
  ///   "scrolledUnder": <Size>,
  ///   "selected": <Size>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeSize]
  static Map<String, dynamic>? encodeMaterialStatePropertySize(
    MaterialStateProperty<Size?>? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': encodeSize(value.resolve({MaterialState.disabled})),
        'dragged': encodeSize(value.resolve({MaterialState.dragged})),
        'empty': encodeSize(value.resolve({})),
        'error': encodeSize(value.resolve({MaterialState.error})),
        'focused': encodeSize(value.resolve({MaterialState.focused})),
        'hovered': encodeSize(value.resolve({MaterialState.hovered})),
        'pressed': encodeSize(value.resolve({MaterialState.pressed})),
        'scrolledUnder':
            encodeSize(value.resolve({MaterialState.scrolledUnder})),
        'selected': encodeSize(value.resolve({MaterialState.selected})),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the [value] into a JSON representation.
  ///
  ///
  /// ```json
  /// {
  ///   "disabled": <TextStyle>,
  ///   "dragged": <TextStyle>,
  ///   "empty": <TextStyle>,
  ///   "error": <TextStyle>,
  ///   "focused": <TextStyle>,
  ///   "hovered": <TextStyle>,
  ///   "pressed": <TextStyle>,
  ///   "scrolledUnder": <TextStyle>,
  ///   "selected": <TextStyle>,
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeTextStyle]
  static Map<String, dynamic>? encodeMaterialStatePropertyTextStyle(
    MaterialStateProperty<TextStyle?>? value, {
    bool validate = true,
  }) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'disabled': encodeTextStyle(value.resolve({MaterialState.disabled})),
        'dragged': encodeTextStyle(value.resolve({MaterialState.dragged})),
        'empty': encodeTextStyle(value.resolve({})),
        'error': encodeTextStyle(value.resolve({MaterialState.error})),
        'focused': encodeTextStyle(value.resolve({MaterialState.focused})),
        'hovered': encodeTextStyle(value.resolve({MaterialState.hovered})),
        'pressed': encodeTextStyle(value.resolve({MaterialState.pressed})),
        'scrolledUnder': encodeTextStyle(value.resolve(
          {MaterialState.scrolledUnder},
        )),
        'selected': encodeTextStyle(value.resolve({MaterialState.selected})),
      };
    }

    return _stripNull(result);
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

    return result;
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

    return result;
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

    return _stripNull(result);
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

    return result;
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": <Color>,
  ///   "height": <double>,
  ///   "iconTheme": <MaterialStateProperty<IconThemeData>>,
  ///   "indicatorColor": <Color>,
  ///   "labelBehavior": <NavigationDestinationLabelBehavior>,
  ///   "labelTextStyle": <MaterialStateProperty<TextStyle>>,
  ///   "useIndicator": <bool>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeMaterialStatePropertyIconThemeData]
  ///  * [encodeMaterialStatePropertyTextStyle]
  ///  * [encodeNavigationDestinationLabelBehavior]
  static Map<String, dynamic>? encodeNavigationBarThemeData(
    NavigationBarThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'backgroundColor': encodeColor(value.backgroundColor),
        'height': value.height,
        'iconTheme': encodeMaterialStatePropertyIconThemeData(
          value.iconTheme,
        ),
        'indicatorColor': encodeColor(value.indicatorColor),
        'labelBehavior':
            encodeNavigationDestinationLabelBehavior(value.labelBehavior),
        'labelTextStyle': encodeMaterialStatePropertyTextStyle(
          value.labelTextStyle,
        ),
      };
    }

    return _stripNull(result);
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

    return result;
  }

  /// Encodes the given [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "backgroundColor": <Color>,
  ///   "elevation": <double>,
  ///   "groupAlignment": <double>,
  ///   "indicatorColor": <Color>,
  ///   "labelType": <NavigationRailLabelType>,
  ///   "selectedIconTheme": <IconThemeData>,
  ///   "selectedLabelTextStyle": <TextStyle>,
  ///   "unselectedIconTheme": <IconThemeData>,
  ///   "unselectedLabelTextStyle": <TextStyle>,
  ///   "useIndicator": <bool>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeIconThemeData]
  ///  * [encodeNavigationRailLabelType]
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
        'labelType': encodeNavigationRailLabelType(value.labelType),
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

    return _stripNull(result);
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
  static Map<String, dynamic>? encodeOffset(Offset? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'dx': value.dx,
        'dy': value.dy,
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [OrdinalSortKey] to a JSON representation.  This
  /// produces the given the following structure:
  ///
  /// ```json
  /// {
  ///   "name": <String>,
  ///   "order": <double>
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
  static Map<String, dynamic>? encodeOutlinedButtonThemeData(
    OutlinedButtonThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'style': encodeButtonStyle(value.style),
      };
    }

    return _stripNull(result);
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

    return result;
  }

  /// Encodes the given [value] to a JSON representation
  ///
  /// ```json
  /// {
  ///   "builders": <Map<TargetPlatform, PageTransitionBuilder>>
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
      var builders = <String?, String?>{};
      value.builders.forEach(
        (key, value) =>
            builders[encodeTargetPlatform(key)] = encodePageTransitionsBuilder(
          value,
        ),
      );

      result = {
        'builders': builders,
      };
    }

    return result;
  }

  /// Encodes the [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "color": <Color>,
  ///   "elevation": <double>,
  ///   "enableFeedback": <bool>,
  ///   "shape": <ShapeBorder>,
  ///   "textStyle": <TextStyle>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
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
        'shape': encodeShapeBorder(value.shape),
        'textStyle': encodeTextStyle(value.textStyle),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the [value] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "circularTrackColor": <Color>,
  ///   "color": <Color>,
  ///   "linearMinHeight": <double>,
  ///   "linearTrackColor": <Color>,
  ///   "refreshBackgroundColor": <Color>
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

    return _stripNull(result);
  }

  /// Encodes the given [RadioThemeData] to a JSON representation.
  ///
  /// ```json
  /// {
  ///   "fillColor": <Color>,
  ///   "materialTapTargetSize": <MaterialTapTargetSize>,
  ///   "mouseCursor": <MouseCursor>,
  ///   "overlayColor": <Color>,
  ///   "splashRadius": <double>,
  ///   "visualDensity": <VisualDensity>
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
        'fillColor': encodeMaterialStatePropertyColor(
          value.fillColor,
        ),
        'materialTapTargetSize': encodeMaterialTapTargetSize(
          value.materialTapTargetSize,
        ),
        'mouseCursor': encodeMaterialStatePropertyMouseCursor(
          value.mouseCursor,
        ),
        'overlayColor': encodeMaterialStatePropertyColor(
          value.overlayColor,
        ),
        'splashRadius': value.splashRadius,
        'visualDensity': encodeVisualDensity(value.visualDensity),
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
  static Map<String, dynamic>? encodeRadius(Radius? value) {
    Map<String, dynamic>? result;

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
  static Map<String, dynamic>? encodeRangeSliderTickMarkShape(
    RangeSliderTickMarkShape? value,
  ) {
    assert(value == null || value is RoundRangeSliderTickMarkShape);
    Map<String, dynamic>? result;

    if (value != null) {
      var shape = value as RoundRangeSliderTickMarkShape;
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

    return result;
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

    return _stripNull(result);
  }

  /// Encodes the given [value] to a JSON compatible Map.
  ///
  /// This returns the JSON representation to follow the structure:
  ///
  /// ```json
  /// {
  ///   "androidOverscrollIndicator": <AndroidOverscrollIndicator>
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
      result = {
        'androidOverscrollIndicator': encodeAndroidOverscrollIndicator(
          // ignore: deprecated_member_use
          value.androidOverscrollIndicator,
        ),
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

    return _stripNull(result);
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

    return result;
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

    return result;
  }

  /// Encodes the given [ScrollbarThemeData] to the JSON representation.  This
  /// produces the following structure:
  ///
  /// ```json
  /// {
  ///   "crossAxisMargin": <double>,
  ///   "interactive": <bool>,
  ///   "isAlwaysShown": <bool>,
  ///   "mainAxisMargin": <double>,
  ///   "minThumbLength": <double>,
  ///   "radius": <Radius>,
  ///   "showTrackOnHover": <bool>,
  ///   "thickness": <MaterialStateProperty<double>>,
  ///   "thumbColor": <MaterialStateProperty<Color>>,
  ///   "trackBorderColor": <MaterialStateProperty<Color>>,
  ///   "trackColor": <MaterialStateProperty<Color>>,
  ///   "trackVisibility": <MaterialStateProperty<bool>>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeMaterialStatePropertyBool]
  ///  * [encodeMaterialStatePropertyColor]
  ///  * [encodeMaterialStatePropertyDouble]
  ///  * [encodeRadius]
  static Map<String, dynamic>? encodeScrollbarThemeData(
    ScrollbarThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'crossAxisMargin': value.crossAxisMargin,
        'interactive': value.interactive,
        // ignore: deprecated_member_use
        'isAlwaysShown': value.isAlwaysShown,
        'mainAxisMargin': value.mainAxisMargin,
        'minThumbLength': value.minThumbLength,
        'radius': encodeRadius(value.radius),
        // ignore: deprecated_member_use
        'showTrackOnHover': value.showTrackOnHover,
        'thickness': encodeMaterialStatePropertyDouble(
          value.thickness,
        ),
        'thumbColor': encodeMaterialStatePropertyColor(value.thumbColor),
        'trackBorderColor': encodeMaterialStatePropertyColor(
          value.trackBorderColor,
        ),
        'trackColor': encodeMaterialStatePropertyColor(value.trackColor),
        'trackVisibility': encodeMaterialStatePropertyBool(
          value.trackVisibility,
        ),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [SemanticsTag] to a JSON representation.  This
  /// produces the given the following structure:
  ///
  /// ```json
  /// {
  ///   "name": <String>
  /// }
  /// ```
  static Map<String, dynamic>? encodeSemanticsTag(SemanticsTag? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'name': value.name,
      };
    }

    return _stripNull(result);
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
  static Map<String, dynamic>? encodeShadow(Shadow? value) {
    Map<String, dynamic>? result;

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

    return _stripNull(result);
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
  static Map<String, dynamic>? encodeSize(Size? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = {
        'height': value.height,
        'width': value.width,
      };
    }

    return _stripNull(result);
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
        'rangeThumbShape': encodeRangeSliderThumbShape(
            value.rangeThumbShape as RoundRangeSliderThumbShape?),
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
  static String? encodeSliderTickMarkShape(
    SliderTickMarkShape? value, {
    bool validate = true,
  }) {
    String? result;

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

    return _stripNull(result);
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

    return result;
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

    return result;
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
  static Map<String, dynamic>? encodeSnackBarThemeData(
      SnackBarThemeData? value) {
    Map<String, dynamic>? result;

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
  ///   "leadingDistribution": <TextLeadingDistribution>,
  ///   "package": <String>
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

    return _stripNull(result);
  }

  /// Encodes the given [value] to it's JSON representation.
  ///
  /// ```json
  /// {
  ///   "materialTapTargetSize": <MaterialTapTargetSize>,
  ///   "mouseCursor": <MaterialStateProperty<MouseCursor>>,
  ///   "overlayColor": <MaterialStateProperty<Color>>,
  ///   "splashRadius": <double>,
  ///   "thumbColor": <MaterialStateProperty<Color>>,
  ///   "trackColor": <MaterialStateProperty<Color>>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeColor]
  ///  * [encodeMaterialStatePropertyMouseCursor]
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
        'mouseCursor': encodeMaterialStatePropertyMouseCursor(
          value.mouseCursor,
        ),
        'overlayColor': encodeMaterialStatePropertyColor(
          value.overlayColor,
        ),
        'splashRadius': value.splashRadius,
        'thumbColor': encodeMaterialStatePropertyColor(
          value.thumbColor,
        ),
        'trackColor': encodeMaterialStatePropertyColor(
          value.trackColor,
        ),
      };
    }

    return result;
  }

  /// Encodes the given [value] to the String representation.  Supported values
  /// are:
  ///  * `dark`
  ///  * `light`
  ///
  /// All other values, including `null`, will result in `null`.
  static String? encodeSystemUiOverlayStyle(
    SystemUiOverlayStyle? value,
  ) {
    String? result;

    if (value != null) {
      if (value == SystemUiOverlayStyle.dark) {
        result = 'dark';
      } else if (value == SystemUiOverlayStyle.light) {
        result = 'light';
      }
    }

    return result;
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
  static Map<String, dynamic>? encodeTabBarTheme(TabBarTheme? value) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'indicatorSize': encodeTabBarIndicatorSize(value.indicatorSize),
        'labelPadding':
            encodeEdgeInsetsGeometry(value.labelPadding as EdgeInsets?),
        'labelColor': encodeColor(value.labelColor),
        'labelStyle': encodeTextStyle(value.labelStyle),
        'unselectedLabelColor': encodeColor(value.unselectedLabelColor),
        'unselectedLabelStyle': encodeTextStyle(value.unselectedLabelStyle),
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to the JSON representation.  Supported values
  /// are:
  ///
  /// ```json
  /// {
  ///   "borderRadius": <BorderRadius>,
  ///   "bottom": <BorderSide>,
  ///   "horizontalInside": <BorderSide>,
  ///   "left": <BorderSide>,
  ///   "right": <BorderSide>,
  ///   "top": <BorderSide>,
  ///   "verticalInside": <BorderSide>,
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

    return result;
  }

  /// Decodes the given [value] to a [TableColumnWidth].  This expects the
  /// [value] to have the following structure:
  ///
  /// ```json
  /// {
  ///   "a": <TableColumnWidth>,
  ///   "b": <TableColumnWidth>,
  ///   "type": <"fixed" | "flex" | "fraction" | "intrinsic" | "max" | "min">,
  ///   "value": <double>
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

    return result;
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

    return result;
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

    return result;
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

    return result;
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
  static Map<String, dynamic>? encodeTextButtonThemeData(
    TextButtonThemeData? value,
  ) {
    Map<String, dynamic>? result;

    if (value != null) {
      result = <String, dynamic>{
        'style': encodeButtonStyle(value.style),
      };
    }

    return _stripNull(result);
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

    return result;
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

    return result;
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
  ///   "applyHeightToLastDescent": <bool>,
  ///   "leadingDistribution": <TextLeadingDistribution>
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

    return _stripNull(result);
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

    return result;
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
  static Map<String, dynamic>? encodeTextSelectionThemeData(
      TextSelectionThemeData? value) {
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
  ///   "leadingDistribution": <TextLeadingDistribution>,
  ///   "letterSpacing": <double>,
  ///   "locale": <Locale>,
  ///   "overflow": <TextOverflow>,
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
        'fontFeatures': value.fontFeatures == null
            ? null
            : value.fontFeatures!
                .map(
                  (value) => encodeFontFeature(value),
                )
                .toList(),
        'fontWeight': encodeFontWeight(value.fontWeight),
        'fontSize': value.fontSize,
        'fontStyle': encodeFontStyle(value.fontStyle),
        'height': value.height,
        'inherit': value.inherit,
        'leadingDistribution': encodeTextLeadingDistribution(
          value.leadingDistribution,
        ),
        'letterSpacing': value.letterSpacing,
        'locale': encodeLocale(value.locale),
        'overflow': encodeTextOverflow(value.overflow),
        'shadows': value.shadows == null
            ? null
            : value.shadows!
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
  ///   "bodyLarge": <TextStyle>,
  ///   "bodyMedium": <TextStyle>,
  ///   "bodySmall": <TextStyle>,
  ///   "displayLarge": <TextStyle>,
  ///   "displayMedium": <TextStyle>,
  ///   "displaySmall": <TextStyle>,
  ///   "headlineLarge": <TextStyle>,
  ///   "headlineMedium": <TextStyle>,
  ///   "headlineSmall": <TextStyle>,
  ///   "labelLarge": <TextStyle>,
  ///   "labelMedium": <TextStyle>,
  ///   "labelSmall": <TextStyle>,
  ///   "titleLarge": <TextStyle>,
  ///   "titleMedium": <TextStyle>,
  ///   "titleSmall": <TextStyle>
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

    return _stripNull(result);
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

    return result;
  }

  /// Encodes the given [value] to a JSON compatible Map.  The returned Map will
  /// have the following structure:
  ///
  /// ```json
  /// {
  ///   "androidOverscrollIndicator": <AndroidOverscrollIndicator>,
  ///   "appBarTheme": <AppBarTheme>,
  ///   "applyElevationOverlayColor": <bool>,
  ///   "bannerTheme": <MaterialBannerThemeData>,
  ///   "backgroundColor": <Color>,
  ///   "bottomAppBarColor": <Color>,
  ///   "bottomAppBarTheme": <BottomAppBarTheme>,
  ///   "bottomNavigationBarTheme": <BottomNavigationBarThemeData>,
  ///   "bottomSheetTheme": <BottomSheetThemeData>,
  ///   "brightness": <Brightness>,
  ///   "buttonBarTheme": <ButtonBarThemeData>,
  ///   "buttonTheme": <ButtonThemeData>,
  ///   "canvasColor": <Color>,
  ///   "cardColor": <Color>,
  ///   "cardTheme": <CardTheme>,
  ///   "checkboxTheme": <CheckboxThemeData>,
  ///   "chipTheme": <ChipThemeData>,
  ///   "colorScheme": <ColorScheme>,
  ///   "cupertinoOverrideTheme": <CupertinoThemeData>,
  ///   "dataTableTheme": <DataTableThemeData>,
  ///   "dialogBackgroundColor": <Color>,
  ///   "dialogTheme": <DialogTheme>,
  ///   "disabledColor": <Color>,
  ///   "dividerColor": <Color>,
  ///   "dividerTheme": <DividerThemeData>,
  ///   "drawerTheme": <DrawerThemeData>,
  ///   "elevatedButtonTheme": <ElevatedButtonThemeData>,
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
  ///   "listTileTheme": <ListTileThemeData>,
  ///   "materialTapTargetSize": <MaterialTapTargetSize>,
  ///   "navigationBarTheme": <NavigationBarThemeData>,
  ///   "navigationRailTheme": <NavigationRailThemeData>,
  ///   "outlinedButtonTheme": <OutlinedButtonThemeData>,
  ///   "platform": <TargetPlatform>,
  ///   "popupMenuTheme": <PopupMenuThemeData>,
  ///   "primaryColor": <Color>,
  ///   "primaryColorDark": <Color>,
  ///   "primaryColorLight": <Color>,
  ///   "primaryIconTheme": <IconThemeData>,
  ///   "primarySwatch": <MaterialColor>,
  ///   "primaryTextTheme": <TextTheme>,
  ///   "radioTheme": <RadioThemeData>,
  ///   "scaffoldBackgroundColor": <Color>,
  ///   "secondaryHeaderColor": <Color>,
  ///   "selectedRowColor": <Color>,
  ///   "shadowColor": <Color>,
  ///   "sliderTheme": <SliderThemeData>,
  ///   "snackBarTheme": SnackBarThemeData>,
  ///   "splashColor": <Color>,
  ///   "splashFactory": <InteractiveInkFeatureFactory>,
  ///   "switchTheme": <SwitchThemeData>,
  ///   "tabBarTheme": <TabBarTheme>,
  ///   "textButtonTheme": <TextButtonThemeData>,
  ///   "textSelectionTheme": <TextSelectionThemeData>,
  ///   "textTheme": <TextTheme>,
  ///   "toggleButtonsTheme": <ToggleButtonsThemeData>,
  ///   "toggleableActiveColor": <Color>,
  ///   "tooltipTheme": <TooltipThemeData>,
  ///   "typography": <Typography>,
  ///   "unselectedWidgetColor": <Color>,
  ///   "useMaterial3": <bool>,
  ///   "visualDensity": <VisualDensity>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [encodeAndroidOverscrollIndicator]
  ///  * [encodeAppBarTheme]
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
  ///  * [encodeDataTableThemeData]
  ///  * [encodeDialogTheme]
  ///  * [encodeDividerThemeData]
  ///  * [encodeDrawerThemeData]
  ///  * [encodeElevatedButtonThemeData]
  ///  * [encodeFloatingActionButtonThemeData]
  ///  * [encodeIconThemeData]
  ///  * [encodeInputDecorationTheme]
  ///  * [encodeInteractiveInkFeatureFactory]
  ///  * [encodeListTileThemeData]
  ///  * [encodeMaterialBannerThemeData]
  ///  * [encodeMaterialTapTargetSize]
  ///  * [encodeNavigationBarThemeData]
  ///  * [encodeNavigationRailThemeData]
  ///  * [encodeOutlinedButtonThemeData]
  ///  * [encodePopupMenuThemeData]
  ///  * [encodeRadioThemeData]
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
        'androidOverscrollIndicator': encodeAndroidOverscrollIndicator(
          // ignore: deprecated_member_use
          value.androidOverscrollIndicator,
        ),
        'appBarTheme': encodeAppBarTheme(value.appBarTheme),
        'applyElevationOverlayColor': value.applyElevationOverlayColor,
        'bannerTheme': encodeMaterialBannerThemeData(value.bannerTheme),
        'backgroundColor': encodeColor(value.backgroundColor),
        'bottomAppBarColor': encodeColor(value.bottomAppBarColor),
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
        'cupertinoOverrideTheme': encodeCupertinoThemeData(
          value.cupertinoOverrideTheme,
        ),
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
        'errorColor': encodeColor(value.errorColor),
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
        'listTileTheme': encodeListTileThemeData(value.listTileTheme),
        'materialTapTargetSize': encodeMaterialTapTargetSize(
          value.materialTapTargetSize,
        ),
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
        'secondaryHeaderColor': encodeColor(value.secondaryHeaderColor),
        'selectedRowColor': encodeColor(value.selectedRowColor),
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
        'toggleableActiveColor': encodeColor(value.toggleableActiveColor),
        'tooltipTheme': encodeTooltipThemeData(value.tooltipTheme),
        'typography': encodeTypography(value.typography),
        'unselectedWidgetColor': encodeColor(value.unselectedWidgetColor),
        'useMaterial3': value.useMaterial3,
        'visualDensity': encodeVisualDensity(value.visualDensity),
      };
    }

    return _stripNull(result);
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
  static Map<String, dynamic>? encodeTimePickerThemeData(
    TimePickerThemeData? value,
  ) {
    Map<String, dynamic>? result;

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

    return _stripNull(result);
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
  static Map<String, dynamic>? encodeToolbarOptions(ToolbarOptions? value) {
    Map<String, dynamic>? result;
    if (value != null) {
      result = {
        'copy': value.copy,
        'cut': value.cut,
        'paste': value.paste,
        'selectAll': value.selectAll,
      };
    }

    return _stripNull(result);
  }

  /// Encodes the given [value] to a JSON compatible Map.  The returned returned
  /// value will have the following structure.
  ///
  /// ```json
  /// {
  ///   "enableFeedback": <bool>,
  ///   "excludeFromSemantics": <bool>,
  ///   "height": <double>,
  ///   "margin": <EdgeInsetsGeometry>,
  ///   "padding": <EdgeInsetsGeometry>,
  ///   "preferBelow": <bool>
  ///   "showDuration": <int; millis>,
  ///   "textStyle": <TextStyle>,
  ///   "triggerMode": <TooltipTriggerMode>,
  ///   "verticalOffset": <double>,
  ///   "waitDuration": <int; millis>,
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
        'textStyle': encodeTextStyle(value.textStyle),
        'triggerMode': encodeTooltipTriggerMode(value.triggerMode),
        'verticalOffset': value.verticalOffset,
        'waitDuration': value.waitDuration?.inMilliseconds,
      };
    }

    return _stripNull(result);
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

    return result;
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

    return _stripNull(result);
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

    return result;
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

    return result;
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

    return result;
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

    return result;
  }

  static Map<String, dynamic>? _stripNull(Map<String, dynamic>? input) {
    Map<String, dynamic>? result;

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
