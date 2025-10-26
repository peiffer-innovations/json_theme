import 'dart:convert';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/cupertino.dart' hide GradientTransform, IconData;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart'
    hide
        FontFeature,
        FontVariation,
        GradientTransform,
        IconData,
        Locale,
        Offset,
        Size;
import 'package:flutter/rendering.dart'
    hide GradientTransform, OrdinalSortKey, SemanticsTag;
import 'package:flutter/services.dart';
import 'package:json_class/json_class.dart';
import 'package:json_theme/json_theme.dart';
import 'package:json_theme/json_theme_schemas.dart';
import 'package:json_theme_annotation/json_theme_annotation.dart';

import '../model/map_widget_state_property.dart';
import 'class_overrides.dart';

part 'theme_decoder.functions.dart';
part 'theme_decoder.g.dart';
part 'theme_decoder.schemas.dart';

const _baseSchemaUrl =
    'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme';

/// Decoder capable of converting JSON compatible values into Flutter Theme
/// related classes and enums.
///
/// All decoder functions, in addition the the type that can be decoded, will
/// accept a value of the returned type and return it unmodified.  However, when
/// mixing JSON compatible values and concrete values, you must disable the JSON
/// Schema validator as it will not be able to validate concrete instances.
///
/// Unless otherwise stated, each function will return `null` when given an
/// input of `null`.
@immutable
@JsonThemeCodec(CodecMode.decode, baseSchemaUrl: _baseSchemaUrl)
abstract class _ThemeDecoder extends _ThemeDecoderFunctions {
  const _ThemeDecoder._();

  ActionIconThemeData? decodeActionIconThemeData(
    dynamic value, {
    bool validate = false,
  });

  @CodecEnum()
  AlignmentDirectional? decodeAlignmentDirectional(
    dynamic value, {
    bool validate = true,
  });

  AndroidOverscrollIndicator? decodeAndroidOverscrollIndicator(
    dynamic value, {
    bool validate = true,
  });

  @CodecEnum()
  AnimationStyle? decodeAnimationStyle(dynamic value, {bool validate = true});

  AppBarThemeData? decodeAppBarThemeData(dynamic value, {bool validate = true});

  AutovalidateMode? decodeAutovalidateMode(
    dynamic value, {
    bool validate = true,
  });

  Axis? decodeAxis(dynamic value, {bool validate = true});

  BadgeThemeData? decodeBadgeThemeData(dynamic value, {bool validate = true});

  BlendMode? decodeBlendMode(dynamic value, {bool validate = true});

  BlurStyle? decodeBlurStyle(dynamic value, {bool validate = true});

  @CodecDefaultValue('strokeAlign', '-1.0')
  BorderSide? decodeBorderSide(dynamic value, {bool validate = true});

  BorderStyle? decodeBorderStyle(dynamic value, {bool validate = true});

  BottomAppBarThemeData? decodeBottomAppBarThemeData(
    dynamic value, {
    bool validate = true,
  });

  BottomNavigationBarThemeData? decodeBottomNavigationBarThemeData(
    dynamic value, {
    bool validate = true,
  });

  BottomNavigationBarLandscapeLayout? decodeBottomNavigationBarLandscapeLayout(
    dynamic value, {
    bool validate = true,
  });

  BottomNavigationBarType? decodeBottomNavigationBarType(
    dynamic value, {
    bool validate = true,
  });

  BottomSheetThemeData? decodeBottomSheetThemeData(
    dynamic value, {
    bool validate = true,
  });

  BoxConstraints? decodeBoxConstraints(dynamic value, {bool validate = true});

  BoxDecoration? decodeBoxDecoration(dynamic value, {bool validate = true});

  BoxFit? decodeBoxFit(dynamic value, {bool validate = true});

  BoxHeightStyle? decodeBoxHeightStyle(dynamic value, {bool validate = false});

  @CodecDefaultValue('color', 'const Color(0xFF000000)')
  BoxShadow? decodeBoxShadow(dynamic value, {bool validate = true});

  BoxShape? decodeBoxShape(dynamic value, {bool validate = true});

  BoxWidthStyle? decodeBoxWidthStyle(dynamic value, {bool validate = false});

  Brightness? decodeBrightness(dynamic value, {bool validate = true});

  ButtonBarLayoutBehavior? decodeButtonBarLayoutBehavior(
    dynamic value, {
    bool validate = true,
  });

  ButtonStyle? decodeButtonStyle(dynamic value, {bool validate = true});

  ButtonTextTheme? decodeButtonTextTheme(dynamic value, {bool validate = true});

  ButtonThemeData? decodeButtonThemeData(dynamic value, {bool validate = true});

  CarouselViewThemeData? decodeCarouselViewThemeData(
    dynamic value, {
    bool validate = true,
  });

  CardThemeData? decodeCardThemeData(dynamic value, {bool validate = true});

  CheckboxThemeData? decodeCheckboxThemeData(
    dynamic value, {
    bool validate = true,
  });

  ChipThemeData? decodeChipThemeData(dynamic value, {bool validate = true});

  Clip? decodeClip(dynamic value, {bool validate = true});

  ColorScheme? decodeColorScheme(dynamic value, {bool validate = true});

  CrossAxisAlignment? decodeCrossAxisAlignment(
    dynamic value, {
    bool validate = true,
  });

  CrossFadeState? decodeCrossFadeState(dynamic value, {bool validate = true});

  CupertinoTextThemeData? decodeCupertinoTextThemeData(
    dynamic value, {
    bool validate = true,
  });

  CupertinoThemeData? decodeCupertinoThemeData(
    dynamic value, {
    bool validate = true,
  });

  DatePickerThemeData? decodeDatePickerThemeData(
    dynamic value, {
    bool validate = true,
  });

  @CodecUnencodable('decoration')
  DataTableThemeData? decodeDataTableThemeData(
    dynamic value, {
    bool validate = true,
  });

  DecorationImage? decodeDecorationImage(dynamic value, {bool validate = true});

  DecorationPosition? decodeDecorationPosition(
    dynamic value, {
    bool validate = true,
  });

  DialogThemeData? decodeDialogThemeData(dynamic value, {bool validate = true});

  DismissDirection? decodeDismissDirection(
    dynamic value, {
    bool validate = true,
  });

  DividerThemeData? decodeDividerThemeData(
    dynamic value, {
    bool validate = true,
  });

  DragStartBehavior? decodeDragStartBehavior(
    dynamic value, {
    bool validate = true,
  });

  DrawerThemeData? decodeDrawerThemeData(dynamic value, {bool validate = true});

  DropdownMenuThemeData? decodeDropdownMenuThemeData(
    dynamic value, {
    bool validate = true,
  });

  ElevatedButtonThemeData? decodeElevatedButtonThemeData(
    dynamic value, {
    bool validate = true,
  });

  ExpansionTileThemeData? decodeExpansionTileThemeData(
    dynamic value, {
    bool validate = true,
  });

  FilledButtonThemeData? decodeFilledButtonThemeData(
    dynamic value, {
    bool validate = true,
  });

  FilterQuality? decodeFilterQuality(dynamic value, {bool validate = true});

  FlexFit? decodeFlexFit(dynamic value, {bool validate = true});

  @CodecEnum()
  FloatingActionButtonAnimator? decodeFloatingActionButtonAnimator(
    dynamic value, {
    bool validate = true,
  });

  @CodecEnum()
  FloatingActionButtonLocation? decodeFloatingActionButtonLocation(
    dynamic value, {
    bool validate = true,
  });

  FloatingActionButtonThemeData? decodeFloatingActionButtonThemeData(
    dynamic value, {
    bool validate = true,
  });

  @CodecEnum()
  FloatingLabelAlignment? decodeFloatingLabelAlignment(
    dynamic value, {
    bool validate = true,
  });

  FloatingLabelBehavior? decodeFloatingLabelBehavior(
    dynamic value, {
    bool validate = true,
  });

  FontFeature? decodeFontFeature(dynamic value, {bool validate = true});

  FontStyle? decodeFontStyle(dynamic value, {bool validate = true});

  @CodecEnum()
  FontWeight? decodeFontWeight(dynamic value, {bool validate = true});

  FontVariation? decodeFontVariation(dynamic value, {bool validate = true});

  GradientTransform? decodeGradientTransform(
    dynamic value, {
    bool validate = true,
  });

  HitTestBehavior? decodeHitTestBehavior(dynamic value, {bool validate = true});

  IconAlignment? decodeIconAlignment(dynamic value, {bool validate = false});

  IconButtonThemeData? decodeIconButtonThemeData(
    dynamic value, {
    bool validate = true,
  });

  IconData? decodeIconData(dynamic value, {bool validate = true});

  IconThemeData? decodeIconThemeData(dynamic value, {bool validate = true});

  ImageRepeat? decodeImageRepeat(dynamic value, {bool validate = true});

  InputDecorationThemeData? decodeInputDecorationThemeData(
    dynamic value, {
    bool validate = true,
  });

  ListTileControlAffinity? decodeListTileControlAffinity(
    dynamic value, {
    bool validate = true,
  });

  ListTileStyle? decodeListTileStyle(dynamic value, {bool validate = true});

  ListTileTitleAlignment? decodeListTileTitleAlignment(
    dynamic value, {
    bool validate = false,
  });

  ListTileThemeData? decodeListTileThemeData(
    dynamic value, {
    bool validate = true,
  });

  Locale? decodeLocale(dynamic value, {bool validate = true});

  MainAxisAlignment? decodeMainAxisAlignment(
    dynamic value, {
    bool validate = true,
  });

  MainAxisSize? decodeMainAxisSize(dynamic value, {bool validate = true});

  MaterialBannerThemeData? decodeMaterialBannerThemeData(
    dynamic value, {
    bool validate = true,
  });

  MaterialTapTargetSize? decodeMaterialTapTargetSize(
    dynamic value, {
    bool validate = true,
  });

  MaterialType? decodeMaterialType(dynamic value, {bool validate = true});

  MaxLengthEnforcement? decodeMaxLengthEnforcement(
    dynamic value, {
    bool validate = true,
  });

  MenuBarThemeData? decodeMenuBarThemeData(
    dynamic value, {
    bool validate = true,
  });

  MenuButtonThemeData? decodeMenuButtonThemeData(
    dynamic value, {
    bool validate = true,
  });

  MenuStyle? decodeMenuStyle(dynamic value, {bool validate = true});

  MenuThemeData? decodeMenuThemeData(dynamic value, {bool validate = true});

  NavigationBarThemeData? decodeNavigationBarThemeData(
    dynamic value, {
    bool validate = true,
  });

  NavigationDestinationLabelBehavior? decodeNavigationDestinationLabelBehavior(
    dynamic value, {
    bool validate = true,
  });

  NavigationDrawerThemeData? decodeNavigationDrawerThemeData(
    dynamic value, {
    bool validate = true,
  });

  NavigationRailLabelType? decodeNavigationRailLabelType(
    dynamic value, {
    bool validate = true,
  });

  NavigationRailThemeData? decodeNavigationRailThemeData(
    dynamic value, {
    bool validate = true,
  });

  Offset? decodeOffset(dynamic value, {bool validate = true});

  OrdinalSortKey? decodeOrdinalSortKey(dynamic value, {bool validate = true});

  OutlinedButtonThemeData? decodeOutlinedButtonThemeData(
    dynamic value, {
    bool validate = true,
  });

  OverflowBoxFit? decodeOverflowBoxFit(dynamic value, {bool validate = true});

  PanAxis? decodePanAxis(dynamic value, {bool validate = true});

  PointerDeviceKind? decodePointerDeviceKind(
    dynamic value, {
    bool validate = true,
  });

  PopupMenuPosition? decodePopupMenuPosition(
    dynamic value, {
    bool validate = true,
  });

  PopupMenuThemeData? decodePopupMenuThemeData(
    dynamic value, {
    bool validate = true,
  });

  ProgressIndicatorThemeData? decodeProgressIndicatorThemeData(
    dynamic value, {
    bool validate = true,
  });

  RadioThemeData? decodeRadioThemeData(dynamic value, {bool validate = true});

  ScrollViewKeyboardDismissBehavior? decodeScrollViewKeyboardDismissBehavior(
    dynamic value, {
    bool validate = true,
  });

  ScrollbarOrientation? decodeScrollbarOrientation(
    dynamic value, {
    bool validate = true,
  });

  ScrollbarThemeData? decodeScrollbarThemeData(
    dynamic value, {
    bool validate = true,
  });

  SearchBarThemeData? decodeSearchBarThemeData(
    dynamic value, {
    bool validate = true,
  });

  SearchViewThemeData? decodeSearchViewThemeData(
    dynamic value, {
    bool validate = true,
  });

  SegmentedButtonThemeData? decodeSegmentedButtonThemeData(
    dynamic value, {
    bool validate = true,
  });

  SemanticsTag? decodeSemanticsTag(dynamic value, {bool validate = true});

  @CodecDefaultValue('color', 'const Color(0xFF000000)')
  Shadow? decodeShadow(dynamic value, {bool validate = true});

  ShowValueIndicator? decodeShowValueIndicator(
    dynamic value, {
    bool validate = true,
  });

  Size? decodeSize(dynamic value, {bool validate = true});

  @CodecEnum()
  SliderComponentShape? decodeSliderComponentShape(
    dynamic value, {
    bool validate = true,
  });

  SliderInteraction? decodeSliderInteraction(
    dynamic value, {
    bool validate = false,
  });

  @CodecUnencodable('thumbSelector')
  SliderThemeData? decodeSliderThemeData(dynamic value, {bool validate = true});

  @CodecEnum()
  SliderTickMarkShape? decodeSliderTickMarkShape(
    dynamic value, {
    bool validate = true,
  });

  SmartDashesType? decodeSmartDashesType(dynamic value, {bool validate = true});

  SmartQuotesType? decodeSmartQuotesType(dynamic value, {bool validate = true});

  SnackBarBehavior? decodeSnackBarBehavior(
    dynamic value, {
    bool validate = true,
  });

  SnackBarThemeData? decodeSnackBarThemeData(
    dynamic value, {
    bool validate = true,
  });

  StackFit? decodeStackFit(dynamic value, {bool validate = true});

  StrokeCap? decodeStrokeCap(dynamic value, {bool validate = true});

  StrutStyle? decodeStrutStyle(dynamic value, {bool validate = true});

  SwitchThemeData? decodeSwitchThemeData(dynamic value, {bool validate = true});

  TabAlignment? decodeTabAlignment(dynamic value, {bool validate = true});

  TabBarIndicatorSize? decodeTabBarIndicatorSize(
    dynamic value, {
    bool validate = true,
  });

  @CodecUnencodable('indicator')
  TabBarThemeData? decodeTabBarThemeData(dynamic value, {bool validate = true});

  TableBorder? decodeTableBorder(dynamic value, {bool validate = true});

  TabIndicatorAnimation? decodeTabIndicatorAnimation(
    dynamic value, {
    bool validate = true,
  });

  TargetPlatform? decodeTargetPlatform(dynamic value, {bool validate = true});

  TextAlign? decodeTextAlign(dynamic value, {bool validate = true});

  @CodecEnum()
  TextAlignVertical? decodeTextAlignVertical(
    dynamic value, {
    bool validate = true,
  });

  TextBaseline? decodeTextBaseline(dynamic value, {bool validate = true});

  TextCapitalization? decodeTextCapitalization(
    dynamic value, {
    bool validate = true,
  });

  @CodecEnum()
  TextDecoration? decodeTextDecoration(dynamic value, {bool validate = true});

  TextDecorationStyle? decodeTextDecorationStyle(
    dynamic value, {
    bool validate = true,
  });

  TextDirection? decodeTextDirection(dynamic value, {bool validate = true});

  TextHeightBehavior? decodeTextHeightBehavior(
    dynamic value, {
    bool validate = true,
  });

  TextInputAction? decodeTextInputAction(dynamic value, {bool validate = true});

  @CodecEnum()
  TextInputType? decodeTextInputType(dynamic value, {bool validate = true});

  TextLeadingDistribution? decodeTextLeadingDistribution(
    dynamic value, {
    bool validate = true,
  });

  TextOverflow? decodeTextOverflow(dynamic value, {bool validate = true});

  @CodecEnum()
  TextScaler? decodeTextScaler(dynamic value, {bool validate = true});

  TextSelectionThemeData? decodeTextSelectionThemeData(
    dynamic value, {
    bool validate = true,
  });

  @CodecUnencodable('recognizer')
  TextSpan? decodeTextSpan(dynamic value, {bool validate = true});

  @CodecUnencodable('background')
  @CodecUnencodable('foreground')
  TextStyle? decodeTextStyle(dynamic value, {bool validate = true});

  TextTheme? decodeTextTheme(dynamic value, {bool validate = true});

  TextWidthBasis? decodeTextWidthBasis(dynamic value, {bool validate = true});

  @CodecIgnore('buttonBarTheme')
  @CodecUnencodable('adaptations')
  @CodecUnencodable('extensions')
  ThemeData? decodeThemeData(dynamic value, {bool validate = true});

  TileMode? decodeTileMode(dynamic value, {bool validate = true});

  TimePickerThemeData? decodeTimePickerThemeData(
    dynamic value, {
    bool validate = true,
  });

  ToggleButtonsThemeData? decodeToggleButtonsThemeData(
    dynamic value, {
    bool validate = true,
  });

  @CodecUnencodable('decoration')
  TooltipThemeData? decodeTooltipThemeData(
    dynamic value, {
    bool validate = true,
  });

  @CodecEnum()
  TooltipTriggerMode? decodeTooltipTriggerMode(
    dynamic value, {
    bool validate = true,
  });

  Typography? decodeTypography(dynamic value, {bool validate = true});

  VerticalDirection? decodeVerticalDirection(
    dynamic value, {
    bool validate = true,
  });

  @CodecEnum()
  @CodecIgnore('maximumDensity')
  @CodecIgnore('minimumDensity')
  VisualDensity? decodeVisualDensity(dynamic value, {bool validate = true});

  WrapAlignment? decodeWrapAlignment(dynamic value, {bool validate = true});

  WrapCrossAlignment? decodeWrapCrossAlignment(
    dynamic value, {
    bool validate = true,
  });
}
