import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'package:json_theme_annotation/json_theme_annotation.dart';

part 'theme_encoder.functions.dart';
part 'theme_encoder.g.dart';

/// Encoder capable of converting Flutter Theme related classes and enums into
/// JSON compatible values.
///
/// Unless otherwise stated, each function will return `null` when given an
/// input of `null`.
@immutable
@JsonThemeCodec(CodecMode.encode)
abstract class _ThemeEncoder extends _ThemeEncoderFunctions {
  const _ThemeEncoder._();

  Map<String, dynamic>? encodeActionIconThemeData(ActionIconThemeData? value);

  String? encodeAndroidOverscrollIndicator(AndroidOverscrollIndicator? value);

  @CodecEnum()
  String? encodeAnimationStyle(AnimationStyle? value);

  @CodecIgnore('color')
  Map<String, dynamic>? encodeAppBarThemeData(AppBarThemeData? value);

  String? encodeAutovalidateMode(AutovalidateMode? value) => value?.name;

  String? encodeAxis(Axis? value);

  Map<String, dynamic>? encodeBadgeThemeData(BadgeThemeData? value);

  String? encodeBlendMode(BlendMode? value);

  String? encodeBlurStyle(BlurStyle? value);

  Map<String, dynamic>? encodeBorderSide(BorderSide? value);

  String? encodeBorderStyle(BorderStyle? value);

  Map<String, dynamic>? encodeBottomAppBarThemeData(
    BottomAppBarThemeData? value,
  );

  Map<String, dynamic>? encodeBottomNavigationBarThemeData(
    BottomNavigationBarThemeData? value,
  );

  String? encodeBottomNavigationBarLandscapeLayout(
    BottomNavigationBarLandscapeLayout? value,
  );

  String? encodeBottomNavigationBarType(BottomNavigationBarType? value);

  Map<String, dynamic>? encodeBottomSheetThemeData(BottomSheetThemeData? value);

  Map<String, dynamic>? encodeBoxBorder(BoxBorder? value);

  Map<String, dynamic>? encodeBoxConstraints(BoxConstraints? value);

  Map<String, dynamic>? encodeBoxDecoration(BoxDecoration? value);

  String? encodeBoxFit(BoxFit? value);

  String? encodeBoxHeightStyle(BoxHeightStyle? value);

  Map<String, dynamic>? encodeBoxShadow(BoxShadow? value);

  String? encodeBoxShape(BoxShape? value);

  String? encodeBoxWidthStyle(BoxWidthStyle? value);

  String? encodeBrightness(Brightness? value);

  String? encodeButtonBarLayoutBehavior(ButtonBarLayoutBehavior? value);

  Map<String, dynamic>? encodeButtonStyle(ButtonStyle? value);

  String? encodeButtonTextTheme(ButtonTextTheme? value);

  @CodecIgnore('buttonColor')
  @CodecIgnore('disabledColor')
  @CodecIgnore('focusColor')
  @CodecIgnore('highlightColor')
  @CodecIgnore('hoverColor')
  @CodecIgnore('materialTapTargetSize')
  @CodecIgnore('splashColor')
  Map<String, dynamic>? encodeButtonThemeData(ButtonThemeData? value);

  Map<String, dynamic>? encodeCardThemeData(CardThemeData? value);

  Map<String, dynamic>? encodeCheckboxThemeData(
    CheckboxThemeData? value, {
    bool validate = true,
  });

  Map<String, dynamic>? encodeChipThemeData(ChipThemeData? value);

  String? encodeClip(Clip? value);

  Map<String, dynamic>? encodeColorScheme(ColorScheme? value);

  String? encodeCrossAxisAlignment(CrossAxisAlignment? value);

  String? encodeCrossFadeState(CrossFadeState? value);

  @CodecIgnore('primaryColor')
  Map<String, dynamic>? encodeCupertinoTextThemeData(
    CupertinoTextThemeData? value,
  );

  Map<String, dynamic>? encodeCupertinoThemeData(
    NoDefaultCupertinoThemeData? value,
  );

  Map<String, dynamic>? encodeDatePickerThemeData(DatePickerThemeData? value);

  Map<String, dynamic>? encodeDataTableThemeData(DataTableThemeData? value);

  @CodecIgnore('colorFilter')
  Map<String, dynamic>? encodeDecorationImage(DecorationImage? value);

  String? encodeDecorationPosition(DecorationPosition? value);

  Map<String, dynamic>? encodeDialogThemeData(DialogThemeData? value);

  String? encodeDismissDirection(DismissDirection? value);

  Map<String, dynamic>? encodeDividerThemeData(DividerThemeData? value);

  String? encodeDragStartBehavior(DragStartBehavior? value);

  Map<String, dynamic>? encodeDrawerThemeData(DrawerThemeData? value);

  Map<String, dynamic>? encodeDropdownMenuThemeData(
    DropdownMenuThemeData? value,
  );

  Map<String, dynamic>? encodeEdgeInsets(EdgeInsets? value);

  Map<String, dynamic>? encodeEdgeInsetsDirectional(
    EdgeInsetsDirectional? value,
  );

  Map<String, dynamic>? encodeElevatedButtonThemeData(
    ElevatedButtonThemeData? value,
  );

  Map<String, dynamic>? encodeExpansionTileThemeData(
    ExpansionTileThemeData? value,
  );

  Map<String, dynamic>? encodeFilledButtonThemeData(
    FilledButtonThemeData? value,
  );

  String? encodeFilterQuality(FilterQuality? value);

  String? encodeFlexFit(FlexFit? value);

  @CodecEnum()
  String? encodeFloatingActionButtonAnimator(
    FloatingActionButtonAnimator? value,
  );

  @CodecEnum()
  String? encodeFloatingActionButtonLocation(
    FloatingActionButtonLocation? value,
  );

  Map<String, dynamic>? encodeFloatingActionButtonThemeData(
    FloatingActionButtonThemeData? value,
  );

  @CodecEnum()
  String? encodeFloatingLabelAlignment(FloatingLabelAlignment? value);

  String? encodeFloatingLabelBehavior(FloatingLabelBehavior? value);

  Map<String, dynamic>? encodeFontFeature(FontFeature? value);

  String? encodeFontStyle(FontStyle? value);

  @CodecEnum()
  @CodecIgnore('bold')
  @CodecIgnore('normal')
  String? encodeFontWeight(FontWeight? value);

  Map<String, dynamic>? encodeFontVariation(FontVariation? value);

  String? encodeHitTestBehavior(HitTestBehavior? value);

  @CodecUnencodable('key')
  Map<String, dynamic>? encodeIcon(Icon? value);

  String? encodeIconAlignment(IconAlignment? value);

  Map<String, dynamic>? encodeIconButtonThemeData(IconButtonThemeData? value);

  Map<String, dynamic>? encodeIconData(IconData? value);

  Map<String, dynamic>? encodeIconThemeData(IconThemeData? value);

  String? encodeImageRepeat(ImageRepeat? value);

  Map<String, dynamic>? encodeInputDecorationThemeData(
    InputDecorationThemeData? value,
  );

  String? encodeListTileControlAffinity(ListTileControlAffinity? value);

  String? encodeListTileStyle(ListTileStyle? value);

  String? encodeListTileTitleAlignment(ListTileTitleAlignment? value);

  Map<String, dynamic>? encodeListTileThemeData(ListTileThemeData? value);

  String? encodeMainAxisAlignment(MainAxisAlignment? value);

  String? encodeMainAxisSize(MainAxisSize? value);

  Map<String, dynamic>? encodeMaterialBannerThemeData(
    MaterialBannerThemeData? value,
  );

  String? encodeMaterialTapTargetSize(MaterialTapTargetSize? value);

  String? encodeMaterialType(MaterialType? value);

  String? encodeMaxLengthEnforcement(
    MaxLengthEnforcement? value, {
    bool validate = true,
  });

  Map<String, dynamic>? encodeMenuBarThemeData(MenuBarThemeData? value);

  Map<String, dynamic>? encodeMenuButtonThemeData(MenuButtonThemeData? value);

  Map<String, dynamic>? encodeMenuStyle(MenuStyle? value);

  @CodecIgnore('submenuIcon')
  Map<String, dynamic>? encodeMenuThemeData(MenuThemeData? value);

  Map<String, dynamic>? encodeNavigationBarThemeData(
    NavigationBarThemeData? value,
  );

  String? encodeNavigationDestinationLabelBehavior(
    NavigationDestinationLabelBehavior? value, {
    bool validate = true,
  });

  String? encodeNavigationRailLabelType(NavigationRailLabelType? value);

  Map<String, dynamic>? encodeNavigationRailThemeData(
    NavigationRailThemeData? value,
  );

  Map<String, dynamic>? encodeOffset(Offset? value);

  Map<String, dynamic>? encodeOrdinalSortKey(OrdinalSortKey? value);

  Map<String, dynamic>? encodeOutlinedButtonThemeData(
    OutlinedButtonThemeData? value,
  );

  String? encodeOverflowBoxFit(OverflowBoxFit? value);

  String? encodePanAxis(PanAxis? value);

  String? encodePointerDeviceKind(PointerDeviceKind? value);

  String? encodePopupMenuPosition(PopupMenuPosition? value);

  Map<String, dynamic>? encodePopupMenuThemeData(PopupMenuThemeData? value);

  Map<String, dynamic>? encodeProgressIndicatorThemeData(
    ProgressIndicatorThemeData? value, {
    TextDirection direction = TextDirection.ltr,
  });

  Map<String, dynamic>? encodeRadioThemeData(
    RadioThemeData? value, {
    bool validate = true,
  });

  Map<String, dynamic>? encodeRoundRangeSliderThumbShape(
    RoundRangeSliderThumbShape? value,
  );

  Map<String, dynamic>? encodeRoundedRectRangeSliderTrackShape(
    RoundedRectRangeSliderTrackShape? value,
  );

  Map<String, dynamic>? encodeRect(Rect? value);

  Map<String, dynamic>? encodeScrollBehavior(
    ScrollBehavior? value, {
    bool validate = true,
  });

  String? encodeScrollViewKeyboardDismissBehavior(
    ScrollViewKeyboardDismissBehavior? value,
  );

  String? encodeScrollbarOrientation(ScrollbarOrientation? value);

  Map<String, dynamic>? encodeScrollbarThemeData(ScrollbarThemeData? value);

  Map<String, dynamic>? encodeSearchBarThemeData(SearchBarThemeData? value);

  Map<String, dynamic>? encodeSearchViewThemeData(SearchViewThemeData? value);

  Map<String, dynamic>? encodeSemanticsTag(SemanticsTag? value);

  Map<String, dynamic>? encodeShadow(Shadow? value);

  String? encodeShowValueIndicator(ShowValueIndicator? value);

  Map<String, dynamic>? encodeSize(Size? value);

  @CodecIgnore('allowedInteraction')
  Map<String, dynamic>? encodeSliderThemeData(SliderThemeData? value);

  String? encodeSmartDashesType(SmartDashesType? value);

  String? encodeSmartQuotesType(SmartQuotesType? value);

  String? encodeSnackBarBehavior(SnackBarBehavior? value);

  Map<String, dynamic>? encodeSnackBarThemeData(SnackBarThemeData? value);

  String? encodeStackFit(StackFit? value);

  String? encodeStrokeCap(StrokeCap? value);

  @CodecIgnore('package')
  Map<String, dynamic>? encodeStrutStyle(StrutStyle? value);

  @CodecUnencodable('thumbIcon')
  Map<String, dynamic>? encodeSwitchThemeData(
    SwitchThemeData? value, {
    bool validate = true,
  });

  String? encodeTabAlignment(TabAlignment? value);

  String? encodeTabBarIndicatorSize(TabBarIndicatorSize? value);

  Map<String, dynamic>? encodeTabBarThemeData(TabBarThemeData? value);

  String? encodeTabIndicatorAnimation(TabIndicatorAnimation? value);

  Map<String, dynamic>? encodeTableBorder(TableBorder? value);

  String? encodeTargetPlatform(TargetPlatform? value);

  String? encodeTextAlign(TextAlign? value);

  @CodecEnum()
  String? encodeTextAlignVertical(TextAlignVertical? value);

  String? encodeTextBaseline(TextBaseline? value);

  Map<String, dynamic>? encodeTextButtonThemeData(TextButtonThemeData? value);

  String? encodeTextCapitalization(TextCapitalization? value);

  @CodecEnum()
  String? encodeTextDecoration(TextDecoration? value);

  String? encodeTextDecorationStyle(TextDecorationStyle? value);

  String? encodeTextDirection(TextDirection? value);

  String? encodeTextInputAction(TextInputAction? value);

  @CodecEnum()
  String? encodeTextInputType(TextInputType? value);

  Map<String, dynamic>? encodeTextHeightBehavior(TextHeightBehavior? value);

  String? encodeTextLeadingDistribution(TextLeadingDistribution? value);

  String? encodeTextOverflow(TextOverflow? value);

  @CodecEnum()
  String? encodeTextScaler(TextScaler? value);

  Map<String, dynamic>? encodeTextSelectionThemeData(
    TextSelectionThemeData? value,
  );

  @CodecUnencodable('onEnter')
  @CodecUnencodable('onExit')
  @CodecUnencodable('recognizer')
  Map<String, dynamic>? encodeTextSpan(TextSpan? value);

  @CodecUnencodable('background')
  @CodecUnencodable('foreground')
  @CodecUnencodable('package')
  Map<String, dynamic>? encodeTextStyle(TextStyle? value);

  Map<String, dynamic>? encodeTextTheme(TextTheme? value);

  String? encodeTextWidthBasis(TextWidthBasis? value);

  @CodecUnencodable('adaptations')
  // @CodecIgnore('buttonBarTheme')
  // @CodecIgnore('carouselViewTheme')
  // @CodecIgnore('colorSchemeSeed')
  @CodecUnencodable('extensions')
  // @CodecIgnore('indicatorColor')
  Map<String, dynamic>? encodeThemeData(ThemeData? value);

  String? encodeTileMode(TileMode? value);

  Map<String, dynamic>? encodeTimePickerThemeData(TimePickerThemeData? value);

  Map<String, dynamic>? encodeToggleButtonsThemeData(
    ToggleButtonsThemeData? value,
  );

  Map<String, dynamic>? encodeTooltipThemeData(TooltipThemeData? value);

  @CodecEnum()
  String? encodeTooltipTriggerMode(TooltipTriggerMode? value);

  Map<String, dynamic>? encodeTypography(Typography? value);

  @CodecEnum()
  String? encodeVerticalDirection(VerticalDirection? value);

  @CodecEnum()
  @CodecIgnore('adaptivePlatformDensity')
  @CodecIgnore('maximumDensity')
  @CodecIgnore('minimumDensity')
  String? encodeVisualDensity(VisualDensity? value);

  String? encodeWrapAlignment(WrapAlignment? value);

  String? encodeWrapCrossAlignment(WrapCrossAlignment? value);
}
