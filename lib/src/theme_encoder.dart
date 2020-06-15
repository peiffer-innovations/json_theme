import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class ThemeEncoder {
  ThemeEncoder._();

  static Map<String, dynamic> encodeAppBarTheme(AppBarTheme value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'actionsIconTheme': encodeIconThemeData(value.actionsIconTheme),
        'brightness': encodeBrightness(value.brightness),
        'color': encodeColor(value.color),
        'elevation': value.elevation,
        'iconTheme': encodeIconThemeData(value.iconTheme),
        'textTheme': encodeTextTheme(value.textTheme),
      };
    }

    return _stripNull(result);
  }

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

  // static Map<String, dynamic> encodeBottomNavigationBarThemeData(
  //   BottomNavigationBarThemeData value,
  // ) {
  //   Map<String, dynamic> result;

  //   if (value != null) {
  //     result = <String, dynamic>{
  //       'backgroundColor': encodeColor(value.backgroundColor),
  //       'elevation': value.elevation,
  //       'selectedIconTheme': encodeIconThemeData(value.selectedIconTheme),
  //       'selectedItemColor': encodeColor(value.selectedItemColor),
  //       'selectedLabelStyle': encodeTextStyle(value.selectedLabelStyle),
  //       'showSelectedLabels': value.showSelectedLabels,
  //       'showUnselectedLabels': value.showUnselectedLabels,
  //       'type': encodeBottomNavigationBarType(value.type),
  //     };
  //   }

  //   return _stripNull(result);
  // }

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
        'layoutBehavior': encodeButtonLayoutBehavior(value.layoutBehavior),
        'mainAxisSize': encodeMainAxisSize(value.mainAxisSize),
        'overflowDirection': encodeVerticalDirection(value.overflowDirection),
      };
    }

    return _stripNull(result);
  }

  static String encodeButtonLayoutBehavior(ButtonBarLayoutBehavior value) {
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

  static Map<String, dynamic> encodeButtonThemeData(ButtonThemeData value) {
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'alignedDropdown': value.alignedDropdown,
        'colorScheme': encodeColorScheme(value.colorScheme),
        'height': value.height,
        'layoutBehavior': encodeButtonLayoutBehavior(value.layoutBehavior),
        'minWidth': value.minWidth,
        'padding': encodeEdgeInsetsGeometry(value.padding),
        'shape': encodeShapeBorder(value.shape),
        'textTheme': encodeButtonTextTheme(value.textTheme),
      };
    }

    return _stripNull(result);
  }

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

  static String encodeColor(Color value) {
    String result;

    if (value != null) {
      var hex = value.value.toRadixString(16).padLeft(8, '0');
      result = '#$hex';
    }

    return result;
  }

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

  static String encodeNotchedShape(NotchedShape value) {
    assert(value == null || value is CircularNotchedRectangle);
    String result;

    if (value != null) {
      result = 'circular';
    }

    return result;
  }

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

  static Map<String, dynamic> encodeRangeSliderThumbShape(
    RoundRangeSliderThumbShape value,
  ) {
    assert(value == null || value is RoundRangeSliderThumbShape);
    Map<String, dynamic> result;

    if (value != null) {
      result = <String, dynamic>{
        'disabledThumbRadius': value.disabledThumbRadius,
        // 'elevation': value.elevation,
        'enabledThumbRadius': value.enabledThumbRadius,
        // 'pressedElevation': value.pressedElevation,
        'type': 'round',
      };
    }

    return _stripNull(result);
  }

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

  static String encodeRangeSliderValueIndicatorShape(
    RangeSliderValueIndicatorShape value,
  ) {
    assert(value == null || value is PaddleRangeSliderValueIndicatorShape
        // ||
        // value is RectangularRangeSliderValueIndicatorShape
        );
    String result;

    if (value != null) {
      if (value is PaddleRangeSliderValueIndicatorShape) {
        result = 'paddle';
        // } else if (value is RectangularRangeSliderValueIndicatorShape) {
        //   result = 'rectangular';
      }
    }

    return result;
  }

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
            : value.shadows.map(
                (value) => encodeShadow(value),
              ),
        'textBaseline': encodeTextBaseline(value.textBaseline),
        'wordSpacing': value.wordSpacing,
      };
    }

    return _stripNull(result);
  }

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
        // 'bottomNavigationBarTheme': encodeBottomNavigationBarThemeData(
        //   value.bottomNavigationBarTheme,
        // ),
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
        'cursorColor': encodeColor(value.cursorColor),
        'dialogBackgroundColor': encodeColor(value.dialogBackgroundColor),
        'dialogTheme': encodeDialogTheme(value.dialogTheme),
        'disabledColor': encodeColor(value.disabledColor),
        'dividerColor': encodeColor(value.dividerColor),
        'dividerTheme': encodeDividerThemeData(value.dividerTheme),
        'errorColor': encodeColor(value.errorColor),
        // 'fixTextFieldOutlineLabel': value.fixTextFieldOutlineLabel,
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
        'textSelectionColor': encodeColor(value.textSelectionColor),
        'textSelectionHandleColor': encodeColor(value.textSelectionHandleColor),
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
}
