import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_class/json_class.dart';
import 'package:json_theme/json_theme.dart';
import 'package:logging/logging.dart';

import 'base64_image.dart';

const _kColor = Color(0x00123456);
const _kColorStr = '#00123456';
const _kTextStyle = TextStyle(color: _kColor);
const _kTextStyleJson = {'color': _kColorStr, 'inherit': true};

void main() {
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: ${record.message}');
    if (record.error != null) {
      debugPrint('${record.error}');
    }
    if (record.stackTrace != null) {
      debugPrint('${record.stackTrace}');
    }
  });

  test('Alignment', () {
    expect(ThemeDecoder.decodeAlignment(null), null);
    expect(ThemeEncoder.encodeAlignment(null), null);

    expect(
      ThemeDecoder.decodeAlignment(Alignment.bottomCenter),
      Alignment.bottomCenter,
    );

    expect(
      ThemeDecoder.decodeAlignment({'x': 0.2, 'y': 0.4}),
      const Alignment(0.2, 0.4),
    );
    expect(ThemeEncoder.encodeAlignment(const Alignment(0.2, 0.4)), {
      'x': 0.2,
      'y': 0.4,
    });

    expect(
      ThemeDecoder.decodeAlignment('bottomCenter'),
      Alignment.bottomCenter,
    );
    expect(ThemeDecoder.decodeAlignment('bottomLeft'), Alignment.bottomLeft);
    expect(ThemeDecoder.decodeAlignment('bottomRight'), Alignment.bottomRight);

    expect(ThemeDecoder.decodeAlignment('center'), Alignment.center);
    expect(ThemeDecoder.decodeAlignment('centerLeft'), Alignment.centerLeft);
    expect(ThemeDecoder.decodeAlignment('centerRight'), Alignment.centerRight);

    expect(ThemeDecoder.decodeAlignment('topCenter'), Alignment.topCenter);
    expect(ThemeDecoder.decodeAlignment('topLeft'), Alignment.topLeft);
    expect(ThemeDecoder.decodeAlignment('topRight'), Alignment.topRight);

    expect(
      ThemeEncoder.encodeAlignment(Alignment.bottomCenter),
      'bottomCenter',
    );
    expect(ThemeEncoder.encodeAlignment(Alignment.bottomLeft), 'bottomLeft');
    expect(ThemeEncoder.encodeAlignment(Alignment.bottomRight), 'bottomRight');

    expect(ThemeEncoder.encodeAlignment(Alignment.center), 'center');
    expect(ThemeEncoder.encodeAlignment(Alignment.centerLeft), 'centerLeft');
    expect(ThemeEncoder.encodeAlignment(Alignment.centerRight), 'centerRight');

    expect(ThemeEncoder.encodeAlignment(Alignment.topCenter), 'topCenter');
    expect(ThemeEncoder.encodeAlignment(Alignment.topLeft), 'topLeft');
    expect(ThemeEncoder.encodeAlignment(Alignment.topRight), 'topRight');
  });

  test('AlignmentDirectional', () {
    expect(ThemeDecoder.decodeAlignmentDirectional(null), null);
    expect(ThemeEncoder.encodeAlignmentDirectional(null), null);

    expect(
      ThemeDecoder.decodeAlignmentDirectional(
        AlignmentDirectional.bottomCenter,
      ),
      AlignmentDirectional.bottomCenter,
    );

    expect(
      ThemeDecoder.decodeAlignmentDirectional('bottomCenter'),
      AlignmentDirectional.bottomCenter,
    );
    expect(
      ThemeDecoder.decodeAlignmentDirectional('bottomEnd'),
      AlignmentDirectional.bottomEnd,
    );
    expect(
      ThemeDecoder.decodeAlignmentDirectional('bottomStart'),
      AlignmentDirectional.bottomStart,
    );

    expect(
      ThemeDecoder.decodeAlignmentDirectional('center'),
      AlignmentDirectional.center,
    );
    expect(
      ThemeDecoder.decodeAlignmentDirectional('centerEnd'),
      AlignmentDirectional.centerEnd,
    );
    expect(
      ThemeDecoder.decodeAlignmentDirectional('centerStart'),
      AlignmentDirectional.centerStart,
    );

    expect(
      ThemeDecoder.decodeAlignmentDirectional('topCenter'),
      AlignmentDirectional.topCenter,
    );
    expect(
      ThemeDecoder.decodeAlignmentDirectional('topEnd'),
      AlignmentDirectional.topEnd,
    );
    expect(
      ThemeDecoder.decodeAlignmentDirectional('topStart'),
      AlignmentDirectional.topStart,
    );

    expect(
      ThemeEncoder.encodeAlignmentDirectional(
        AlignmentDirectional.bottomCenter,
      ),
      'bottomCenter',
    );
    expect(
      ThemeEncoder.encodeAlignmentDirectional(AlignmentDirectional.bottomEnd),
      'bottomEnd',
    );
    expect(
      ThemeEncoder.encodeAlignmentDirectional(AlignmentDirectional.bottomStart),
      'bottomStart',
    );

    expect(
      ThemeEncoder.encodeAlignmentDirectional(AlignmentDirectional.center),
      'center',
    );
    expect(
      ThemeEncoder.encodeAlignmentDirectional(AlignmentDirectional.centerEnd),
      'centerEnd',
    );
    expect(
      ThemeEncoder.encodeAlignmentDirectional(AlignmentDirectional.centerStart),
      'centerStart',
    );

    expect(
      ThemeEncoder.encodeAlignmentDirectional(AlignmentDirectional.topCenter),
      'topCenter',
    );
    expect(
      ThemeEncoder.encodeAlignmentDirectional(AlignmentDirectional.topEnd),
      'topEnd',
    );
    expect(
      ThemeEncoder.encodeAlignmentDirectional(AlignmentDirectional.topStart),
      'topStart',
    );
  });

  test('AlignmentGeometry', () {
    expect(ThemeDecoder.decodeAlignmentGeometry(null), null);
    expect(ThemeEncoder.encodeAlignmentGeometry(null), null);

    expect(
      ThemeDecoder.decodeAlignmentGeometry(Alignment.bottomCenter),
      Alignment.bottomCenter,
    );

    expect(
      ThemeDecoder.decodeAlignmentGeometry({'x': 0.2, 'y': 0.4}),
      const Alignment(0.2, 0.4),
    );
    expect(ThemeEncoder.encodeAlignmentGeometry(const Alignment(0.2, 0.4)), {
      'x': 0.2,
      'y': 0.4,
    });

    expect(
      ThemeDecoder.decodeAlignmentGeometry('bottomCenter'),
      Alignment.bottomCenter,
    );
    expect(
      ThemeDecoder.decodeAlignmentGeometry('bottomLeft'),
      Alignment.bottomLeft,
    );
    expect(
      ThemeDecoder.decodeAlignmentGeometry('bottomRight'),
      Alignment.bottomRight,
    );

    expect(ThemeDecoder.decodeAlignmentGeometry('center'), Alignment.center);
    expect(
      ThemeDecoder.decodeAlignmentGeometry('centerLeft'),
      Alignment.centerLeft,
    );
    expect(
      ThemeDecoder.decodeAlignmentGeometry('centerRight'),
      Alignment.centerRight,
    );

    expect(
      ThemeDecoder.decodeAlignmentGeometry('topCenter'),
      Alignment.topCenter,
    );
    expect(ThemeDecoder.decodeAlignmentGeometry('topLeft'), Alignment.topLeft);
    expect(
      ThemeDecoder.decodeAlignmentGeometry('topRight'),
      Alignment.topRight,
    );

    expect(
      ThemeEncoder.encodeAlignmentGeometry(Alignment.bottomCenter),
      'bottomCenter',
    );
    expect(
      ThemeEncoder.encodeAlignmentGeometry(Alignment.bottomLeft),
      'bottomLeft',
    );
    expect(
      ThemeEncoder.encodeAlignmentGeometry(Alignment.bottomRight),
      'bottomRight',
    );

    expect(ThemeEncoder.encodeAlignmentGeometry(Alignment.center), 'center');
    expect(
      ThemeEncoder.encodeAlignmentGeometry(Alignment.centerLeft),
      'centerLeft',
    );
    expect(
      ThemeEncoder.encodeAlignmentGeometry(Alignment.centerRight),
      'centerRight',
    );

    expect(
      ThemeEncoder.encodeAlignmentGeometry(Alignment.topCenter),
      'topCenter',
    );
    expect(ThemeEncoder.encodeAlignmentGeometry(Alignment.topLeft), 'topLeft');
    expect(
      ThemeEncoder.encodeAlignmentGeometry(Alignment.topRight),
      'topRight',
    );

    expect(
      ThemeDecoder.decodeAlignmentGeometry(AlignmentDirectional.bottomCenter),
      AlignmentDirectional.bottomCenter,
    );

    expect(
      ThemeDecoder.decodeAlignmentGeometry('bottomEnd'),
      AlignmentDirectional.bottomEnd,
    );
    expect(
      ThemeDecoder.decodeAlignmentGeometry('bottomStart'),
      AlignmentDirectional.bottomStart,
    );
    expect(
      ThemeDecoder.decodeAlignmentGeometry('centerEnd'),
      AlignmentDirectional.centerEnd,
    );
    expect(
      ThemeDecoder.decodeAlignmentGeometry('centerStart'),
      AlignmentDirectional.centerStart,
    );
    expect(
      ThemeDecoder.decodeAlignmentGeometry('topEnd'),
      AlignmentDirectional.topEnd,
    );
    expect(
      ThemeDecoder.decodeAlignmentGeometry('topStart'),
      AlignmentDirectional.topStart,
    );

    expect(
      ThemeEncoder.encodeAlignmentGeometry(AlignmentDirectional.bottomCenter),
      'bottomCenter',
    );
    expect(
      ThemeEncoder.encodeAlignmentGeometry(AlignmentDirectional.bottomEnd),
      'bottomEnd',
    );
    expect(
      ThemeEncoder.encodeAlignmentGeometry(AlignmentDirectional.bottomStart),
      'bottomStart',
    );

    expect(
      ThemeEncoder.encodeAlignmentGeometry(AlignmentDirectional.center),
      'center',
    );
    expect(
      ThemeEncoder.encodeAlignmentGeometry(AlignmentDirectional.centerEnd),
      'centerEnd',
    );
    expect(
      ThemeEncoder.encodeAlignmentGeometry(AlignmentDirectional.centerStart),
      'centerStart',
    );

    expect(
      ThemeEncoder.encodeAlignmentGeometry(AlignmentDirectional.topCenter),
      'topCenter',
    );
    expect(
      ThemeEncoder.encodeAlignmentGeometry(AlignmentDirectional.topEnd),
      'topEnd',
    );
    expect(
      ThemeEncoder.encodeAlignmentGeometry(AlignmentDirectional.topStart),
      'topStart',
    );
  });

  test('AndroidOverscrollIndicator', () {
    expect(ThemeDecoder.decodeAndroidOverscrollIndicator(null), null);
    expect(ThemeEncoder.encodeAndroidOverscrollIndicator(null), null);

    expect(
      ThemeDecoder.decodeAndroidOverscrollIndicator(
        AndroidOverscrollIndicator.glow,
      ),
      AndroidOverscrollIndicator.glow,
    );

    expect(
      ThemeDecoder.decodeAndroidOverscrollIndicator('glow'),
      AndroidOverscrollIndicator.glow,
    );
    expect(
      ThemeDecoder.decodeAndroidOverscrollIndicator('stretch'),
      AndroidOverscrollIndicator.stretch,
    );

    expect(
      ThemeEncoder.encodeAndroidOverscrollIndicator(
        AndroidOverscrollIndicator.glow,
      ),
      'glow',
    );
    expect(
      ThemeEncoder.encodeAndroidOverscrollIndicator(
        AndroidOverscrollIndicator.stretch,
      ),
      'stretch',
    );
  });

  test('AnimationStyle', () {
    expect(ThemeDecoder.decodeAnimationStyle(null), null);
    expect(ThemeEncoder.encodeAnimationStyle(null), null);

    expect(
      ThemeDecoder.decodeAnimationStyle(AnimationStyle.noAnimation),
      AnimationStyle.noAnimation,
    );

    expect(
      ThemeDecoder.decodeAnimationStyle('noAnimation'),
      AnimationStyle.noAnimation,
    );

    expect(
      ThemeEncoder.encodeAnimationStyle(AnimationStyle.noAnimation),
      'noAnimation',
    );
  });

  test('AppBarTheme', () {
    expect(ThemeDecoder.decodeAppBarTheme(null), null);
    expect(ThemeEncoder.encodeAppBarTheme(null), null);

    const entry = AppBarTheme(
      actionsPadding: EdgeInsets.all(8.0),
      color: _kColor,
      centerTitle: true,
      elevation: 6.0,
      foregroundColor: _kColor,
      shadowColor: _kColor,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      toolbarHeight: 64.0,
    );

    expect(ThemeDecoder.decodeAppBarTheme(entry), entry);

    final encoded = ThemeEncoder.encodeAppBarTheme(entry);
    final decoded = ThemeDecoder.decodeAppBarTheme(encoded);

    expect(
      json.encode(encoded),
      json.encode({
        'actionsPadding': {
          'bottom': 8.0,
          'left': 8.0,
          'right': 8.0,
          'top': 8.0,
        },
        'backgroundColor': _kColorStr,
        'centerTitle': true,
        'elevation': 6.0,
        'foregroundColor': _kColorStr,
        'shadowColor': _kColorStr,
        'systemOverlayStyle': 'dark',
        'toolbarHeight': 64.0,
      }),
    );

    expect(decoded, entry);
  });

  test('AutovalidateMode', () {
    expect(ThemeDecoder.decodeAutovalidateMode(null), null);
    expect(ThemeEncoder.encodeAutovalidateMode(null), null);

    expect(
      ThemeDecoder.decodeAutovalidateMode(AutovalidateMode.always),
      AutovalidateMode.always,
    );

    // Test each values from AutovalidateMode enum
    for (var value in AutovalidateMode.values) {
      expect(ThemeDecoder.decodeAutovalidateMode(value.name), value);
      expect(ThemeEncoder.encodeAutovalidateMode(value), value.name);
    }
  });

  test('Axis', () {
    expect(ThemeDecoder.decodeAxis(null), null);
    expect(ThemeEncoder.encodeAxis(null), null);

    expect(ThemeDecoder.decodeAxis(Axis.horizontal), Axis.horizontal);

    expect(ThemeDecoder.decodeAxis('horizontal'), Axis.horizontal);
    expect(ThemeDecoder.decodeAxis('vertical'), Axis.vertical);

    expect(ThemeEncoder.encodeAxis(Axis.horizontal), 'horizontal');
    expect(ThemeEncoder.encodeAxis(Axis.vertical), 'vertical');
  });

  test('BadgeThemeData', () {
    expect(ThemeDecoder.decodeBadgeThemeData(null), null);
    expect(ThemeEncoder.encodeBadgeThemeData(null), null);

    const entry = BadgeThemeData(
      alignment: Alignment.bottomCenter,
      backgroundColor: _kColor,
      largeSize: 20.0,
      offset: Offset(10.0, 20.0),
      padding: EdgeInsets.all(16.0),
      smallSize: 10.0,
      textColor: _kColor,
      textStyle: TextStyle(fontWeight: FontWeight.w400),
    );

    expect(ThemeDecoder.decodeBadgeThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeBadgeThemeData(entry);

    expect(encoded, {
      'alignment': 'bottomCenter',
      'backgroundColor': _kColorStr,
      'largeSize': 20.0,
      'offset': {'dx': 10.0, 'dy': 20.0},
      'padding': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0},
      'smallSize': 10.0,
      'textColor': _kColorStr,
      'textStyle': {'fontWeight': 'w400', 'inherit': true},
    });
  });
  test('BlendMode', () {
    expect(ThemeDecoder.decodeBlendMode(null), null);
    expect(ThemeEncoder.encodeBlendMode(null), null);

    expect(ThemeDecoder.decodeBlendMode(BlendMode.clear), BlendMode.clear);

    expect(ThemeDecoder.decodeBlendMode('clear'), BlendMode.clear);
    expect(ThemeDecoder.decodeBlendMode('color'), BlendMode.color);
    expect(ThemeDecoder.decodeBlendMode('colorBurn'), BlendMode.colorBurn);
    expect(ThemeDecoder.decodeBlendMode('colorDodge'), BlendMode.colorDodge);
    expect(ThemeDecoder.decodeBlendMode('darken'), BlendMode.darken);
    expect(ThemeDecoder.decodeBlendMode('difference'), BlendMode.difference);
    expect(ThemeDecoder.decodeBlendMode('dst'), BlendMode.dst);
    expect(ThemeDecoder.decodeBlendMode('dstATop'), BlendMode.dstATop);
    expect(ThemeDecoder.decodeBlendMode('dstIn'), BlendMode.dstIn);
    expect(ThemeDecoder.decodeBlendMode('dstOut'), BlendMode.dstOut);
    expect(ThemeDecoder.decodeBlendMode('dstOver'), BlendMode.dstOver);
    expect(ThemeDecoder.decodeBlendMode('exclusion'), BlendMode.exclusion);
    expect(ThemeDecoder.decodeBlendMode('hardLight'), BlendMode.hardLight);
    expect(ThemeDecoder.decodeBlendMode('hue'), BlendMode.hue);
    expect(ThemeDecoder.decodeBlendMode('lighten'), BlendMode.lighten);
    expect(ThemeDecoder.decodeBlendMode('luminosity'), BlendMode.luminosity);
    expect(ThemeDecoder.decodeBlendMode('modulate'), BlendMode.modulate);
    expect(ThemeDecoder.decodeBlendMode('multiply'), BlendMode.multiply);
    expect(ThemeDecoder.decodeBlendMode('overlay'), BlendMode.overlay);
    expect(ThemeDecoder.decodeBlendMode('plus'), BlendMode.plus);
    expect(ThemeDecoder.decodeBlendMode('saturation'), BlendMode.saturation);
    expect(ThemeDecoder.decodeBlendMode('screen'), BlendMode.screen);
    expect(ThemeDecoder.decodeBlendMode('softLight'), BlendMode.softLight);
    expect(ThemeDecoder.decodeBlendMode('src'), BlendMode.src);
    expect(ThemeDecoder.decodeBlendMode('srcATop'), BlendMode.srcATop);
    expect(ThemeDecoder.decodeBlendMode('srcIn'), BlendMode.srcIn);
    expect(ThemeDecoder.decodeBlendMode('srcOut'), BlendMode.srcOut);
    expect(ThemeDecoder.decodeBlendMode('srcOver'), BlendMode.srcOver);
    expect(ThemeDecoder.decodeBlendMode('xor'), BlendMode.xor);

    expect(ThemeEncoder.encodeBlendMode(BlendMode.clear), 'clear');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.color), 'color');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.colorBurn), 'colorBurn');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.colorDodge), 'colorDodge');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.darken), 'darken');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.difference), 'difference');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.dst), 'dst');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.dstATop), 'dstATop');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.dstIn), 'dstIn');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.dstOut), 'dstOut');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.dstOver), 'dstOver');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.exclusion), 'exclusion');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.hardLight), 'hardLight');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.hue), 'hue');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.lighten), 'lighten');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.luminosity), 'luminosity');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.modulate), 'modulate');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.multiply), 'multiply');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.overlay), 'overlay');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.plus), 'plus');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.saturation), 'saturation');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.screen), 'screen');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.softLight), 'softLight');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.src), 'src');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.srcATop), 'srcATop');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.srcIn), 'srcIn');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.srcOut), 'srcOut');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.srcOver), 'srcOver');
    expect(ThemeEncoder.encodeBlendMode(BlendMode.xor), 'xor');
  });

  test('BlurStyle', () {
    expect(ThemeDecoder.decodeBlurStyle(null), null);
    expect(ThemeEncoder.encodeBlurStyle(null), null);

    expect(ThemeDecoder.decodeBlurStyle('inner'), BlurStyle.inner);
    expect(ThemeDecoder.decodeBlurStyle('normal'), BlurStyle.normal);
    expect(ThemeDecoder.decodeBlurStyle('inner'), BlurStyle.inner);
    expect(ThemeDecoder.decodeBlurStyle('outer'), BlurStyle.outer);

    expect(ThemeEncoder.encodeBlurStyle(BlurStyle.inner), 'inner');
    expect(ThemeEncoder.encodeBlurStyle(BlurStyle.normal), 'normal');
    expect(ThemeEncoder.encodeBlurStyle(BlurStyle.inner), 'inner');
    expect(ThemeEncoder.encodeBlurStyle(BlurStyle.outer), 'outer');
  });

  test('BorderRadius', () {
    expect(ThemeDecoder.decodeBorderRadius(null), null);
    expect(ThemeEncoder.encodeBorderRadius(null), null);

    final entry = BorderRadius.circular(16.0);

    expect(ThemeDecoder.decodeBorderRadius(entry), entry);

    final encoded = ThemeEncoder.encodeBorderRadius(entry);
    final decoded = ThemeDecoder.decodeBorderRadius(encoded);

    const corner = {'type': 'elliptical', 'x': 16.0, 'y': 16.0};

    expect(encoded, {
      'bottomLeft': corner,
      'bottomRight': corner,
      'topLeft': corner,
      'topRight': corner,
      'type': 'only',
    });

    expect(entry, decoded);

    expect(ThemeDecoder.decodeBorderRadius(16), BorderRadius.circular(16));
  });

  test('BorderSide', () {
    expect(ThemeDecoder.decodeBorderSide(null), null);
    expect(ThemeEncoder.encodeBorderSide(null), null);

    const entry = BorderSide(
      color: _kColor,
      strokeAlign: 3.0,
      style: BorderStyle.solid,
      width: 5.0,
    );

    expect(ThemeDecoder.decodeBorderSide(entry), entry);

    final encoded = ThemeEncoder.encodeBorderSide(entry);
    final decoded = ThemeDecoder.decodeBorderSide(encoded);

    expect(encoded, {
      'color': _kColorStr,
      'strokeAlign': 3.0,
      'style': 'solid',
      'width': 5.0,
    });

    expect(decoded, entry);
  });

  test('BorderStyle', () {
    expect(ThemeDecoder.decodeBorderStyle(null), null);
    expect(ThemeEncoder.encodeBorderStyle(null), null);

    expect(ThemeDecoder.decodeBorderStyle(BorderStyle.none), BorderStyle.none);

    expect(ThemeDecoder.decodeBorderStyle('none'), BorderStyle.none);
    expect(ThemeDecoder.decodeBorderStyle('solid'), BorderStyle.solid);

    expect(ThemeEncoder.encodeBorderStyle(BorderStyle.none), 'none');
    expect(ThemeEncoder.encodeBorderStyle(BorderStyle.solid), 'solid');
  });

  test('BottomAppBarTheme', () {
    expect(ThemeDecoder.decodeBottomAppBarTheme(null), null);
    expect(ThemeEncoder.encodeBottomAppBarTheme(null), null);

    const entry = BottomAppBarTheme(
      color: _kColor,
      elevation: 8.0,
      height: 20.0,
      padding: EdgeInsets.all(16.0),
      shadowColor: _kColor,
      shape: CircularNotchedRectangle(),
      surfaceTintColor: _kColor,
    );

    expect(ThemeDecoder.decodeBottomAppBarTheme(entry), entry);

    final encoded = ThemeEncoder.encodeBottomAppBarTheme(entry);
    final decoded = ThemeDecoder.decodeBottomAppBarTheme(encoded)!;

    expect(encoded, {
      'color': _kColorStr,
      'elevation': 8.0,
      'height': 20.0,
      'padding': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0},
      'shadowColor': _kColorStr,
      'shape': 'circular',
      'surfaceTintColor': _kColorStr,
    });

    expect(decoded.color, entry.color);

    expect(decoded.elevation, entry.elevation);

    expect(decoded.shape?.runtimeType, entry.shape?.runtimeType);
  });

  test('BottomNavigationBarLandscapeLayout', () {
    expect(ThemeDecoder.decodeBottomNavigationBarLandscapeLayout(null), null);
    expect(ThemeEncoder.encodeBottomNavigationBarLandscapeLayout(null), null);

    expect(
      ThemeDecoder.decodeBottomNavigationBarLandscapeLayout(
        BottomNavigationBarLandscapeLayout.centered,
      ),
      BottomNavigationBarLandscapeLayout.centered,
    );

    expect(
      ThemeDecoder.decodeBottomNavigationBarLandscapeLayout('centered'),
      BottomNavigationBarLandscapeLayout.centered,
    );
    expect(
      ThemeDecoder.decodeBottomNavigationBarLandscapeLayout('linear'),
      BottomNavigationBarLandscapeLayout.linear,
    );
    expect(
      ThemeDecoder.decodeBottomNavigationBarLandscapeLayout('spread'),
      BottomNavigationBarLandscapeLayout.spread,
    );

    expect(
      ThemeEncoder.encodeBottomNavigationBarLandscapeLayout(
        BottomNavigationBarLandscapeLayout.centered,
      ),
      'centered',
    );
    expect(
      ThemeEncoder.encodeBottomNavigationBarLandscapeLayout(
        BottomNavigationBarLandscapeLayout.linear,
      ),
      'linear',
    );
    expect(
      ThemeEncoder.encodeBottomNavigationBarLandscapeLayout(
        BottomNavigationBarLandscapeLayout.spread,
      ),
      'spread',
    );
  });

  test('BottomNavigationBarThemeData', () {
    expect(ThemeDecoder.decodeBottomNavigationBarThemeData(null), null);
    expect(ThemeEncoder.encodeBottomNavigationBarThemeData(null), null);

    const entry = BottomNavigationBarThemeData(
      backgroundColor: Color(0xff111111),
      elevation: 1.0,
      selectedIconTheme: IconThemeData(opacity: 0.2),
      selectedItemColor: Color(0xff222222),
      selectedLabelStyle: TextStyle(fontSize: 3.0),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      unselectedIconTheme: IconThemeData(opacity: 0.4),
      unselectedItemColor: Color(0xff333333),
      unselectedLabelStyle: TextStyle(fontSize: 5.0),
    );

    expect(ThemeDecoder.decodeBottomNavigationBarThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeBottomNavigationBarThemeData(entry);
    final decoded = ThemeDecoder.decodeBottomNavigationBarThemeData(encoded);

    expect(encoded, {
      'backgroundColor': '#ff111111',
      'elevation': 1.0,
      'selectedIconTheme': {'opacity': 0.2},
      'selectedItemColor': '#ff222222',
      'selectedLabelStyle': {'fontSize': 3.0, 'inherit': true},
      'showSelectedLabels': true,
      'showUnselectedLabels': true,
      'type': 'fixed',
      'unselectedIconTheme': {'opacity': 0.4},
      'unselectedItemColor': '#ff333333',
      'unselectedLabelStyle': {'fontSize': 5.0, 'inherit': true},
    });

    expect(decoded, entry);
  });

  test('BottomNavigationBarType', () {
    expect(ThemeDecoder.decodeBottomNavigationBarType(null), null);
    expect(ThemeEncoder.encodeBottomNavigationBarType(null), null);

    expect(
      ThemeDecoder.decodeBottomNavigationBarType(BottomNavigationBarType.fixed),
      BottomNavigationBarType.fixed,
    );

    expect(
      ThemeDecoder.decodeBottomNavigationBarType('fixed'),
      BottomNavigationBarType.fixed,
    );
    expect(
      ThemeDecoder.decodeBottomNavigationBarType('shifting'),
      BottomNavigationBarType.shifting,
    );

    expect(
      ThemeEncoder.encodeBottomNavigationBarType(BottomNavigationBarType.fixed),
      'fixed',
    );
    expect(
      ThemeEncoder.encodeBottomNavigationBarType(
        BottomNavigationBarType.shifting,
      ),
      'shifting',
    );
  });

  test('BottomSheetThemeData', () {
    expect(ThemeDecoder.decodeBottomSheetThemeData(null), null);
    expect(ThemeEncoder.encodeBottomSheetThemeData(null), null);

    const entry = BottomSheetThemeData(
      backgroundColor: Color(0xff111111),
      clipBehavior: Clip.antiAlias,
      constraints: BoxConstraints(maxHeight: 40.0),
      dragHandleColor: _kColor,
      dragHandleSize: Size(20.0, 2.0),
      elevation: 12.0,
      modalBackgroundColor: Color(0xff222222),
      modalBarrierColor: Color(0xff333333),
      modalElevation: 18.0,
      shadowColor: _kColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      showDragHandle: true,
      surfaceTintColor: _kColor,
    );

    expect(ThemeDecoder.decodeBottomSheetThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeBottomSheetThemeData(entry);
    final decoded = ThemeDecoder.decodeBottomSheetThemeData(encoded);

    expect(encoded, {
      'backgroundColor': '#ff111111',
      'clipBehavior': 'antiAlias',
      'constraints': {'maxHeight': 40.0, 'minHeight': 0.0, 'minWidth': 0.0},
      'dragHandleColor': _kColorStr,
      'dragHandleSize': {'height': 2.0, 'width': 20.0},
      'elevation': 12.0,
      'modalBackgroundColor': '#ff222222',
      'modalBarrierColor': '#ff333333',
      'modalElevation': 18.0,
      'shadowColor': _kColorStr,
      'shape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 16.0, 'y': 16.0},
          'bottomRight': {'type': 'elliptical', 'x': 16.0, 'y': 16.0},
          'topLeft': {'type': 'elliptical', 'x': 16.0, 'y': 16.0},
          'topRight': {'type': 'elliptical', 'x': 16.0, 'y': 16.0},
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded',
      },
      'showDragHandle': true,
      'surfaceTintColor': _kColorStr,
    });

    expect(
      ThemeEncoder.encodeBottomSheetThemeData(decoded),
      ThemeEncoder.encodeBottomSheetThemeData(entry),
    );
  });

  test('BoxBorder', () {
    expect(ThemeDecoder.decodeBoxBorder(null), null);
    expect(ThemeEncoder.encodeBoxBorder(null), null);

    const entry = Border(
      bottom: BorderSide(color: Color(0xff111111)),
      left: BorderSide(color: Color(0xff222222)),
      right: BorderSide(color: Color(0xff333333)),
      top: BorderSide(color: Color(0xff444444)),
    );

    expect(ThemeDecoder.decodeBoxBorder(entry), entry);

    final encoded = ThemeEncoder.encodeBoxBorder(entry);
    final decoded = ThemeDecoder.decodeBoxBorder(encoded);

    expect(encoded, {
      'bottom': {
        'color': '#ff111111',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'left': {
        'color': '#ff222222',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'right': {
        'color': '#ff333333',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'top': {
        'color': '#ff444444',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
    });

    expect(decoded, entry);

    expect(
      ThemeDecoder.decodeBoxBorder({
        'color': '#000',
        'style': 'solid',
        'width': 1,
      }),
      Border.all(
        color: const Color(0xff000000),
        style: BorderStyle.solid,
        width: 1.0,
      ),
    );
  });

  test('BoxConstraints', () {
    expect(ThemeDecoder.decodeBoxConstraints(null), null);
    expect(ThemeEncoder.encodeBoxConstraints(null), null);

    const entry = BoxConstraints(
      maxHeight: 1000.0,
      maxWidth: 1001.0,
      minHeight: 100.0,
      minWidth: 101.0,
    );

    expect(ThemeDecoder.decodeBoxConstraints(entry), entry);

    final encoded = ThemeEncoder.encodeBoxConstraints(entry);
    final decoded = ThemeDecoder.decodeBoxConstraints(encoded);

    expect(encoded, {
      'maxHeight': 1000.0,
      'maxWidth': 1001.0,
      'minHeight': 100.0,
      'minWidth': 101.0,
    });

    expect(ThemeEncoder.encodeBoxConstraints(const BoxConstraints()), {
      'minHeight': 0.0,
      'minWidth': 0.0,
    });

    expect(decoded, entry);
  });

  test('BoxDecoration', () {
    expect(ThemeDecoder.decodeBoxDecoration(null), null);
    expect(ThemeEncoder.encodeBoxDecoration(null), null);

    final entry = BoxDecoration(
      backgroundBlendMode: BlendMode.colorBurn,
      border: Border.all(color: _kColor),
      borderRadius: BorderRadius.circular(1.0),
      boxShadow: const [
        BoxShadow(blurStyle: BlurStyle.inner, color: Color(0xff111111)),
        BoxShadow(blurStyle: BlurStyle.normal, color: Color(0xff222222)),
      ],
      color: const Color(0xff333333),
      gradient: const RadialGradient(
        colors: [Color(0xff444444), Color(0xff555555)],
      ),
      image: DecorationImage(image: MemoryImage(base64Decode(base64Image))),
      shape: BoxShape.circle,
    );

    expect(ThemeDecoder.decodeBoxDecoration(entry), entry);

    final encoded = ThemeEncoder.encodeBoxDecoration(entry);
    final decoded = ThemeDecoder.decodeBoxDecoration(encoded);

    expect(encoded, {
      'backgroundBlendMode': 'colorBurn',
      'border': {
        'bottom': {
          'color': _kColorStr,
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        },
        'left': {
          'color': _kColorStr,
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        },
        'right': {
          'color': _kColorStr,
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        },
        'top': {
          'color': _kColorStr,
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        },
      },
      'borderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'bottomRight': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'topLeft': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'topRight': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'type': 'only',
      },
      'boxShadow': [
        {
          'blurStyle': 'inner',
          'blurRadius': 0.0,
          'color': '#ff111111',
          'offset': {'dx': 0.0, 'dy': 0.0},
          'spreadRadius': 0.0,
        },
        {
          'blurStyle': 'normal',
          'blurRadius': 0.0,
          'color': '#ff222222',
          'offset': {'dx': 0.0, 'dy': 0.0},
          'spreadRadius': 0.0,
        },
      ],
      'color': '#ff333333',
      'gradient': {
        'center': 'center',
        'colors': ['#ff444444', '#ff555555'],
        'focalRadius': 0.0,
        'radius': 0.5,
        'tileMode': 'clamp',
        'type': 'radial',
      },
      'image': {
        'alignment': 'center',
        'filterQuality': 'medium',
        'image': {'bytes': base64Image, 'scale': 1.0, 'type': 'memory'},
        'invertColors': false,
        'isAntiAlias': false,
        'matchTextDirection': false,
        'opacity': 1.0,
        'repeat': 'noRepeat',
        'scale': 1.0,
      },
      'shape': 'circle',
    });

    expect(ThemeEncoder.encodeBoxDecoration(decoded), encoded);
  });

  test('BoxFit', () {
    expect(ThemeDecoder.decodeBoxFit(null), null);
    expect(ThemeEncoder.encodeBoxFit(null), null);

    expect(ThemeDecoder.decodeBoxFit(BoxFit.contain), BoxFit.contain);

    expect(ThemeDecoder.decodeBoxFit('contain'), BoxFit.contain);
    expect(ThemeDecoder.decodeBoxFit('cover'), BoxFit.cover);
    expect(ThemeDecoder.decodeBoxFit('fill'), BoxFit.fill);
    expect(ThemeDecoder.decodeBoxFit('fitHeight'), BoxFit.fitHeight);
    expect(ThemeDecoder.decodeBoxFit('fitWidth'), BoxFit.fitWidth);
    expect(ThemeDecoder.decodeBoxFit('none'), BoxFit.none);
    expect(ThemeDecoder.decodeBoxFit('scaleDown'), BoxFit.scaleDown);

    expect(ThemeEncoder.encodeBoxFit(BoxFit.contain), 'contain');
    expect(ThemeEncoder.encodeBoxFit(BoxFit.cover), 'cover');
    expect(ThemeEncoder.encodeBoxFit(BoxFit.fill), 'fill');
    expect(ThemeEncoder.encodeBoxFit(BoxFit.fitHeight), 'fitHeight');
    expect(ThemeEncoder.encodeBoxFit(BoxFit.fitWidth), 'fitWidth');
    expect(ThemeEncoder.encodeBoxFit(BoxFit.none), 'none');
    expect(ThemeEncoder.encodeBoxFit(BoxFit.scaleDown), 'scaleDown');
  });

  test('BoxHeightStyle', () {
    expect(ThemeDecoder.decodeBoxHeightStyle(null), null);
    expect(ThemeEncoder.encodeBoxHeightStyle(null), null);

    expect(
      ThemeDecoder.decodeBoxHeightStyle(BoxHeightStyle.max),
      BoxHeightStyle.max,
    );

    expect(
      ThemeDecoder.decodeBoxHeightStyle('includeLineSpacingBottom'),
      BoxHeightStyle.includeLineSpacingBottom,
    );
    expect(
      ThemeDecoder.decodeBoxHeightStyle('includeLineSpacingMiddle'),
      BoxHeightStyle.includeLineSpacingMiddle,
    );
    expect(
      ThemeDecoder.decodeBoxHeightStyle('includeLineSpacingTop'),
      BoxHeightStyle.includeLineSpacingTop,
    );
    expect(ThemeDecoder.decodeBoxHeightStyle('max'), BoxHeightStyle.max);
    expect(ThemeDecoder.decodeBoxHeightStyle('strut'), BoxHeightStyle.strut);
    expect(ThemeDecoder.decodeBoxHeightStyle('tight'), BoxHeightStyle.tight);

    expect(
      ThemeEncoder.encodeBoxHeightStyle(
        BoxHeightStyle.includeLineSpacingBottom,
      ),
      'includeLineSpacingBottom',
    );
    expect(
      ThemeEncoder.encodeBoxHeightStyle(
        BoxHeightStyle.includeLineSpacingMiddle,
      ),
      'includeLineSpacingMiddle',
    );
    expect(
      ThemeEncoder.encodeBoxHeightStyle(BoxHeightStyle.includeLineSpacingTop),
      'includeLineSpacingTop',
    );
    expect(ThemeEncoder.encodeBoxHeightStyle(BoxHeightStyle.max), 'max');
    expect(ThemeEncoder.encodeBoxHeightStyle(BoxHeightStyle.strut), 'strut');
    expect(ThemeEncoder.encodeBoxHeightStyle(BoxHeightStyle.tight), 'tight');
  });

  test('BoxShadow', () {
    expect(ThemeDecoder.decodeBoxShadow(null), null);
    expect(ThemeEncoder.encodeBoxShadow(null), null);

    const entry = BoxShadow(
      blurRadius: 1.0,
      blurStyle: BlurStyle.outer,
      color: _kColor,
      offset: Offset(2.0, 3.0),
      spreadRadius: 4.0,
    );

    expect(ThemeDecoder.decodeBoxShadow(entry), entry);

    final encoded = ThemeEncoder.encodeBoxShadow(entry);
    final decoded = ThemeDecoder.decodeBoxShadow(encoded);

    expect(encoded, {
      'blurRadius': entry.blurRadius,
      'blurStyle': 'outer',
      'color': _kColorStr,
      'offset': {'dx': 2.0, 'dy': 3.0},
      'spreadRadius': entry.spreadRadius,
    });

    expect(decoded, entry);
  });

  test('BoxShape', () {
    expect(ThemeDecoder.decodeBoxShape(null), null);
    expect(ThemeEncoder.encodeBoxShape(null), null);

    expect(ThemeDecoder.decodeBoxShape(BoxShape.circle), BoxShape.circle);

    expect(ThemeDecoder.decodeBoxShape('circle'), BoxShape.circle);
    expect(ThemeDecoder.decodeBoxShape('rectangle'), BoxShape.rectangle);

    expect(ThemeEncoder.encodeBoxShape(BoxShape.circle), 'circle');
    expect(ThemeEncoder.encodeBoxShape(BoxShape.rectangle), 'rectangle');
  });

  test('BoxWidthStyle', () {
    expect(ThemeDecoder.decodeBoxWidthStyle(null), null);
    expect(ThemeEncoder.encodeBoxWidthStyle(null), null);

    expect(
      ThemeDecoder.decodeBoxWidthStyle(BoxWidthStyle.max),
      BoxWidthStyle.max,
    );

    expect(ThemeDecoder.decodeBoxWidthStyle('max'), BoxWidthStyle.max);
    expect(ThemeDecoder.decodeBoxWidthStyle('tight'), BoxWidthStyle.tight);

    expect(ThemeEncoder.encodeBoxWidthStyle(BoxWidthStyle.max), 'max');
    expect(ThemeEncoder.encodeBoxWidthStyle(BoxWidthStyle.tight), 'tight');
  });

  test('Brightness', () {
    expect(ThemeDecoder.decodeBrightness(null), null);
    expect(ThemeEncoder.encodeBrightness(null), null);

    expect(ThemeDecoder.decodeBrightness(Brightness.dark), Brightness.dark);

    expect(ThemeEncoder.encodeBrightness(Brightness.dark), 'dark');
    expect(ThemeEncoder.encodeBrightness(Brightness.light), 'light');

    expect(ThemeDecoder.decodeBrightness('dark'), Brightness.dark);
    expect(ThemeDecoder.decodeBrightness('light'), Brightness.light);
  });

  test('ButtonBarThemeData', () {
    expect(ThemeDecoder.decodeButtonBarThemeData(null), null);
    expect(ThemeEncoder.encodeButtonBarThemeData(null), null);

    // ignore: deprecated_member_use
    const entry = ButtonBarThemeData(
      alignment: MainAxisAlignment.spaceEvenly,
      buttonAlignedDropdown: true,
      buttonHeight: 16.0,
      buttonMinWidth: 17.0,
      buttonPadding: EdgeInsets.all(18.0),
      buttonTextTheme: ButtonTextTheme.accent,
      layoutBehavior: ButtonBarLayoutBehavior.padded,
      mainAxisSize: MainAxisSize.min,
      overflowDirection: VerticalDirection.down,
    );

    expect(ThemeDecoder.decodeButtonBarThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeButtonBarThemeData(entry);
    final decoded = ThemeDecoder.decodeButtonBarThemeData(encoded);

    expect(encoded, {
      'alignment': 'spaceEvenly',
      'buttonAlignedDropdown': true,
      'buttonHeight': 16.0,
      'buttonMinWidth': 17.0,
      'buttonPadding': {
        'bottom': 18.0,
        'left': 18.0,
        'right': 18.0,
        'top': 18.0,
      },
      'buttonTextTheme': 'accent',
      'layoutBehavior': 'padded',
      'mainAxisSize': 'min',
      'overflowDirection': 'down',
    });

    expect(decoded, entry);
  });

  test('ButtonBarLayoutBehavior', () {
    expect(ThemeDecoder.decodeButtonBarLayoutBehavior(null), null);
    expect(ThemeEncoder.encodeButtonBarLayoutBehavior(null), null);

    expect(
      ThemeDecoder.decodeButtonBarLayoutBehavior(
        ButtonBarLayoutBehavior.constrained,
      ),
      ButtonBarLayoutBehavior.constrained,
    );

    expect(
      ThemeDecoder.decodeButtonBarLayoutBehavior('constrained'),
      ButtonBarLayoutBehavior.constrained,
    );
    expect(
      ThemeDecoder.decodeButtonBarLayoutBehavior('padded'),
      ButtonBarLayoutBehavior.padded,
    );

    expect(
      ThemeEncoder.encodeButtonBarLayoutBehavior(
        ButtonBarLayoutBehavior.constrained,
      ),
      'constrained',
    );
    expect(
      ThemeEncoder.encodeButtonBarLayoutBehavior(
        ButtonBarLayoutBehavior.padded,
      ),
      'padded',
    );
  });

  test('ButtonStyle', () {
    expect(ThemeDecoder.decodeButtonStyle(null), null);
    expect(ThemeEncoder.encodeButtonStyle(null), null);

    final entry = ButtonStyle(
      alignment: Alignment.bottomCenter,
      animationDuration: const Duration(milliseconds: 1000),
      backgroundColor: WidgetStateProperty.all(const Color(0xff555555)),
      elevation: WidgetStateProperty.all(1.0),
      enableFeedback: false,
      fixedSize: WidgetStateProperty.all(const Size(50.0, 50.0)),
      foregroundColor: WidgetStateProperty.all(const Color(0xff555555)),
      iconAlignment: IconAlignment.start,
      iconColor: WidgetStateProperty.all(const Color(0xff555555)),
      iconSize: WidgetStateProperty.all(12.0),
      maximumSize: WidgetStateProperty.all(const Size(10.0, 10.0)),
      minimumSize: WidgetStateProperty.all(const Size(100.0, 100.0)),
      mouseCursor: WidgetStateProperty.all(MouseCursor.defer),
      overlayColor: WidgetStateProperty.all(const Color(0xff555555)),
      padding: WidgetStateProperty.all(EdgeInsets.zero),
      shadowColor: WidgetStateProperty.all(const Color(0xff555555)),
      shape: WidgetStateProperty.all(const CircleBorder()),
      side: WidgetStateProperty.all(const BorderSide()),
      tapTargetSize: MaterialTapTargetSize.padded,
      textStyle: WidgetStateProperty.all(const TextStyle()),
      visualDensity: VisualDensity.standard,
    );

    expect(ThemeDecoder.decodeButtonStyle(entry), entry);

    final encoded = ThemeEncoder.encodeButtonStyle(entry);
    final decoded = ThemeDecoder.decodeButtonStyle(encoded);

    expect(encoded, {
      'alignment': 'bottomCenter',
      'animationDuration': 1000,
      'backgroundColor': _materializeState('#ff555555'),
      'elevation': _materializeState(1.0),
      'enableFeedback': false,
      'fixedSize': _materializeState({'height': 50.0, 'width': 50.0}),
      'foregroundColor': _materializeState('#ff555555'),
      'iconAlignment': 'start',
      'iconColor': _materializeState('#ff555555'),
      'iconSize': _materializeState(12.0),
      'maximumSize': _materializeState({'height': 10.0, 'width': 10.0}),
      'minimumSize': _materializeState({'height': 100.0, 'width': 100.0}),
      'mouseCursor': _materializeState({'type': 'defer'}),
      'overlayColor': _materializeState('#ff555555'),
      'padding': _materializeState({
        'bottom': 0.0,
        'left': 0.0,
        'right': 0.0,
        'top': 0.0,
      }),
      'shadowColor': _materializeState('#ff555555'),
      'shape': _materializeState({
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'circle',
      }),
      'side': _materializeState({
        'color': '#ff000000',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      }),
      'tapTargetSize': 'padded',
      'textStyle': _materializeState({'inherit': true}),
      'visualDensity': 'standard',
    });

    expect(_buttonStylesAreEqual(decoded, entry), true);

    expect(
      _buttonStylesAreEqual(
        ThemeDecoder.decodeButtonStyle({
          'padding': [1, 2],
        }),
        ButtonStyle(
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
          ),
        ),
      ),
      true,
    );

    expect(
      _buttonStylesAreEqual(
        ThemeDecoder.decodeButtonStyle({
          'padding': [1, 2, 3, 4],
        }),
        ButtonStyle(
          padding: WidgetStateProperty.all(
            const EdgeInsets.fromLTRB(1, 2, 3, 4),
          ),
        ),
      ),
      true,
    );

    expect(
      _buttonStylesAreEqual(
        ThemeDecoder.decodeButtonStyle({'padding': 1}),
        ButtonStyle(padding: WidgetStateProperty.all(const EdgeInsets.all(1))),
      ),
      true,
    );

    expect(
      _buttonStylesAreEqual(
        ThemeDecoder.decodeButtonStyle({
          'padding': {'left': 1, 'top': 2, 'right': 3, 'bottom': 4},
        }),
        ButtonStyle(
          padding: WidgetStateProperty.all(
            const EdgeInsets.fromLTRB(1, 2, 3, 4),
          ),
        ),
      ),
      true,
    );
  });

  test('ButtonTextTheme', () {
    expect(ThemeDecoder.decodeButtonTextTheme(null), null);
    expect(ThemeEncoder.encodeButtonTextTheme(null), null);

    expect(
      ThemeDecoder.decodeButtonTextTheme(ButtonTextTheme.accent),
      ButtonTextTheme.accent,
    );

    expect(
      ThemeDecoder.decodeButtonTextTheme('accent'),
      ButtonTextTheme.accent,
    );
    expect(
      ThemeDecoder.decodeButtonTextTheme('normal'),
      ButtonTextTheme.normal,
    );
    expect(
      ThemeDecoder.decodeButtonTextTheme('primary'),
      ButtonTextTheme.primary,
    );

    expect(
      ThemeEncoder.encodeButtonTextTheme(ButtonTextTheme.accent),
      'accent',
    );
    expect(
      ThemeEncoder.encodeButtonTextTheme(ButtonTextTheme.normal),
      'normal',
    );
    expect(
      ThemeEncoder.encodeButtonTextTheme(ButtonTextTheme.primary),
      'primary',
    );
  });

  test('ButtonThemeData', () {
    expect(ThemeDecoder.decodeButtonThemeData(null), null);
    expect(ThemeEncoder.encodeButtonThemeData(null), null);

    final entry = ButtonThemeData(
      alignedDropdown: true,
      buttonColor: const Color(0xff111111),
      colorScheme: const ColorScheme.dark(),
      disabledColor: const Color(0xff222222),
      focusColor: const Color(0xff333333),
      height: 16.0,
      highlightColor: const Color(0xff444444),
      hoverColor: const Color(0xff555555),
      layoutBehavior: ButtonBarLayoutBehavior.padded,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      minWidth: 10.0,
      padding: const EdgeInsets.all(18.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(
          color: Color(0xff666666),
          width: 2.0,
          style: BorderStyle.solid,
        ),
      ),
      splashColor: const Color(0xff777777),
      textTheme: ButtonTextTheme.accent,
    );

    expect(ThemeDecoder.decodeButtonThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeButtonThemeData(entry);
    final decoded = ThemeDecoder.decodeButtonThemeData({
      'alignedDropdown': true,
      'buttonColor': '#ff111111',
      'colorScheme': {
        'brightness': 'dark',
        'error': '#ffcf6679',
        'errorContainer': '#ffcf6679',
        'inversePrimary': '#ff000000',
        'inverseSurface': '#ffffffff',
        'onError': '#ff000000',
        'onErrorContainer': '#ff000000',
        'onInverseSurface': '#ff121212',
        'onPrimaryFixed': '#ff000000',
        'onPrimary': '#ff000000',
        'onPrimaryContainer': '#ff000000',
        'onPrimaryFixedVariant': '#ff000000',
        'onSecondary': '#ff000000',
        'onSecondaryContainer': '#ff000000',
        'onSecondaryFixed': '#ff000000',
        'onSecondaryFixedVariant': '#ff000000',
        'onSurface': '#ffffffff',
        'onSurfaceVariant': '#ffffffff',
        'onTertiary': '#ff000000',
        'onTertiaryContainer': '#ff000000',
        'onTertiaryFixed': '#ff000000',
        'onTertiaryFixedVariant': '#ff000000',
        'outline': '#ffffffff',
        'outlineVariant': '#ffffffff',
        'primary': '#ffbb86fc',
        'primaryContainer': '#ffbb86fc',
        'primaryFixed': '#ffbb86fc',
        'primaryFixedDim': '#ffbb86fc',
        'scrim': '#ff000000',
        'secondary': '#ff03dac6',
        'secondaryContainer': '#ff03dac6',
        'surfaceBright': '#ff121212',
        'surfaceContainer': '#ff121212',
        'surfaceContainerHigh': '#ff121212',
        'surfaceContainerHighest': '#ff121212',
        'secondaryFixed': '#ff03dac6',
        'secondaryFixedDim': '#ff03dac6',
        'shadow': '#ff000000',
        'surface': '#ff121212',
        'surfaceContainerLow': '#ff121212',
        'surfaceContainerLowest': '#ff121212',
        'surfaceDim': '#ff121212',
        'tertiary': '#ff03dac6',
        'tertiaryContainer': '#ff03dac6',
        'tertiaryFixed': '#ff03dac6',
        'tertiaryFixedDim': '#ff03dac6',
      },
      'disabledColor': '#ff222222',
      'focusColor': '#ff333333',
      'height': 16.0,
      'highlightColor': '#ff444444',
      'hoverColor': '#ff555555',
      'layoutBehavior': 'padded',
      'materialTapTargetSize': 'padded',
      'minWidth': 10.0,
      'padding': {'bottom': 18.0, 'left': 18.0, 'right': 18.0, 'top': 18.0},
      'shape': {
        'borderRadius': {'radius': 20.0, 'type': 'circular'},
        'side': {
          'color': '#ff666666',
          'strokeAlign': -1.0,
          'width': 2.0,
          'style': 'solid',
        },
        'type': 'rounded',
      },
      'splashColor': '#ff777777',
      'textTheme': 'accent',
    });

    expect(encoded, {
      'alignedDropdown': true,
      'colorScheme': {
        'brightness': 'dark',
        'error': '#ffcf6679',
        'errorContainer': '#ffcf6679',
        'inversePrimary': '#ff000000',
        'inverseSurface': '#ffffffff',
        'onError': '#ff000000',
        'onErrorContainer': '#ff000000',
        'onInverseSurface': '#ff121212',
        'onPrimaryFixed': '#ff000000',
        'onPrimary': '#ff000000',
        'onPrimaryContainer': '#ff000000',
        'onPrimaryFixedVariant': '#ff000000',
        'onSecondary': '#ff000000',
        'onSecondaryContainer': '#ff000000',
        'onSecondaryFixed': '#ff000000',
        'onSecondaryFixedVariant': '#ff000000',
        'onSurface': '#ffffffff',
        'onSurfaceVariant': '#ffffffff',
        'onTertiary': '#ff000000',
        'onTertiaryContainer': '#ff000000',
        'onTertiaryFixed': '#ff000000',
        'onTertiaryFixedVariant': '#ff000000',
        'outline': '#ffffffff',
        'outlineVariant': '#ffffffff',
        'primary': '#ffbb86fc',
        'primaryContainer': '#ffbb86fc',
        'primaryFixed': '#ffbb86fc',
        'primaryFixedDim': '#ffbb86fc',
        'scrim': '#ff000000',
        'secondary': '#ff03dac6',
        'secondaryContainer': '#ff03dac6',
        'surfaceBright': '#ff121212',
        'surfaceContainer': '#ff121212',
        'surfaceContainerHigh': '#ff121212',
        'surfaceContainerHighest': '#ff121212',
        'secondaryFixed': '#ff03dac6',
        'secondaryFixedDim': '#ff03dac6',
        'shadow': '#ff000000',
        'surface': '#ff121212',
        'surfaceContainerLow': '#ff121212',
        'surfaceContainerLowest': '#ff121212',
        'surfaceDim': '#ff121212',
        'tertiary': '#ff03dac6',
        'tertiaryContainer': '#ff03dac6',
        'tertiaryFixed': '#ff03dac6',
        'tertiaryFixedDim': '#ff03dac6',
      },
      'height': 16.0,
      'layoutBehavior': 'padded',
      'minWidth': 10.0,
      'padding': {'bottom': 18.0, 'left': 18.0, 'right': 18.0, 'top': 18.0},
      'shape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 20.0, 'y': 20.0},
          'bottomRight': {'type': 'elliptical', 'x': 20.0, 'y': 20.0},
          'topLeft': {'type': 'elliptical', 'x': 20.0, 'y': 20.0},
          'topRight': {'type': 'elliptical', 'x': 20.0, 'y': 20.0},
          'type': 'only',
        },
        'side': {
          'color': '#ff666666',
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 2.0,
        },
        'type': 'rounded',
      },
      'textTheme': 'accent',
    });

    expect(decoded!.alignedDropdown, entry.alignedDropdown);
  });

  test('CardTheme', () {
    expect(ThemeDecoder.decodeCardTheme(null), null);
    expect(ThemeEncoder.encodeCardTheme(null), null);

    const corner = {'type': 'elliptical', 'x': 12.0, 'y': 12.0};

    var entry = ThemeDecoder.decodeCardTheme({
      'clipBehavior': 'hardEdge',
      'color': '#ff111111',
      'elevation': 3.0,
      'margin': {'bottom': 10.0, 'left': 10.0, 'right': 10.0, 'top': 10.0},
      'shadowColor': '#ff222222',
      'shape': {
        'borderRadius': {
          'bottomLeft': corner,
          'bottomRight': corner,
          'topLeft': corner,
          'topRight': corner,
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded',
      },
    });

    expect(ThemeDecoder.decodeCardTheme(entry), entry);

    var encoded = ThemeEncoder.encodeCardTheme(entry);

    expect(encoded, {
      'data': {
        'clipBehavior': 'hardEdge',
        'color': '#ff111111',
        'elevation': 3.0,
        'margin': {'bottom': 10.0, 'left': 10.0, 'right': 10.0, 'top': 10.0},
        'shadowColor': '#ff222222',
        'shape': {
          'borderRadius': {
            'bottomLeft': corner,
            'bottomRight': corner,
            'topLeft': corner,
            'topRight': corner,
            'type': 'only',
          },
          'side': {
            'color': '#ff000000',
            'strokeAlign': -1.0,
            'style': 'none',
            'width': 0.0,
          },
          'type': 'rounded',
        },
      },
    });

    entry = CardTheme(
      data: CardThemeData(
        clipBehavior: Clip.hardEdge,
        color: const Color(0xff111111),
        elevation: 3.0,
        margin: const EdgeInsets.all(10.0),
        shadowColor: const Color(0xff222222),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide.none,
        ),
      ),
    );

    expect(ThemeDecoder.decodeCardTheme(entry), entry);

    encoded = ThemeEncoder.encodeCardTheme(entry);

    expect(encoded, {
      'data': {
        'clipBehavior': 'hardEdge',
        'color': '#ff111111',
        'elevation': 3.0,
        'margin': {'bottom': 10.0, 'left': 10.0, 'right': 10.0, 'top': 10.0},
        'shadowColor': '#ff222222',
        'shape': {
          'borderRadius': {
            'bottomLeft': corner,
            'bottomRight': corner,
            'topLeft': corner,
            'topRight': corner,
            'type': 'only',
          },
          'side': {
            'color': '#ff000000',
            'strokeAlign': -1.0,
            'style': 'none',
            'width': 0.0,
          },
          'type': 'rounded',
        },
      },
    });
  });

  test('CardThemeData', () {
    expect(ThemeDecoder.decodeCardThemeData(null), null);
    expect(ThemeEncoder.encodeCardThemeData(null), null);

    final entry = CardThemeData(
      clipBehavior: Clip.hardEdge,
      color: const Color(0xff111111),
      elevation: 3.0,
      margin: const EdgeInsets.all(10.0),
      shadowColor: const Color(0xff222222),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide.none,
      ),
    );

    expect(ThemeDecoder.decodeCardThemeData(entry), entry);

    const corner = {'type': 'elliptical', 'x': 12.0, 'y': 12.0};

    final encoded = ThemeEncoder.encodeCardThemeData(entry);
    final decoded = ThemeDecoder.decodeCardThemeData(encoded);

    expect(encoded, {
      'clipBehavior': 'hardEdge',
      'color': '#ff111111',
      'elevation': 3.0,
      'margin': {'bottom': 10.0, 'left': 10.0, 'right': 10.0, 'top': 10.0},
      'shadowColor': '#ff222222',
      'shape': {
        'borderRadius': {
          'bottomLeft': corner,
          'bottomRight': corner,
          'topLeft': corner,
          'topRight': corner,
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded',
      },
    });

    expect(decoded, entry);
  });
  test('CheckboxThemeData', () {
    expect(ThemeDecoder.decodeCheckboxThemeData(null), null);
    expect(ThemeEncoder.encodeCheckboxThemeData(null), null);

    final entry = CheckboxThemeData(
      checkColor: WidgetStateProperty.all(_kColor),
      fillColor: WidgetStateProperty.all(_kColor),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      mouseCursor: WidgetStateProperty.all(MouseCursor.uncontrolled),
      overlayColor: WidgetStateProperty.all(_kColor),
      splashRadius: 2.0,
      visualDensity: VisualDensity.comfortable,
    );

    expect(ThemeDecoder.decodeCheckboxThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeCheckboxThemeData(entry);
    final decoded = ThemeDecoder.decodeCheckboxThemeData(encoded);

    expect(
      decoded!.checkColor!.resolve({WidgetState.error}),
      entry.checkColor!.resolve({WidgetState.error}),
    );
    expect(
      decoded.fillColor!.resolve({WidgetState.error}),
      entry.fillColor!.resolve({WidgetState.error}),
    );
    expect(decoded.materialTapTargetSize, entry.materialTapTargetSize);
    expect(
      decoded.mouseCursor!.resolve({WidgetState.error}),
      entry.mouseCursor!.resolve({WidgetState.error}),
    );
    expect(
      decoded.overlayColor!.resolve({WidgetState.error}),
      entry.overlayColor!.resolve({WidgetState.error}),
    );
    expect(decoded.splashRadius, entry.splashRadius);
    expect(decoded.visualDensity, entry.visualDensity);
  });

  test('ChipThemeData', () {
    expect(ThemeDecoder.decodeChipThemeData(null), null);
    expect(ThemeEncoder.encodeChipThemeData(null), null);

    final entry = ChipThemeData(
      avatarBoxConstraints: BoxConstraints(minWidth: 10),
      backgroundColor: const Color(0xff111111),
      brightness: Brightness.light,
      checkmarkColor: const Color(0xff222222),
      color: WidgetStateProperty.all(const Color(0xff555555)),
      deleteIconBoxConstraints: BoxConstraints(minWidth: 20),
      deleteIconColor: const Color(0xff333333),
      disabledColor: const Color(0xff444444),
      elevation: 2.0,
      iconTheme: const IconThemeData(color: _kColor),
      labelPadding: const EdgeInsets.all(4.0),
      labelStyle: const TextStyle(color: Color(0xff555555)),
      padding: const EdgeInsets.all(8.0),
      pressElevation: 1.0,
      secondaryLabelStyle: const TextStyle(color: _kColor),
      secondarySelectedColor: const Color(0xff666666),
      selectedColor: _kColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      selectedShadowColor: const Color(0xff777777),
      shadowColor: const Color(0xff888888),
      showCheckmark: true,
      side: const BorderSide(width: 2.0),
      surfaceTintColor: _kColor,
    );

    expect(ThemeDecoder.decodeChipThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeChipThemeData(entry);

    expect(encoded, {
      'avatarBoxConstraints': {'minHeight': 0.0, 'minWidth': 10.0},
      'backgroundColor': '#ff111111',
      'brightness': 'light',
      'checkmarkColor': '#ff222222',
      'color': _materializeState('#ff555555'),
      'deleteIconBoxConstraints': {'minHeight': 0.0, 'minWidth': 20.0},
      'deleteIconColor': '#ff333333',
      'disabledColor': '#ff444444',
      'elevation': 2.0,
      'iconTheme': {'color': _kColorStr},
      'labelPadding': {'bottom': 4.0, 'left': 4.0, 'right': 4.0, 'top': 4.0},
      'labelStyle': {'color': '#ff555555', 'inherit': true},
      'padding': {'bottom': 8.0, 'left': 8.0, 'right': 8.0, 'top': 8.0},
      'pressElevation': 1.0,
      'secondaryLabelStyle': {'color': '#00123456', 'inherit': true},
      'secondarySelectedColor': '#ff666666',
      'selectedColor': '#00123456',
      'shape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 10.0, 'y': 10.0},
          'bottomRight': {'type': 'elliptical', 'x': 10.0, 'y': 10.0},
          'topLeft': {'type': 'elliptical', 'x': 10.0, 'y': 10.0},
          'topRight': {'type': 'elliptical', 'x': 10.0, 'y': 10.0},
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded',
      },
      'selectedShadowColor': '#ff777777',
      'shadowColor': '#ff888888',
      'showCheckmark': true,
      'side': {
        'color': '#ff000000',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 2.0,
      },
      'surfaceTintColor': _kColorStr,
    });

    // The equality on these doesn't work because they aren't fully identical
    // in the framework as of Flutter 3.16
    //
    // expect(
    //   decoded,
    //   entry,
    // );
  });

  test('Clip', () {
    expect(ThemeDecoder.decodeClip(null), null);
    expect(ThemeEncoder.encodeClip(null), null);

    expect(ThemeDecoder.decodeClip(Clip.antiAlias), Clip.antiAlias);

    expect(ThemeDecoder.decodeClip('antiAlias'), Clip.antiAlias);
    expect(
      ThemeDecoder.decodeClip('antiAliasWithSaveLayer'),
      Clip.antiAliasWithSaveLayer,
    );
    expect(ThemeDecoder.decodeClip('hardEdge'), Clip.hardEdge);
    expect(ThemeDecoder.decodeClip('none'), Clip.none);

    expect(ThemeEncoder.encodeClip(Clip.antiAlias), 'antiAlias');
    expect(
      ThemeEncoder.encodeClip(Clip.antiAliasWithSaveLayer),
      'antiAliasWithSaveLayer',
    );
    expect(ThemeEncoder.encodeClip(Clip.hardEdge), 'hardEdge');
    expect(ThemeEncoder.encodeClip(Clip.none), 'none');
  });

  test('Color', () {
    expect(ThemeDecoder.decodeColor(null), null);
    expect(ThemeEncoder.encodeColor(null), null);

    const entry = _kColor;

    expect(ThemeDecoder.decodeColor(entry), entry);

    final encoded = ThemeEncoder.encodeColor(entry);
    final decoded = ThemeDecoder.decodeColor(encoded);

    expect(encoded, _kColorStr);

    expect(decoded, entry);

    expect(ThemeDecoder.decodeColor('ddd'), const Color(0xffdddddd));
    expect(ThemeDecoder.decodeColor('#ddd'), const Color(0xffdddddd));
    expect(ThemeDecoder.decodeColor('DDD'), const Color(0xffdddddd));
    expect(ThemeDecoder.decodeColor('#DDD'), const Color(0xffdddddd));

    expect(ThemeDecoder.decodeColor('dadada'), const Color(0xffdadada));
    expect(ThemeDecoder.decodeColor('#dadada'), const Color(0xffdadada));
    expect(ThemeDecoder.decodeColor('DADADA'), const Color(0xffdadada));
    expect(ThemeDecoder.decodeColor('#DADADA'), const Color(0xffdadada));

    expect(ThemeDecoder.decodeColor('dadadada'), const Color(0xdadadada));
    expect(ThemeDecoder.decodeColor('#dadadada'), const Color(0xdadadada));
    expect(ThemeDecoder.decodeColor('DADADADA'), const Color(0xdadadada));
    expect(ThemeDecoder.decodeColor('#DADADADA'), const Color(0xdadadada));
  });

  test('ColorScheme', () {
    expect(ThemeDecoder.decodeColorScheme(null), null);
    expect(ThemeEncoder.encodeColorScheme(null), null);

    const entry = ColorScheme.dark();

    expect(ThemeDecoder.decodeColorScheme(entry), entry);

    final encoded = ThemeEncoder.encodeColorScheme(entry);
    final decoded = ThemeDecoder.decodeColorScheme(encoded);

    expect(encoded, {
      'brightness': 'dark',
      'error': '#ffcf6679',
      'errorContainer': '#ffcf6679',
      'inversePrimary': '#ff000000',
      'inverseSurface': '#ffffffff',
      'onError': '#ff000000',
      'onErrorContainer': '#ff000000',
      'onInverseSurface': '#ff121212',
      'onPrimaryFixed': '#ff000000',
      'onPrimary': '#ff000000',
      'onPrimaryContainer': '#ff000000',
      'onPrimaryFixedVariant': '#ff000000',
      'onSecondary': '#ff000000',
      'onSecondaryContainer': '#ff000000',
      'onSecondaryFixed': '#ff000000',
      'onSecondaryFixedVariant': '#ff000000',
      'onSurface': '#ffffffff',
      'onSurfaceVariant': '#ffffffff',
      'onTertiary': '#ff000000',
      'onTertiaryContainer': '#ff000000',
      'onTertiaryFixed': '#ff000000',
      'onTertiaryFixedVariant': '#ff000000',
      'outline': '#ffffffff',
      'outlineVariant': '#ffffffff',
      'primary': '#ffbb86fc',
      'primaryContainer': '#ffbb86fc',
      'primaryFixed': '#ffbb86fc',
      'primaryFixedDim': '#ffbb86fc',
      'scrim': '#ff000000',
      'secondary': '#ff03dac6',
      'secondaryContainer': '#ff03dac6',
      'surfaceBright': '#ff121212',
      'surfaceContainer': '#ff121212',
      'surfaceContainerHigh': '#ff121212',
      'surfaceContainerHighest': '#ff121212',
      'secondaryFixed': '#ff03dac6',
      'secondaryFixedDim': '#ff03dac6',
      'shadow': '#ff000000',
      'surface': '#ff121212',
      'surfaceContainerLow': '#ff121212',
      'surfaceContainerLowest': '#ff121212',
      'surfaceDim': '#ff121212',
      'tertiary': '#ff03dac6',
      'tertiaryContainer': '#ff03dac6',
      'tertiaryFixed': '#ff03dac6',
      'tertiaryFixedDim': '#ff03dac6',
    });
    expect(decoded!.surface, entry.surface);
  });

  test('CrossAxisAlignment', () {
    expect(ThemeDecoder.decodeCrossAxisAlignment(null), null);
    expect(ThemeEncoder.encodeCrossAxisAlignment(null), null);

    expect(
      ThemeDecoder.decodeCrossAxisAlignment(CrossAxisAlignment.baseline),
      CrossAxisAlignment.baseline,
    );

    expect(
      ThemeDecoder.decodeCrossAxisAlignment('baseline'),
      CrossAxisAlignment.baseline,
    );
    expect(
      ThemeDecoder.decodeCrossAxisAlignment('center'),
      CrossAxisAlignment.center,
    );
    expect(
      ThemeDecoder.decodeCrossAxisAlignment('end'),
      CrossAxisAlignment.end,
    );
    expect(
      ThemeDecoder.decodeCrossAxisAlignment('start'),
      CrossAxisAlignment.start,
    );
    expect(
      ThemeDecoder.decodeCrossAxisAlignment('stretch'),
      CrossAxisAlignment.stretch,
    );

    expect(
      ThemeEncoder.encodeCrossAxisAlignment(CrossAxisAlignment.baseline),
      'baseline',
    );
    expect(
      ThemeEncoder.encodeCrossAxisAlignment(CrossAxisAlignment.center),
      'center',
    );
    expect(
      ThemeEncoder.encodeCrossAxisAlignment(CrossAxisAlignment.end),
      'end',
    );
    expect(
      ThemeEncoder.encodeCrossAxisAlignment(CrossAxisAlignment.start),
      'start',
    );
    expect(
      ThemeEncoder.encodeCrossAxisAlignment(CrossAxisAlignment.stretch),
      'stretch',
    );
  });

  test('CrossFadeState', () {
    expect(ThemeDecoder.decodeCrossFadeState(null), null);
    expect(ThemeEncoder.encodeCrossFadeState(null), null);

    expect(
      ThemeDecoder.decodeCrossFadeState(CrossFadeState.showFirst),
      CrossFadeState.showFirst,
    );

    expect(
      ThemeDecoder.decodeCrossFadeState('showFirst'),
      CrossFadeState.showFirst,
    );
    expect(
      ThemeDecoder.decodeCrossFadeState('showSecond'),
      CrossFadeState.showSecond,
    );

    expect(
      ThemeEncoder.encodeCrossFadeState(CrossFadeState.showFirst),
      'showFirst',
    );
    expect(
      ThemeEncoder.encodeCrossFadeState(CrossFadeState.showSecond),
      'showSecond',
    );
  });

  test('CupertinoTextThemeData', () {
    expect(ThemeDecoder.decodeCupertinoTextThemeData(null), null);
    expect(ThemeEncoder.encodeCupertinoTextThemeData(null), null);

    const entry = CupertinoTextThemeData(
      actionSmallTextStyle: _kTextStyle,
      actionTextStyle: _kTextStyle,
      dateTimePickerTextStyle: _kTextStyle,
      navActionTextStyle: _kTextStyle,
      navLargeTitleTextStyle: _kTextStyle,
      navTitleTextStyle: _kTextStyle,
      pickerTextStyle: _kTextStyle,
      primaryColor: _kColor,
      tabLabelTextStyle: _kTextStyle,
      textStyle: _kTextStyle,
    );

    expect(ThemeDecoder.decodeCupertinoTextThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeCupertinoTextThemeData(entry);
    final decoded =
        ThemeDecoder.decodeCupertinoTextThemeData({
          'actionSmallTextStyle': _kTextStyleJson,
          'actionTextStyle': _kTextStyleJson,
          'dateTimePickerTextStyle': _kTextStyleJson,
          'navActionTextStyle': _kTextStyleJson,
          'navLargeTitleTextStyle': _kTextStyleJson,
          'navTitleTextStyle': _kTextStyleJson,
          'pickerTextStyle': _kTextStyleJson,
          'primaryColor': _kColorStr,
          'tabLabelTextStyle': _kTextStyleJson,
          'textStyle': _kTextStyleJson,
        })!;

    expect(encoded, {
      'actionSmallTextStyle': _kTextStyleJson,
      'actionTextStyle': _kTextStyleJson,
      'dateTimePickerTextStyle': _kTextStyleJson,
      'navActionTextStyle': _kTextStyleJson,
      'navLargeTitleTextStyle': _kTextStyleJson,
      'navTitleTextStyle': _kTextStyleJson,
      'pickerTextStyle': _kTextStyleJson,
      'tabLabelTextStyle': _kTextStyleJson,
      'textStyle': _kTextStyleJson,
    });

    expect(decoded.actionSmallTextStyle, entry.actionSmallTextStyle);
    expect(decoded.actionTextStyle, entry.actionTextStyle);
    expect(decoded.dateTimePickerTextStyle, entry.dateTimePickerTextStyle);
    expect(decoded.navActionTextStyle, entry.navActionTextStyle);
    expect(decoded.navLargeTitleTextStyle, entry.navLargeTitleTextStyle);
    expect(decoded.navTitleTextStyle, entry.navTitleTextStyle);
    expect(decoded.pickerTextStyle, entry.pickerTextStyle);
    expect(decoded.tabLabelTextStyle, entry.tabLabelTextStyle);
    expect(decoded.textStyle, entry.textStyle);
  });

  test('CupertinoThemeData', () {
    expect(ThemeDecoder.decodeCupertinoThemeData(null), null);
    expect(ThemeEncoder.encodeCupertinoThemeData(null), null);

    const entry = CupertinoThemeData(
      applyThemeToAll: true,
      barBackgroundColor: Color(0xff111111),
      brightness: Brightness.light,
      primaryColor: Color(0xff222222),
      primaryContrastingColor: Color(0xff333333),
      scaffoldBackgroundColor: Color(0xff444444),
      textTheme: CupertinoTextThemeData(
        actionTextStyle: TextStyle(color: Color(0x11111111)),
        dateTimePickerTextStyle: TextStyle(color: Color(0x22222222)),
        navActionTextStyle: TextStyle(color: Color(0x33333333)),
        navLargeTitleTextStyle: TextStyle(color: Color(0x44444444)),
        navTitleTextStyle: TextStyle(color: Color(0x55555555)),
        pickerTextStyle: TextStyle(color: Color(0x66666666)),
        primaryColor: Color(0xff555555),
        tabLabelTextStyle: TextStyle(color: Color(0x77777777)),
        textStyle: TextStyle(color: Color(0x88888888)),
      ),
    );

    expect(ThemeDecoder.decodeCupertinoThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeCupertinoThemeData(entry);
    final decoded = ThemeDecoder.decodeCupertinoThemeData(encoded)!;

    expect(encoded, {
      'applyThemeToAll': true,
      'barBackgroundColor': '#ff111111',
      'brightness': 'light',
      'primaryColor': '#ff222222',
      'primaryContrastingColor': '#ff333333',
      'scaffoldBackgroundColor': '#ff444444',
      'textTheme': {
        'actionSmallTextStyle': {
          'color': '#ff555555',
          'decoration': 'none',
          'fontFamily': 'CupertinoSystemText',
          'fontSize': 15.0,
          'inherit': false,
          'letterSpacing': -0.23,
        },
        'actionTextStyle': {'color': '#11111111', 'inherit': true},
        'dateTimePickerTextStyle': {'color': '#22222222', 'inherit': true},
        'navActionTextStyle': {'color': '#33333333', 'inherit': true},
        'navLargeTitleTextStyle': {'color': '#44444444', 'inherit': true},
        'navTitleTextStyle': {'color': '#55555555', 'inherit': true},
        'pickerTextStyle': {'color': '#66666666', 'inherit': true},
        'tabLabelTextStyle': {'color': '#77777777', 'inherit': true},
        'textStyle': {'color': '#88888888', 'inherit': true},
      },
    });

    expect(decoded.barBackgroundColor, entry.barBackgroundColor);

    expect(decoded.brightness, entry.brightness);

    expect(decoded.primaryColor, entry.primaryColor);

    expect(decoded.primaryContrastingColor, entry.primaryContrastingColor);

    expect(decoded.scaffoldBackgroundColor, entry.scaffoldBackgroundColor);

    expect(decoded.textTheme.actionTextStyle, entry.textTheme.actionTextStyle);

    expect(
      decoded.textTheme.dateTimePickerTextStyle,
      entry.textTheme.dateTimePickerTextStyle,
    );
    expect(
      decoded.textTheme.navActionTextStyle,
      entry.textTheme.navActionTextStyle,
    );
    expect(
      decoded.textTheme.navLargeTitleTextStyle,
      entry.textTheme.navLargeTitleTextStyle,
    );
    expect(
      decoded.textTheme.navTitleTextStyle,
      entry.textTheme.navTitleTextStyle,
    );
    expect(decoded.textTheme.pickerTextStyle, entry.textTheme.pickerTextStyle);
    expect(
      decoded.textTheme.tabLabelTextStyle,
      entry.textTheme.tabLabelTextStyle,
    );
    expect(decoded.textTheme.textStyle, entry.textTheme.textStyle);
  });

  test('DatePickerThemeData', () {
    expect(ThemeDecoder.decodeDatePickerThemeData(null), null);
    expect(ThemeEncoder.encodeDatePickerThemeData(null), null);

    const entry = DatePickerThemeData(backgroundColor: _kColor);

    expect(ThemeDecoder.decodeDatePickerThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeDatePickerThemeData(entry);

    expect(encoded, {'backgroundColor': _kColorStr});
  });

  test('DataTableThemeData', () {
    expect(ThemeDecoder.decodeDataTableThemeData(null), null);
    expect(ThemeEncoder.encodeDataTableThemeData(null), null);

    final entry = DataTableThemeData(
      checkboxHorizontalMargin: 24.0,
      columnSpacing: 1.0,
      dataRowColor: WidgetStateProperty.all(const Color(0xff555555)),
      dataRowCursor: const WidgetStatePropertyAll(SystemMouseCursors.basic),
      dataRowMaxHeight: 1.0,
      dataRowMinHeight: 1.0,
      dataTextStyle: const TextStyle(),
      decoration: const BoxDecoration(color: _kColor),
      dividerThickness: 1.0,
      headingCellCursor: const WidgetStatePropertyAll(SystemMouseCursors.click),
      headingRowAlignment: MainAxisAlignment.center,
      headingRowColor: WidgetStateProperty.all(const Color(0xff555555)),
      headingRowHeight: 1.0,
      headingTextStyle: const TextStyle(),
      horizontalMargin: 1.0,
    );

    expect(ThemeDecoder.decodeDataTableThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeDataTableThemeData(entry);
    final decoded = ThemeDecoder.decodeDataTableThemeData(encoded);

    expect(encoded, {
      'checkboxHorizontalMargin': 24.0,
      'columnSpacing': 1.0,
      'dataRowColor': _materializeState('#ff555555'),
      'dataRowCursor': {
        'disabled': {'cursor': 'basic', 'type': 'system'},
        'dragged': {'cursor': 'basic', 'type': 'system'},
        'empty': {'cursor': 'basic', 'type': 'system'},
        'error': {'cursor': 'basic', 'type': 'system'},
        'focused': {'cursor': 'basic', 'type': 'system'},
        'hovered': {'cursor': 'basic', 'type': 'system'},
        'pressed': {'cursor': 'basic', 'type': 'system'},
        'scrolledUnder': {'cursor': 'basic', 'type': 'system'},
        'selected': {'cursor': 'basic', 'type': 'system'},
      },
      'dataRowMaxHeight': 1.0,
      'dataRowMinHeight': 1.0,
      'dataTextStyle': {'inherit': true},
      'decoration': {'color': _kColorStr, 'shape': 'rectangle'},
      'dividerThickness': 1.0,
      'headingCellCursor': {
        'disabled': {'cursor': 'click', 'type': 'system'},
        'dragged': {'cursor': 'click', 'type': 'system'},
        'empty': {'cursor': 'click', 'type': 'system'},
        'error': {'cursor': 'click', 'type': 'system'},
        'focused': {'cursor': 'click', 'type': 'system'},
        'hovered': {'cursor': 'click', 'type': 'system'},
        'pressed': {'cursor': 'click', 'type': 'system'},
        'scrolledUnder': {'cursor': 'click', 'type': 'system'},
        'selected': {'cursor': 'click', 'type': 'system'},
      },
      'headingRowAlignment': 'center',
      'headingRowColor': _materializeState('#ff555555'),
      'headingRowHeight': 1.0,
      'headingTextStyle': {'inherit': true},
      'horizontalMargin': 1.0,
    });

    bool? dataTableThemeDataAreEqual(Object? first, Object second) {
      bool? result;

      if (first.runtimeType != second.runtimeType) {
        result = false;
      } else if (first is! DataTableThemeData) {
        result = false;
      } else if (second is DataTableThemeData) {
        result =
            first.columnSpacing == second.columnSpacing &&
            first.dataRowColor?.resolve({}) ==
                second.dataRowColor?.resolve({}) &&
            first.dataRowMaxHeight == second.dataRowMaxHeight &&
            first.dataRowMinHeight == second.dataRowMinHeight &&
            first.dataTextStyle == second.dataTextStyle &&
            first.dividerThickness == second.dividerThickness &&
            first.headingRowColor?.resolve({}) ==
                second.headingRowColor?.resolve({}) &&
            first.headingRowHeight == second.headingRowHeight &&
            first.headingTextStyle == second.headingTextStyle &&
            first.horizontalMargin == second.horizontalMargin;
      }

      return result;
    }

    expect(dataTableThemeDataAreEqual(decoded, entry), true);
  });

  test('DecorationImage', () {
    expect(ThemeDecoder.decodeDecorationImage(null), null);
    expect(ThemeEncoder.encodeDecorationImage(null), null);

    final entry = DecorationImage(
      alignment: Alignment.bottomCenter,
      centerSlice: Rect.zero,
      filterQuality: FilterQuality.high,
      fit: BoxFit.contain,
      image: MemoryImage(base64Decode(base64Image)),
      invertColors: true,
      isAntiAlias: true,
      matchTextDirection: true,
      opacity: 0.5,
      repeat: ImageRepeat.repeat,
      scale: 2.0,
    );

    expect(ThemeDecoder.decodeDecorationImage(entry), entry);

    final encoded = ThemeEncoder.encodeDecorationImage(entry);
    final decoded = ThemeDecoder.decodeDecorationImage(encoded);

    expect(encoded, {
      'alignment': 'bottomCenter',
      'centerSlice': {
        'bottom': 0.0,
        'left': 0.0,
        'right': 0.0,
        'top': 0.0,
        'type': 'ltrb',
      },
      'filterQuality': 'high',
      'fit': 'contain',
      'image': {'bytes': base64Image, 'scale': 1.0, 'type': 'memory'},
      'invertColors': true,
      'isAntiAlias': true,
      'matchTextDirection': true,
      'opacity': 0.5,
      'repeat': 'repeat',
      'scale': 2.0,
    });

    expect(ThemeEncoder.encodeDecorationImage(decoded), {
      'alignment': 'bottomCenter',
      'centerSlice': {
        'bottom': 0.0,
        'left': 0.0,
        'right': 0.0,
        'top': 0.0,
        'type': 'ltrb',
      },
      'filterQuality': 'high',
      'fit': 'contain',
      'image': {'bytes': base64Image, 'scale': 1.0, 'type': 'memory'},
      'invertColors': true,
      'matchTextDirection': true,
      'isAntiAlias': true,
      'opacity': 0.5,
      'repeat': 'repeat',
      'scale': 2.0,
    });
  });

  test('DecorationPosition', () {
    expect(ThemeDecoder.decodeDecorationPosition(null), null);
    expect(ThemeEncoder.encodeDecorationPosition(null), null);

    expect(
      ThemeDecoder.decodeDecorationPosition(DecorationPosition.background),
      DecorationPosition.background,
    );

    expect(
      ThemeDecoder.decodeDecorationPosition('background'),
      DecorationPosition.background,
    );
    expect(
      ThemeDecoder.decodeDecorationPosition('foreground'),
      DecorationPosition.foreground,
    );

    expect(
      ThemeEncoder.encodeDecorationPosition(DecorationPosition.background),
      'background',
    );
    expect(
      ThemeEncoder.encodeDecorationPosition(DecorationPosition.foreground),
      'foreground',
    );
  });

  test('DialogTheme', () {
    expect(ThemeDecoder.decodeDialogTheme(null), null);
    expect(ThemeEncoder.encodeDialogTheme(null), null);

    const entry = DialogTheme(
      actionsPadding: EdgeInsets.all(8.0),
      alignment: Alignment.bottomLeft,
      backgroundColor: _kColor,
      clipBehavior: Clip.hardEdge,
      contentTextStyle: _kTextStyle,
      elevation: 1.0,
      shadowColor: _kColor,
      shape: RoundedRectangleBorder(),
      surfaceTintColor: _kColor,
    );

    expect(ThemeDecoder.decodeDialogTheme(entry), entry);

    final encoded = ThemeEncoder.encodeDialogTheme(entry);

    expect(encoded, {
      'data': {
        'actionsPadding': {
          'bottom': 8.0,
          'left': 8.0,
          'right': 8.0,
          'top': 8.0,
        },
        'alignment': 'bottomLeft',
        'backgroundColor': _kColorStr,
        'clipBehavior': 'hardEdge',
        'contentTextStyle': _kTextStyleJson,
        'elevation': 1.0,
        'shadowColor': _kColorStr,
        'shape': {
          'borderRadius': {
            'bottomLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
            'bottomRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
            'topLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
            'topRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
            'type': 'only',
          },
          'side': {
            'color': '#ff000000',
            'strokeAlign': -1,
            'style': 'none',
            'width': 0.0,
          },
          'type': 'rounded',
        },
        'surfaceTintColor': _kColorStr,
      },
    });
  });

  test('DialogThemeData', () {
    expect(ThemeDecoder.decodeDialogThemeData(null), null);
    expect(ThemeEncoder.encodeDialogThemeData(null), null);

    const entry = DialogThemeData(
      actionsPadding: EdgeInsets.all(8.0),
      alignment: Alignment.bottomLeft,
      backgroundColor: _kColor,
      clipBehavior: Clip.hardEdge,
      contentTextStyle: _kTextStyle,
      elevation: 1.0,
      shadowColor: _kColor,
      shape: RoundedRectangleBorder(),
      surfaceTintColor: _kColor,
    );

    expect(ThemeDecoder.decodeDialogThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeDialogThemeData(entry);
    final decoded = ThemeDecoder.decodeDialogThemeData(encoded);

    expect(encoded, {
      'actionsPadding': {'bottom': 8.0, 'left': 8.0, 'right': 8.0, 'top': 8.0},
      'alignment': 'bottomLeft',
      'backgroundColor': _kColorStr,
      'clipBehavior': 'hardEdge',
      'contentTextStyle': _kTextStyleJson,
      'elevation': 1.0,
      'shadowColor': _kColorStr,
      'shape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'bottomRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'topLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'topRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded',
      },
      'surfaceTintColor': _kColorStr,
    });

    expect(decoded, entry);
  });

  test('DismissDirection', () {
    expect(ThemeDecoder.decodeDismissDirection(null), null);
    expect(ThemeEncoder.encodeDismissDirection(null), null);

    expect(
      ThemeDecoder.decodeDismissDirection(DismissDirection.down),
      DismissDirection.down,
    );

    expect(ThemeDecoder.decodeDismissDirection('down'), DismissDirection.down);
    expect(
      ThemeDecoder.decodeDismissDirection('endToStart'),
      DismissDirection.endToStart,
    );
    expect(
      ThemeDecoder.decodeDismissDirection('horizontal'),
      DismissDirection.horizontal,
    );
    expect(ThemeDecoder.decodeDismissDirection('none'), DismissDirection.none);
    expect(
      ThemeDecoder.decodeDismissDirection('startToEnd'),
      DismissDirection.startToEnd,
    );
    expect(ThemeDecoder.decodeDismissDirection('up'), DismissDirection.up);
    expect(
      ThemeDecoder.decodeDismissDirection('vertical'),
      DismissDirection.vertical,
    );

    expect(ThemeEncoder.encodeDismissDirection(DismissDirection.down), 'down');
    expect(
      ThemeEncoder.encodeDismissDirection(DismissDirection.endToStart),
      'endToStart',
    );
    expect(
      ThemeEncoder.encodeDismissDirection(DismissDirection.horizontal),
      'horizontal',
    );
    expect(ThemeEncoder.encodeDismissDirection(DismissDirection.none), 'none');
    expect(
      ThemeEncoder.encodeDismissDirection(DismissDirection.startToEnd),
      'startToEnd',
    );
    expect(ThemeEncoder.encodeDismissDirection(DismissDirection.up), 'up');
    expect(
      ThemeEncoder.encodeDismissDirection(DismissDirection.vertical),
      'vertical',
    );
  });

  test('DividerThemeData', () {
    expect(ThemeDecoder.decodeDividerThemeData(null), null);
    expect(ThemeEncoder.encodeDividerThemeData(null), null);

    const entry = DividerThemeData(
      color: _kColor,
      endIndent: 1.0,
      indent: 2.0,
      space: 3.0,
      thickness: 4.0,
    );

    expect(ThemeDecoder.decodeDividerThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeDividerThemeData(entry);
    final decoded = ThemeDecoder.decodeDividerThemeData(encoded);

    expect(encoded, {
      'color': _kColorStr,
      'endIndent': 1.0,
      'indent': 2.0,
      'space': 3.0,
      'thickness': 4.0,
    });

    expect(decoded, entry);
  });

  test('DragStartBehavior', () {
    expect(ThemeDecoder.decodeDragStartBehavior(null), null);
    expect(ThemeEncoder.encodeDragStartBehavior(null), null);

    expect(
      ThemeDecoder.decodeDragStartBehavior(DragStartBehavior.down),
      DragStartBehavior.down,
    );

    expect(
      ThemeDecoder.decodeDragStartBehavior('down'),
      DragStartBehavior.down,
    );
    expect(
      ThemeDecoder.decodeDragStartBehavior('start'),
      DragStartBehavior.start,
    );

    expect(
      ThemeEncoder.encodeDragStartBehavior(DragStartBehavior.down),
      'down',
    );
    expect(
      ThemeEncoder.encodeDragStartBehavior(DragStartBehavior.start),
      'start',
    );
  });

  test('DrawerThemeData', () {
    expect(ThemeDecoder.decodeDrawerThemeData(null), null);
    expect(ThemeEncoder.encodeDrawerThemeData(null), null);

    const entry = DrawerThemeData(
      backgroundColor: Color(0xff111111),
      elevation: 5,
      endShape: CircleBorder(side: BorderSide.none),
      scrimColor: Color(0xff222222),
      shadowColor: _kColor,
      shape: CircleBorder(side: BorderSide.none),
      surfaceTintColor: _kColor,
    );

    expect(ThemeDecoder.decodeDrawerThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeDrawerThemeData(entry);
    final decoded = ThemeDecoder.decodeDrawerThemeData(encoded);

    expect(encoded, {
      'backgroundColor': '#ff111111',
      'elevation': 5.0,
      'endShape': {
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'circle',
      },
      'scrimColor': '#ff222222',
      'shadowColor': _kColorStr,
      'shape': {
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'circle',
      },
      'surfaceTintColor': _kColorStr,
    });
    expect(decoded, entry);
  });

  test('DropdownMenuThemeData', () {
    expect(ThemeDecoder.decodeDropdownMenuThemeData(null), null);
    expect(ThemeEncoder.encodeDropdownMenuThemeData(null), null);
  });

  test('EdgeInsets', () {
    expect(ThemeDecoder.decodeEdgeInsets(null), null);
    expect(ThemeEncoder.encodeEdgeInsets(null), null);

    const entry = EdgeInsets.fromLTRB(1.0, 2.0, 3.0, 4.0);

    expect(ThemeDecoder.decodeEdgeInsets(entry), entry);

    final encoded = ThemeEncoder.encodeEdgeInsets(entry);
    final decoded = ThemeDecoder.decodeEdgeInsets(encoded);

    expect(encoded, {'bottom': 4.0, 'left': 1.0, 'right': 3.0, 'top': 2.0});

    expect(decoded, entry);

    expect(ThemeDecoder.decodeEdgeInsets('16'), const EdgeInsets.all(16.0));
    expect(ThemeDecoder.decodeEdgeInsets(16), const EdgeInsets.all(16.0));
    expect(
      ThemeDecoder.decodeEdgeInsets(['1', 2]),
      const EdgeInsets.symmetric(horizontal: 1.0, vertical: 2.0),
    );
    expect(
      ThemeDecoder.decodeEdgeInsets(['1', 2, 3.0, '4.0']),
      const EdgeInsets.fromLTRB(1.0, 2.0, 3.0, 4.0),
    );
  });

  test('EdgeInsetsDirectional', () {
    expect(ThemeDecoder.decodeEdgeInsetsDirectional(null), null);
    expect(ThemeEncoder.encodeEdgeInsetsDirectional(null), null);

    const entry = EdgeInsetsDirectional.fromSTEB(1.0, 2.0, 3.0, 4.0);

    expect(ThemeDecoder.decodeEdgeInsetsDirectional(entry), entry);

    final encoded = ThemeEncoder.encodeEdgeInsetsDirectional(entry);
    final decoded = ThemeDecoder.decodeEdgeInsetsDirectional(encoded);

    expect(encoded, {'bottom': 4.0, 'end': 3.0, 'start': 1.0, 'top': 2.0});

    expect(decoded, entry);

    expect(
      ThemeDecoder.decodeEdgeInsetsDirectional('16'),
      const EdgeInsetsDirectional.all(16.0),
    );
    expect(
      ThemeDecoder.decodeEdgeInsetsDirectional(16),
      const EdgeInsetsDirectional.all(16.0),
    );
    expect(
      ThemeDecoder.decodeEdgeInsetsDirectional(['1', 2]),
      const EdgeInsetsDirectional.symmetric(horizontal: 1.0, vertical: 2.0),
    );
    expect(
      ThemeDecoder.decodeEdgeInsetsDirectional(['1', 2, 3.0, '4.0']),
      const EdgeInsetsDirectional.fromSTEB(1.0, 2.0, 3.0, 4.0),
    );

    expect(
      ThemeDecoder.decodeEdgeInsetsDirectional([
        '1',
        2,
        3.0,
        '4.0',
      ], ltr: false),
      const EdgeInsetsDirectional.fromSTEB(3.0, 2.0, 1.0, 4.0),
    );
  });

  test('EdgeInsetsGeometry', () {
    expect(ThemeDecoder.decodeEdgeInsetsGeometry(null), null);
    expect(ThemeEncoder.encodeEdgeInsetsGeometry(null), null);

    const entry = EdgeInsets.fromLTRB(1.0, 2.0, 3.0, 4.0);

    expect(ThemeDecoder.decodeEdgeInsetsGeometry(entry), entry);

    final encoded = ThemeEncoder.encodeEdgeInsetsGeometry(entry);
    final decoded = ThemeDecoder.decodeEdgeInsetsGeometry(encoded);

    expect(encoded, {'bottom': 4.0, 'left': 1.0, 'right': 3.0, 'top': 2.0});

    expect(decoded, entry);

    expect(
      ThemeDecoder.decodeEdgeInsetsGeometry('16'),
      const EdgeInsets.all(16.0),
    );
    expect(
      ThemeDecoder.decodeEdgeInsetsGeometry(16),
      const EdgeInsets.all(16.0),
    );
    expect(
      ThemeDecoder.decodeEdgeInsetsGeometry(['1', 2]),
      const EdgeInsets.symmetric(horizontal: 1.0, vertical: 2.0),
    );
    expect(
      ThemeDecoder.decodeEdgeInsetsGeometry(['1', 2, 3.0, '4.0']),
      const EdgeInsets.fromLTRB(1.0, 2.0, 3.0, 4.0),
    );
  });

  test('ElevatedButtonThemeData', () {
    expect(ThemeDecoder.decodeElevatedButtonThemeData(null), null);
    expect(ThemeEncoder.encodeElevatedButtonThemeData(null), null);

    final entry = ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(const Color(0xff222222)),
      ),
    );

    expect(ThemeDecoder.decodeElevatedButtonThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeElevatedButtonThemeData(entry);
    final decoded = ThemeDecoder.decodeElevatedButtonThemeData(encoded);

    expect(encoded, {
      'style': {'backgroundColor': _materializeState('#ff222222')},
    });

    bool? elevatedButtonThemeDatasAreEqual(Object? first, Object second) {
      bool? result;

      if (first.runtimeType != second.runtimeType) {
        result = false;
      } else if (first is! ElevatedButtonThemeData) {
        result = false;
      } else if (second is ElevatedButtonThemeData) {
        result = _buttonStylesAreEqual(first.style, second.style);
      }

      return result;
    }

    expect(elevatedButtonThemeDatasAreEqual(decoded, entry), true);
  });

  test('ExpansionTileThemeData', () {
    expect(ThemeDecoder.decodeExpansionTileThemeData(null), null);
    expect(ThemeEncoder.encodeExpansionTileThemeData(null), null);

    final entry = ExpansionTileThemeData(
      backgroundColor: Color(0xff111111),
      childrenPadding: EdgeInsets.all(8.0),
      collapsedBackgroundColor: Color(0xff222222),
      collapsedIconColor: Color(0xff333333),
      expandedAlignment: Alignment.bottomCenter,
      expansionAnimationStyle: AnimationStyle.noAnimation,
      iconColor: Color(0xff444444),
      textColor: Color(0xff555555),
      tilePadding: EdgeInsets.all(8.0),
    );

    expect(ThemeDecoder.decodeExpansionTileThemeData(entry), entry);

    final encoded = JsonClass.removeNull(
      ThemeEncoder.encodeExpansionTileThemeData(entry),
    );
    final decoded = ThemeDecoder.decodeExpansionTileThemeData(encoded);

    expect(encoded, {
      'backgroundColor': '#ff111111',
      'childrenPadding': {'bottom': 8.0, 'left': 8.0, 'right': 8.0, 'top': 8.0},
      'collapsedBackgroundColor': '#ff222222',
      'collapsedIconColor': '#ff333333',
      'expandedAlignment': 'bottomCenter',
      'expansionAnimationStyle': 'noAnimation',
      'iconColor': '#ff444444',
      'textColor': '#ff555555',
      'tilePadding': {'bottom': 8.0, 'left': 8.0, 'right': 8.0, 'top': 8.0},
    });

    expect(entry, decoded);
  });

  test('FilledButtonThemeData', () {
    expect(ThemeDecoder.decodeFilledButtonThemeData(null), null);
    expect(ThemeEncoder.encodeFilledButtonThemeData(null), null);

    final entry = FilledButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.bottomCenter,
        animationDuration: const Duration(milliseconds: 1000),
        backgroundColor: WidgetStateProperty.all(const Color(0xff555555)),
        elevation: WidgetStateProperty.all(1.0),
        enableFeedback: false,
        fixedSize: WidgetStateProperty.all(const Size(50.0, 50.0)),
        foregroundColor: WidgetStateProperty.all(const Color(0xff555555)),
        iconColor: WidgetStateProperty.all(const Color(0xff555555)),
        iconSize: WidgetStateProperty.all(12.0),
        maximumSize: WidgetStateProperty.all(const Size(10.0, 10.0)),
        minimumSize: WidgetStateProperty.all(const Size(100.0, 100.0)),
        mouseCursor: WidgetStateProperty.all(MouseCursor.defer),
        overlayColor: WidgetStateProperty.all(const Color(0xff555555)),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        shadowColor: WidgetStateProperty.all(const Color(0xff555555)),
        shape: WidgetStateProperty.all(const CircleBorder()),
        side: WidgetStateProperty.all(const BorderSide()),
        tapTargetSize: MaterialTapTargetSize.padded,
        textStyle: WidgetStateProperty.all(const TextStyle()),
        visualDensity: VisualDensity.standard,
      ),
    );

    expect(ThemeDecoder.decodeFilledButtonThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeFilledButtonThemeData(entry);
    final decoded = ThemeDecoder.decodeFilledButtonThemeData(encoded);

    expect(encoded, {
      'style': {
        'alignment': 'bottomCenter',
        'animationDuration': 1000,
        'backgroundColor': _materializeState('#ff555555'),
        'elevation': _materializeState(1.0),
        'enableFeedback': false,
        'fixedSize': _materializeState({'height': 50.0, 'width': 50.0}),
        'foregroundColor': _materializeState('#ff555555'),
        'iconColor': _materializeState('#ff555555'),
        'iconSize': _materializeState(12.0),
        'maximumSize': _materializeState({'height': 10.0, 'width': 10.0}),
        'minimumSize': _materializeState({'height': 100.0, 'width': 100.0}),
        'mouseCursor': _materializeState({'type': 'defer'}),
        'overlayColor': _materializeState('#ff555555'),
        'padding': _materializeState({
          'bottom': 0.0,
          'left': 0.0,
          'right': 0.0,
          'top': 0.0,
        }),
        'shadowColor': _materializeState('#ff555555'),
        'shape': _materializeState({
          'side': {
            'color': '#ff000000',
            'strokeAlign': -1.0,
            'style': 'none',
            'width': 0.0,
          },
          'type': 'circle',
        }),
        'side': _materializeState({
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        }),
        'tapTargetSize': 'padded',
        'textStyle': _materializeState({'inherit': true}),
        'visualDensity': 'standard',
      },
    });

    expect(_buttonStylesAreEqual(decoded!.style, entry.style), true);
  });

  test('FilterQuality', () {
    expect(ThemeDecoder.decodeFilterQuality(null), null);
    expect(ThemeEncoder.encodeFilterQuality(null), null);

    expect(
      ThemeDecoder.decodeFilterQuality(FilterQuality.high),
      FilterQuality.high,
    );

    expect(ThemeDecoder.decodeFilterQuality('high'), FilterQuality.high);
    expect(ThemeDecoder.decodeFilterQuality('low'), FilterQuality.low);
    expect(ThemeDecoder.decodeFilterQuality('medium'), FilterQuality.medium);
    expect(ThemeDecoder.decodeFilterQuality('none'), FilterQuality.none);

    expect(ThemeEncoder.encodeFilterQuality(FilterQuality.high), 'high');
    expect(ThemeEncoder.encodeFilterQuality(FilterQuality.low), 'low');
    expect(ThemeEncoder.encodeFilterQuality(FilterQuality.medium), 'medium');
    expect(ThemeEncoder.encodeFilterQuality(FilterQuality.none), 'none');
  });

  test('FlexFit', () {
    expect(ThemeDecoder.decodeFlexFit(null), null);
    expect(ThemeEncoder.encodeFlexFit(null), null);

    expect(ThemeDecoder.decodeFlexFit(FlexFit.loose), FlexFit.loose);

    expect(ThemeDecoder.decodeFlexFit('loose'), FlexFit.loose);
    expect(ThemeDecoder.decodeFlexFit('tight'), FlexFit.tight);

    expect(ThemeEncoder.encodeFlexFit(FlexFit.loose), 'loose');
    expect(ThemeEncoder.encodeFlexFit(FlexFit.tight), 'tight');
  });

  test('FloatingActionButtonAnimator', () {
    expect(ThemeDecoder.decodeFloatingActionButtonAnimator(null), null);
    expect(ThemeEncoder.encodeFloatingActionButtonAnimator(null), null);

    expect(
      ThemeDecoder.decodeFloatingActionButtonAnimator(
        FloatingActionButtonAnimator.scaling,
      ),
      FloatingActionButtonAnimator.scaling,
    );

    expect(
      ThemeDecoder.decodeFloatingActionButtonAnimator('noAnimation'),
      FloatingActionButtonAnimator.noAnimation,
    );
    expect(
      ThemeDecoder.decodeFloatingActionButtonAnimator('scaling'),
      FloatingActionButtonAnimator.scaling,
    );
    expect(
      ThemeEncoder.encodeFloatingActionButtonAnimator(
        FloatingActionButtonAnimator.noAnimation,
      ),
      'noAnimation',
    );
    expect(
      ThemeEncoder.encodeFloatingActionButtonAnimator(
        FloatingActionButtonAnimator.scaling,
      ),
      'scaling',
    );
  });

  test('FloatingActionButtonLocation', () {
    expect(ThemeDecoder.decodeFloatingActionButtonLocation(null), null);
    expect(ThemeEncoder.encodeFloatingActionButtonLocation(null), null);

    final values = <String, FloatingActionButtonLocation>{
      'centerDocked': FloatingActionButtonLocation.centerDocked,
      'centerFloat': FloatingActionButtonLocation.centerFloat,
      'centerTop': FloatingActionButtonLocation.centerTop,
      'endDocked': FloatingActionButtonLocation.endDocked,
      'endFloat': FloatingActionButtonLocation.endFloat,
      'endTop': FloatingActionButtonLocation.endTop,
      'miniCenterDocked': FloatingActionButtonLocation.miniCenterDocked,
      'miniCenterFloat': FloatingActionButtonLocation.miniCenterFloat,
      'miniCenterTop': FloatingActionButtonLocation.miniCenterTop,
      'miniEndDocked': FloatingActionButtonLocation.miniEndDocked,
      'miniEndFloat': FloatingActionButtonLocation.miniEndFloat,
      'miniEndTop': FloatingActionButtonLocation.miniEndTop,
      'miniStartDocked': FloatingActionButtonLocation.miniStartDocked,
      'miniStartFloat': FloatingActionButtonLocation.miniStartFloat,
      'miniStartTop': FloatingActionButtonLocation.miniStartTop,
      'startDocked': FloatingActionButtonLocation.startDocked,
      'startFloat': FloatingActionButtonLocation.startFloat,
      'startTop': FloatingActionButtonLocation.startTop,
    };

    values.forEach((key, value) {
      expect(ThemeDecoder.decodeFloatingActionButtonLocation(value), value);

      expect(ThemeDecoder.decodeFloatingActionButtonLocation(key), value);

      expect(ThemeEncoder.encodeFloatingActionButtonLocation(value), key);
    });
  });

  test('FloatingActionButtonThemeData', () {
    expect(ThemeDecoder.decodeFloatingActionButtonThemeData(null), null);
    expect(ThemeEncoder.encodeFloatingActionButtonThemeData(null), null);

    expect(
      ThemeEncoder.encodeFloatingActionButtonThemeData(
        FloatingActionButtonThemeData(
          mouseCursor: WidgetStateProperty.all(SystemMouseCursors.basic),
        ),
      ),
      {
        'mouseCursor': {
          'disabled': {'cursor': 'basic', 'type': 'system'},
          'dragged': {'cursor': 'basic', 'type': 'system'},
          'empty': {'cursor': 'basic', 'type': 'system'},
          'error': {'cursor': 'basic', 'type': 'system'},
          'focused': {'cursor': 'basic', 'type': 'system'},
          'hovered': {'cursor': 'basic', 'type': 'system'},
          'pressed': {'cursor': 'basic', 'type': 'system'},
          'scrolledUnder': {'cursor': 'basic', 'type': 'system'},
          'selected': {'cursor': 'basic', 'type': 'system'},
        },
      },
    );

    const entry = FloatingActionButtonThemeData(
      backgroundColor: Color(0xff111111),
      disabledElevation: 1.0,
      elevation: 2.0,
      enableFeedback: true,
      extendedIconLabelSpacing: 1.0,
      extendedPadding: EdgeInsets.only(top: 2.0),
      extendedSizeConstraints: BoxConstraints(minHeight: 3.0, minWidth: 4.0),
      extendedTextStyle: TextStyle(color: _kColor),
      focusColor: Color(0xff222222),
      focusElevation: 3.0,
      foregroundColor: Color(0xff333333),
      highlightElevation: 4.0,
      hoverColor: Color(0xff444444),
      hoverElevation: 5.0,
      largeSizeConstraints: BoxConstraints(minHeight: 5.0, minWidth: 6.0),
      shape: RoundedRectangleBorder(),
      sizeConstraints: BoxConstraints(minHeight: 7.0, minWidth: 8.0),
      smallSizeConstraints: BoxConstraints(minHeight: 9.0, minWidth: 10.0),
      splashColor: Color(0xff555555),
    );

    expect(ThemeDecoder.decodeFloatingActionButtonThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeFloatingActionButtonThemeData(entry);
    final decoded = ThemeDecoder.decodeFloatingActionButtonThemeData(encoded);

    expect(encoded, {
      'backgroundColor': '#ff111111',
      'disabledElevation': 1.0,
      'elevation': 2.0,
      'enableFeedback': true,
      'extendedIconLabelSpacing': 1.0,
      'extendedPadding': {'bottom': 0.0, 'left': 0.0, 'right': 0.0, 'top': 2.0},
      'extendedSizeConstraints': {'minHeight': 3.0, 'minWidth': 4.0},
      'extendedTextStyle': {'color': _kColorStr, 'inherit': true},
      'focusColor': '#ff222222',
      'focusElevation': 3.0,
      'foregroundColor': '#ff333333',
      'highlightElevation': 4.0,
      'hoverColor': '#ff444444',
      'hoverElevation': 5.0,
      'largeSizeConstraints': {'minHeight': 5.0, 'minWidth': 6.0},
      'shape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'bottomRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'topLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'topRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded',
      },
      'sizeConstraints': {'minHeight': 7.0, 'minWidth': 8.0},
      'smallSizeConstraints': {'minHeight': 9.0, 'minWidth': 10.0},
      'splashColor': '#ff555555',
    });

    expect(decoded, entry);
  });

  test('FloatingLabelAlignment', () {
    expect(ThemeDecoder.decodeFloatingLabelAlignment(null), null);
    expect(ThemeEncoder.encodeFloatingLabelAlignment(null), null);

    expect(
      ThemeDecoder.decodeFloatingLabelAlignment(FloatingLabelAlignment.center),
      FloatingLabelAlignment.center,
    );

    expect(
      ThemeDecoder.decodeFloatingLabelAlignment('center'),
      FloatingLabelAlignment.center,
    );
    expect(
      ThemeDecoder.decodeFloatingLabelAlignment('start'),
      FloatingLabelAlignment.start,
    );

    expect(
      ThemeEncoder.encodeFloatingLabelAlignment(FloatingLabelAlignment.center),
      'center',
    );
    expect(
      ThemeEncoder.encodeFloatingLabelAlignment(FloatingLabelAlignment.start),
      'start',
    );
  });

  test('FloatingLabelBehavior', () {
    expect(ThemeDecoder.decodeFloatingLabelBehavior(null), null);
    expect(ThemeEncoder.encodeFloatingLabelBehavior(null), null);

    expect(
      ThemeDecoder.decodeFloatingLabelBehavior(FloatingLabelBehavior.always),
      FloatingLabelBehavior.always,
    );

    expect(
      ThemeDecoder.decodeFloatingLabelBehavior('always'),
      FloatingLabelBehavior.always,
    );
    expect(
      ThemeDecoder.decodeFloatingLabelBehavior('auto'),
      FloatingLabelBehavior.auto,
    );
    expect(
      ThemeDecoder.decodeFloatingLabelBehavior('never'),
      FloatingLabelBehavior.never,
    );

    expect(
      ThemeEncoder.encodeFloatingLabelBehavior(FloatingLabelBehavior.always),
      'always',
    );
    expect(
      ThemeEncoder.encodeFloatingLabelBehavior(FloatingLabelBehavior.auto),
      'auto',
    );
    expect(
      ThemeEncoder.encodeFloatingLabelBehavior(FloatingLabelBehavior.never),
      'never',
    );
  });

  test('FontFeature', () {
    expect(ThemeDecoder.decodeFontFeature(null), null);
    expect(ThemeEncoder.encodeFontFeature(null), null);

    const entry = FontFeature('fooo', 2);

    expect(ThemeDecoder.decodeFontFeature(entry), entry);

    final encoded = ThemeEncoder.encodeFontFeature(entry);
    final decoded = ThemeDecoder.decodeFontFeature(encoded);

    expect(encoded, {'feature': 'fooo', 'value': 2});

    expect(decoded, entry);
  });

  test('FontStyle', () {
    expect(ThemeDecoder.decodeFontStyle(null), null);
    expect(ThemeEncoder.encodeFontStyle(null), null);

    expect(ThemeDecoder.decodeFontStyle(FontStyle.italic), FontStyle.italic);

    expect(ThemeDecoder.decodeFontStyle('italic'), FontStyle.italic);
    expect(ThemeDecoder.decodeFontStyle('normal'), FontStyle.normal);

    expect(ThemeEncoder.encodeFontStyle(FontStyle.italic), 'italic');
    expect(ThemeEncoder.encodeFontStyle(FontStyle.normal), 'normal');
  });

  test('FontWeight', () {
    expect(ThemeDecoder.decodeFontWeight(null), null);
    expect(ThemeEncoder.encodeFontWeight(null), null);

    const weights = {
      'bold': FontWeight.bold,
      'normal': FontWeight.normal,
      'w100': FontWeight.w100,
      'w200': FontWeight.w200,
      'w300': FontWeight.w300,
      'w400': FontWeight.w400,
      'w500': FontWeight.w500,
      'w600': FontWeight.w600,
      'w700': FontWeight.w700,
      'w800': FontWeight.w800,
      'w900': FontWeight.w900,
    };

    weights.forEach((key, value) {
      expect(ThemeDecoder.decodeFontWeight(value), value);

      expect(ThemeDecoder.decodeFontWeight(key), value);

      // 'bold' and 'normal' are convenience keys that map to a w* value.  They
      // don't actually exist.
      if ('bold' != key && 'normal' != key) {
        expect(ThemeEncoder.encodeFontWeight(value), key);
      }
    });
  });

  test('FontVariation', () {
    expect(ThemeDecoder.decodeFontVariation(null), null);
    expect(ThemeEncoder.encodeFontVariation(null), null);

    const entry = FontVariation('slnt', 20.0);
    final encoded = ThemeEncoder.encodeFontVariation(entry);
    final decoded = ThemeDecoder.decodeFontVariation(encoded);

    expect(encoded, {'axis': 'slnt', 'value': 20.0});

    expect(entry, decoded);
  });

  test('Gradient', () {
    expect(ThemeDecoder.decodeGradient(null), null);
    expect(ThemeEncoder.encodeGradient(null), null);

    Gradient entry = const LinearGradient(
      colors: <Color>[Color(0xff111111), Color(0xff222222)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [1.0, 2.0, 3.0],
      tileMode: TileMode.clamp,
      transform: GradientRotation(4.0),
    );

    expect(ThemeDecoder.decodeGradient(entry), entry);

    var encoded = ThemeEncoder.encodeGradient(entry);
    var decoded = ThemeDecoder.decodeGradient(encoded);

    expect(encoded, {
      'colors': ['#ff111111', '#ff222222'],
      'begin': 'topLeft',
      'end': 'bottomRight',
      'stops': [1.0, 2.0, 3.0],
      'tileMode': 'clamp',
      'transform': {'radians': 4.0},
      'type': 'linear',
    });

    expect(decoded, entry);

    entry = const RadialGradient(
      center: Alignment.bottomCenter,
      colors: <Color>[Color(0xff111111), Color(0xff222222)],
      focal: Alignment.topCenter,
      focalRadius: 5.0,
      radius: 6.0,
      stops: [1.0, 2.0, 3.0],
      tileMode: TileMode.clamp,
      transform: GradientRotation(4.0),
    );

    encoded = ThemeEncoder.encodeGradient(entry);
    decoded = ThemeDecoder.decodeGradient(encoded);

    expect(encoded, {
      'center': 'bottomCenter',
      'colors': ['#ff111111', '#ff222222'],
      'focal': 'topCenter',
      'focalRadius': 5.0,
      'radius': 6.0,
      'stops': [1.0, 2.0, 3.0],
      'tileMode': 'clamp',
      'transform': {'radians': 4.0},
      'type': 'radial',
    });

    expect(decoded, entry);

    entry = const SweepGradient(
      center: Alignment.bottomCenter,
      colors: <Color>[Color(0xff111111), Color(0xff222222)],
      endAngle: 5.0,
      startAngle: 6.0,
      stops: [1.0, 2.0, 3.0],
      tileMode: TileMode.clamp,
      transform: GradientRotation(4.0),
    );

    encoded = ThemeEncoder.encodeGradient(entry);
    decoded = ThemeDecoder.decodeGradient(encoded);

    expect(encoded, {
      'center': 'bottomCenter',
      'colors': ['#ff111111', '#ff222222'],
      'endAngle': 5.0,
      'startAngle': 6.0,
      'stops': [1.0, 2.0, 3.0],
      'tileMode': 'clamp',
      'transform': {'radians': 4.0},
      'type': 'sweep',
    });

    expect(decoded, entry);
  });

  test('GradientTransform', () {
    expect(ThemeDecoder.decodeGradientTransform(null), null);
    expect(ThemeEncoder.encodeGradientTransform(null), null);

    const entry = GradientRotation(10.0);

    expect(ThemeDecoder.decodeGradientTransform(entry), entry);

    final encoded = ThemeEncoder.encodeGradientTransform(entry);
    final decoded = ThemeDecoder.decodeGradientTransform(encoded)!;

    expect(encoded, {'radians': 10.0});

    expect(decoded.runtimeType, entry.runtimeType);

    expect((decoded as GradientRotation).radians, entry.radians);
  });

  test('HitTestBehavior', () {
    expect(ThemeDecoder.decodeHitTestBehavior(null), null);
    expect(ThemeEncoder.encodeHitTestBehavior(null), null);

    expect(
      ThemeDecoder.decodeHitTestBehavior(HitTestBehavior.deferToChild),
      HitTestBehavior.deferToChild,
    );

    expect(
      ThemeDecoder.decodeHitTestBehavior('deferToChild'),
      HitTestBehavior.deferToChild,
    );
    expect(
      ThemeDecoder.decodeHitTestBehavior('opaque'),
      HitTestBehavior.opaque,
    );
    expect(
      ThemeDecoder.decodeHitTestBehavior('translucent'),
      HitTestBehavior.translucent,
    );

    expect(
      ThemeEncoder.encodeHitTestBehavior(HitTestBehavior.deferToChild),
      'deferToChild',
    );
    expect(
      ThemeEncoder.encodeHitTestBehavior(HitTestBehavior.opaque),
      'opaque',
    );
    expect(
      ThemeEncoder.encodeHitTestBehavior(HitTestBehavior.translucent),
      'translucent',
    );
  });

  test('Icon', () {
    expect(ThemeDecoder.decodeIcon(null), null);
    expect(ThemeEncoder.encodeIcon(null), null);

    const data = IconData(
      2,
      fontFamily: 'foo',
      fontPackage: 'bar',
      matchTextDirection: true,
    );

    expect({
      'icon': {
        'codePoint': 2,
        'fontFamily': 'foo',
        'fontPackage': 'bar',
        'matchTextDirection': true,
      },
    }, ThemeEncoder.encodeIcon(const Icon(data)));
    const entry = Icon(
      data,
      applyTextScaling: false,
      blendMode: BlendMode.colorBurn,
      color: _kColor,
      fill: 0.1,
      grade: 0.2,
      opticalSize: 0.3,
      size: 12.0,
      textDirection: TextDirection.ltr,
      weight: 400.0,
    );

    expect(ThemeDecoder.decodeIcon(entry), entry);

    final encoded = ThemeEncoder.encodeIcon(entry);
    final decoded = ThemeDecoder.decodeIcon(encoded);

    expect(encoded, {
      'applyTextScaling': false,
      'blendMode': 'colorBurn',
      'color': _kColorStr,
      'fill': 0.1,
      'grade': 0.2,
      'icon': {
        'codePoint': 2,
        'fontFamily': 'foo',
        'fontPackage': 'bar',
        'matchTextDirection': true,
      },
      'opticalSize': 0.3,
      'size': 12.0,
      'textDirection': 'ltr',
      'weight': 400.0,
    });

    expect(decoded.toString(), entry.toString());
  });

  test('IconAlignment', () {
    expect(ThemeDecoder.decodeIconAlignment(null), null);
    expect(ThemeEncoder.encodeIconAlignment(null), null);

    expect(
      ThemeDecoder.decodeIconAlignment(IconAlignment.end),
      IconAlignment.end,
    );
    expect(ThemeDecoder.decodeIconAlignment('end'), IconAlignment.end);
    expect(ThemeDecoder.decodeIconAlignment('start'), IconAlignment.start);

    expect(ThemeEncoder.encodeIconAlignment(IconAlignment.end), 'end');
    expect(ThemeEncoder.encodeIconAlignment(IconAlignment.start), 'start');
  });

  test('IconButtonThemeData', () {
    expect(ThemeDecoder.decodeIconButtonThemeData(null), null);
    expect(ThemeEncoder.encodeIconButtonThemeData(null), null);

    final entry = IconButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.bottomCenter,
        animationDuration: const Duration(milliseconds: 1000),
        backgroundColor: WidgetStateProperty.all(const Color(0xff555555)),
        elevation: WidgetStateProperty.all(1.0),
        enableFeedback: false,
        fixedSize: WidgetStateProperty.all(const Size(50.0, 50.0)),
        foregroundColor: WidgetStateProperty.all(const Color(0xff555555)),
        iconColor: WidgetStateProperty.all(const Color(0xff555555)),
        iconSize: WidgetStateProperty.all(12.0),
        maximumSize: WidgetStateProperty.all(const Size(10.0, 10.0)),
        minimumSize: WidgetStateProperty.all(const Size(100.0, 100.0)),
        mouseCursor: WidgetStateProperty.all(MouseCursor.defer),
        overlayColor: WidgetStateProperty.all(const Color(0xff555555)),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        shadowColor: WidgetStateProperty.all(const Color(0xff555555)),
        shape: WidgetStateProperty.all(const CircleBorder()),
        side: WidgetStateProperty.all(const BorderSide()),
        tapTargetSize: MaterialTapTargetSize.padded,
        textStyle: WidgetStateProperty.all(const TextStyle()),
        visualDensity: VisualDensity.standard,
      ),
    );

    expect(ThemeDecoder.decodeIconButtonThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeIconButtonThemeData(entry);
    final decoded = ThemeDecoder.decodeIconButtonThemeData(encoded);

    expect(encoded, {
      'style': {
        'alignment': 'bottomCenter',
        'animationDuration': 1000,
        'backgroundColor': _materializeState('#ff555555'),
        'elevation': _materializeState(1.0),
        'enableFeedback': false,
        'fixedSize': _materializeState({'height': 50.0, 'width': 50.0}),
        'foregroundColor': _materializeState('#ff555555'),
        'iconColor': _materializeState('#ff555555'),
        'iconSize': _materializeState(12.0),
        'maximumSize': _materializeState({'height': 10.0, 'width': 10.0}),
        'minimumSize': _materializeState({'height': 100.0, 'width': 100.0}),
        'mouseCursor': _materializeState({'type': 'defer'}),
        'overlayColor': _materializeState('#ff555555'),
        'padding': _materializeState({
          'bottom': 0.0,
          'left': 0.0,
          'right': 0.0,
          'top': 0.0,
        }),
        'shadowColor': _materializeState('#ff555555'),
        'shape': _materializeState({
          'side': {
            'color': '#ff000000',
            'strokeAlign': -1.0,
            'style': 'none',
            'width': 0.0,
          },
          'type': 'circle',
        }),
        'side': _materializeState({
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        }),
        'tapTargetSize': 'padded',
        'textStyle': _materializeState({'inherit': true}),
        'visualDensity': 'standard',
      },
    });

    expect(_buttonStylesAreEqual(decoded!.style, entry.style), true);
  });

  test('IconData', () {
    expect(ThemeDecoder.decodeIconData(null), null);
    expect(ThemeEncoder.encodeIconData(null), null);

    const entry = IconData(
      2,
      fontFamily: 'foo',
      fontFamilyFallback: ['baz', 'baaaz'],
      fontPackage: 'bar',
      matchTextDirection: true,
    );

    expect(ThemeDecoder.decodeIconData(entry), entry);

    final encoded = ThemeEncoder.encodeIconData(entry);
    final decoded = ThemeDecoder.decodeIconData(encoded);

    expect(encoded, {
      'codePoint': 2,
      'fontFamily': 'foo',
      'fontFamilyFallback': ['baz', 'baaaz'],
      'fontPackage': 'bar',
      'matchTextDirection': true,
    });

    expect(decoded, entry);
  });

  test('IconThemeData', () {
    expect(ThemeDecoder.decodeIconThemeData(null), null);
    expect(ThemeEncoder.encodeIconThemeData(null), null);

    const entry = IconThemeData(
      applyTextScaling: false,
      color: _kColor,
      fill: 0.5,
      grade: 3.0,
      opacity: 1.0,
      opticalSize: 4.0,
      size: 10.0,
      weight: 5.0,
    );

    expect(ThemeDecoder.decodeIconThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeIconThemeData(entry);
    final decoded = ThemeDecoder.decodeIconThemeData(encoded);

    expect(encoded, {
      'applyTextScaling': false,
      'color': _kColorStr,
      'fill': 0.5,
      'grade': 3.0,
      'opacity': 1.0,
      'opticalSize': 4.0,
      'size': 10.0,
      'weight': 5.0,
    });

    expect(decoded, entry);
  });

  test('ImageProvider', () {
    expect(ThemeDecoder.decodeImageProvider(null), null);
    expect(ThemeEncoder.encodeImageProvider(null), null);

    final images = [
      {'assetName': 'asset', 'package': 'package', 'type': 'asset'},
      {'bytes': base64Image, 'scale': 2.0, 'type': 'memory'},
      {
        'headers': {'foo': 'bar'},
        'scale': 3.0,
        'type': 'network',
        'url': 'network',
      },
    ];

    for (var image in images) {
      final decoded = ThemeDecoder.decodeImageProvider(image);
      expect(ThemeDecoder.decodeImageProvider(decoded), decoded);
      expect(ThemeEncoder.encodeImageProvider(decoded), image);
    }
  });

  test('ImageRepeat', () {
    expect(ThemeDecoder.decodeImageRepeat(null), null);
    expect(ThemeEncoder.encodeImageRepeat(null), null);

    expect(
      ThemeDecoder.decodeImageRepeat(ImageRepeat.noRepeat),
      ImageRepeat.noRepeat,
    );

    expect(ThemeDecoder.decodeImageRepeat('noRepeat'), ImageRepeat.noRepeat);
    expect(ThemeDecoder.decodeImageRepeat('repeat'), ImageRepeat.repeat);
    expect(ThemeDecoder.decodeImageRepeat('repeatX'), ImageRepeat.repeatX);
    expect(ThemeDecoder.decodeImageRepeat('repeatY'), ImageRepeat.repeatY);

    expect(ThemeEncoder.encodeImageRepeat(ImageRepeat.noRepeat), 'noRepeat');
    expect(ThemeEncoder.encodeImageRepeat(ImageRepeat.repeat), 'repeat');
    expect(ThemeEncoder.encodeImageRepeat(ImageRepeat.repeatX), 'repeatX');
    expect(ThemeEncoder.encodeImageRepeat(ImageRepeat.repeatY), 'repeatY');
  });

  test('InputBorder', () {
    expect(ThemeDecoder.decodeInputBorder(null), null);
    expect(ThemeEncoder.encodeInputBorder(null), null);

    const entry = OutlineInputBorder(
      borderSide: BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 3.0,
      ),
      gapPadding: 1.0,
    );

    expect(ThemeDecoder.decodeInputBorder(entry), entry);

    final encoded = ThemeEncoder.encodeInputBorder(entry);
    final decoded = ThemeDecoder.decodeInputBorder(encoded);

    expect(encoded, {
      'borderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
        'bottomRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
        'topLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
        'topRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
        'type': 'only',
      },
      'borderSide': {
        'color': '#00123456',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 3.0,
      },
      'gapPadding': 1.0,
      'type': 'outline',
    });

    expect(decoded, entry);

    const entry2 = UnderlineInputBorder(
      borderSide: BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 3.0,
      ),
    );

    final encoded2 = ThemeEncoder.encodeInputBorder(entry2);
    final decoded2 = ThemeDecoder.decodeInputBorder(encoded2);

    expect(encoded2, {
      'borderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
        'bottomRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
        'topLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
        'topRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
        'type': 'only',
      },
      'borderSide': {
        'color': '#00123456',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 3.0,
      },
      'type': 'underline',
    });

    expect(decoded2, entry2);
  });

  test('InputDecorationTheme', () {
    expect(ThemeDecoder.decodeInputDecorationTheme(null), null);
    expect(ThemeEncoder.encodeInputDecorationTheme(null), null);

    final entry = InputDecorationTheme(
      activeIndicatorBorder: const BorderSide(
        color: _kColor,
        strokeAlign: -2.0,
        style: BorderStyle.solid,
        width: 2.0,
      ),
      alignLabelWithHint: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0)),
      constraints: const BoxConstraints(minHeight: 2.0, minWidth: 1.0),
      contentPadding: const EdgeInsets.all(10.0),
      counterStyle: const TextStyle(color: Color(0xff111111)),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
      errorMaxLines: 1,
      errorStyle: const TextStyle(color: Color(0xff222222)),
      fillColor: const Color(0xff333333),
      filled: true,
      floatingLabelAlignment: FloatingLabelAlignment.center,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelStyle: const TextStyle(color: Color(0x00000000)),
      focusColor: const Color(0xff444444),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      helperMaxLines: 2,
      helperStyle: const TextStyle(color: Color(0xff555555)),
      hintFadeDuration: const Duration(milliseconds: 500),
      hintStyle: const TextStyle(color: Color(0xff666666)),
      hoverColor: const Color(0xff777777),
      iconColor: const Color(0xff223322),
      isCollapsed: true,
      isDense: true,
      labelStyle: const TextStyle(color: Color(0xff888888)),
      outlineBorder: const BorderSide(
        color: _kColor,
        strokeAlign: -3.0,
        style: BorderStyle.solid,
        width: 2.0,
      ),
      prefixIconConstraints: BoxConstraints(minHeight: 1.0, minWidth: 2.0),
      prefixIconColor: const Color(0xff334433),
      prefixStyle: const TextStyle(color: Color(0xff999999)),
      suffixIconColor: const Color(0xff445544),
      suffixIconConstraints: BoxConstraints(minHeight: 10.0, minWidth: 20.0),
      suffixStyle: const TextStyle(color: Color(0xff000000)),
    );

    expect(ThemeDecoder.decodeInputDecorationTheme(entry), entry);

    final encoded = ThemeEncoder.encodeInputDecorationTheme(entry);
    final decoded = ThemeDecoder.decodeInputDecorationTheme(encoded);

    expect(encoded, {
      'activeIndicatorBorder': {
        'color': _kColorStr,
        'strokeAlign': -2.0,
        'style': 'solid',
        'width': 2.0,
      },
      'alignLabelWithHint': true,
      'border': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
          'bottomRight': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
          'topLeft': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
          'topRight': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
          'type': 'only',
        },
        'borderSide': {
          'color': '#ff000000',
          'style': 'solid',
          'strokeAlign': -1.0,
          'width': 1.0,
        },
        'gapPadding': 4.0,
        'type': 'outline',
      },
      'constraints': {'minHeight': 2.0, 'minWidth': 1.0},
      'contentPadding': {
        'bottom': 10.0,
        'left': 10.0,
        'right': 10.0,
        'top': 10.0,
      },
      'counterStyle': {'color': '#ff111111', 'inherit': true},
      'disabledBorder': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
          'bottomRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
          'topLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
          'topRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
          'type': 'only',
        },
        'borderSide': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        },
        'gapPadding': 4.0,
        'type': 'outline',
      },
      'enabledBorder': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 3.0, 'y': 3.0},
          'bottomRight': {'type': 'elliptical', 'x': 3.0, 'y': 3.0},
          'topLeft': {'type': 'elliptical', 'x': 3.0, 'y': 3.0},
          'topRight': {'type': 'elliptical', 'x': 3.0, 'y': 3.0},
          'type': 'only',
        },
        'borderSide': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        },
        'gapPadding': 4.0,
        'type': 'outline',
      },
      'errorBorder': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'bottomRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'topLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'topRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'type': 'only',
        },
        'borderSide': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        },
        'gapPadding': 4.0,
        'type': 'outline',
      },
      'errorMaxLines': 1,
      'errorStyle': {'color': '#ff222222', 'inherit': true},
      'fillColor': '#ff333333',
      'filled': true,
      'floatingLabelAlignment': 'center',
      'floatingLabelBehavior': 'always',
      'floatingLabelStyle': {'color': '#00000000', 'inherit': true},
      'focusColor': '#ff444444',
      'focusedBorder': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 3.0, 'y': 3.0},
          'bottomRight': {'type': 'elliptical', 'x': 3.0, 'y': 3.0},
          'topLeft': {'type': 'elliptical', 'x': 3.0, 'y': 3.0},
          'topRight': {'type': 'elliptical', 'x': 3.0, 'y': 3.0},
          'type': 'only',
        },
        'borderSide': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        },
        'gapPadding': 4.0,
        'type': 'outline',
      },
      'focusedErrorBorder': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'bottomRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'topLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'topRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'type': 'only',
        },
        'borderSide': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        },
        'gapPadding': 4.0,
        'type': 'outline',
      },
      'helperMaxLines': 2,
      'helperStyle': {'color': '#ff555555', 'inherit': true},
      'hintFadeDuration': 500,
      'hintStyle': {'color': '#ff666666', 'inherit': true},
      'hoverColor': '#ff777777',
      'iconColor': '#ff223322',
      'isCollapsed': true,
      'isDense': true,
      'labelStyle': {'color': '#ff888888', 'inherit': true},
      'outlineBorder': {
        'color': _kColorStr,
        'strokeAlign': -3.0,
        'style': 'solid',
        'width': 2.0,
      },
      'prefixIconColor': '#ff334433',
      'prefixIconConstraints': {'minHeight': 1.0, 'minWidth': 2.0},
      'prefixStyle': {'color': '#ff999999', 'inherit': true},
      'suffixIconColor': '#ff445544',
      'suffixIconConstraints': {'minHeight': 10.0, 'minWidth': 20.0},
      'suffixStyle': {'color': '#ff000000', 'inherit': true},
    });

    expect(decoded, entry);
  });

  test('InteractiveInkFeatureFactory', () {
    expect(ThemeDecoder.decodeInteractiveInkFeatureFactory(null), null);
    expect(ThemeEncoder.encodeInteractiveInkFeatureFactory(null), null);

    expect(
      ThemeDecoder.decodeInteractiveInkFeatureFactory(InkSplash.splashFactory),
      InkSplash.splashFactory,
    );

    expect(
      ThemeDecoder.decodeInteractiveInkFeatureFactory('splash'),
      InkSplash.splashFactory,
    );
    expect(
      ThemeDecoder.decodeInteractiveInkFeatureFactory('ripple'),
      InkRipple.splashFactory,
    );
    expect(
      ThemeDecoder.decodeInteractiveInkFeatureFactory('sparkle'),
      InkSparkle.splashFactory,
    );

    expect(
      ThemeEncoder.encodeInteractiveInkFeatureFactory(InkSplash.splashFactory),
      'splash',
    );
    expect(
      ThemeEncoder.encodeInteractiveInkFeatureFactory(InkRipple.splashFactory),
      'ripple',
    );
    expect(
      ThemeEncoder.encodeInteractiveInkFeatureFactory(InkSparkle.splashFactory),
      'sparkle',
    );
  });

  test('ListTileControlAffinity', () {
    expect(ThemeDecoder.decodeListTileControlAffinity(null), null);
    expect(ThemeEncoder.encodeListTileControlAffinity(null), null);

    expect(
      ThemeDecoder.decodeListTileStyle(ListTileStyle.drawer),
      ListTileStyle.drawer,
    );

    expect(
      ThemeDecoder.decodeListTileControlAffinity('leading'),
      ListTileControlAffinity.leading,
    );
    expect(
      ThemeDecoder.decodeListTileControlAffinity('platform'),
      ListTileControlAffinity.platform,
    );
    expect(
      ThemeDecoder.decodeListTileControlAffinity('trailing'),
      ListTileControlAffinity.trailing,
    );

    expect(
      ThemeEncoder.encodeListTileControlAffinity(
        ListTileControlAffinity.leading,
      ),
      'leading',
    );
    expect(
      ThemeEncoder.encodeListTileControlAffinity(
        ListTileControlAffinity.platform,
      ),
      'platform',
    );
    expect(
      ThemeEncoder.encodeListTileControlAffinity(
        ListTileControlAffinity.trailing,
      ),
      'trailing',
    );
  });

  test('ListTileStyle', () {
    expect(ThemeDecoder.decodeListTileStyle(null), null);
    expect(ThemeEncoder.encodeListTileStyle(null), null);

    expect(
      ThemeDecoder.decodeListTileStyle(ListTileStyle.drawer),
      ListTileStyle.drawer,
    );

    expect(ThemeDecoder.decodeListTileStyle('drawer'), ListTileStyle.drawer);
    expect(ThemeDecoder.decodeListTileStyle('list'), ListTileStyle.list);

    expect(ThemeEncoder.encodeListTileStyle(ListTileStyle.drawer), 'drawer');
    expect(ThemeEncoder.encodeListTileStyle(ListTileStyle.list), 'list');
  });

  test('ListTileTitleAlignment', () {
    expect(ThemeDecoder.decodeListTileTitleAlignment(null), null);
    expect(ThemeEncoder.encodeListTileTitleAlignment(null), null);

    expect(
      ThemeDecoder.decodeListTileTitleAlignment(ListTileTitleAlignment.bottom),
      ListTileTitleAlignment.bottom,
    );

    expect(
      ThemeDecoder.decodeListTileTitleAlignment('bottom'),
      ListTileTitleAlignment.bottom,
    );
    expect(
      ThemeDecoder.decodeListTileTitleAlignment('center'),
      ListTileTitleAlignment.center,
    );
    expect(
      ThemeDecoder.decodeListTileTitleAlignment('threeLine'),
      ListTileTitleAlignment.threeLine,
    );
    expect(
      ThemeDecoder.decodeListTileTitleAlignment('titleHeight'),
      ListTileTitleAlignment.titleHeight,
    );
    expect(
      ThemeDecoder.decodeListTileTitleAlignment('top'),
      ListTileTitleAlignment.top,
    );

    expect(
      ThemeEncoder.encodeListTileTitleAlignment(ListTileTitleAlignment.bottom),
      'bottom',
    );
    expect(
      ThemeEncoder.encodeListTileTitleAlignment(ListTileTitleAlignment.center),
      'center',
    );
    expect(
      ThemeEncoder.encodeListTileTitleAlignment(
        ListTileTitleAlignment.threeLine,
      ),
      'threeLine',
    );
    expect(
      ThemeEncoder.encodeListTileTitleAlignment(
        ListTileTitleAlignment.titleHeight,
      ),
      'titleHeight',
    );
    expect(
      ThemeEncoder.encodeListTileTitleAlignment(ListTileTitleAlignment.top),
      'top',
    );
  });

  test('ListTileThemeData', () {
    expect(ThemeDecoder.decodeListTileThemeData(null), null);
    expect(ThemeEncoder.encodeListTileThemeData(null), null);

    const entry = ListTileThemeData(
      contentPadding: EdgeInsets.fromLTRB(1, 2, 3, 4),
      controlAffinity: ListTileControlAffinity.trailing,
      dense: true,
      enableFeedback: false,
      horizontalTitleGap: 5,
      iconColor: Color(0xff111111),
      minLeadingWidth: 6,
      minTileHeight: 10.0,
      minVerticalPadding: 7,
      selectedColor: Color(0xff222222),
      selectedTileColor: Color(0xff333333),
      shape: ContinuousRectangleBorder(),
      style: ListTileStyle.drawer,
      textColor: Color(0xff444444),
      tileColor: Color(0xff555555),
    );

    final decoded = ThemeDecoder.decodeListTileThemeData(entry);
    final encoded = ThemeEncoder.encodeListTileThemeData(decoded);

    expect(encoded, {
      'contentPadding': {'left': 1, 'top': 2, 'right': 3, 'bottom': 4},
      'controlAffinity': 'trailing',
      'dense': true,
      'enableFeedback': false,
      'horizontalTitleGap': 5,
      'iconColor': '#ff111111',
      'minLeadingWidth': 6,
      'minTileHeight': 10.0,
      'minVerticalPadding': 7,
      'selectedColor': '#ff222222',
      'selectedTileColor': '#ff333333',
      'shape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'bottomRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'topLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'topRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rectangle',
      },
      'style': 'drawer',
      'textColor': '#ff444444',
      'tileColor': '#ff555555',
    });

    expect(decoded, entry);
  });

  test('Locale', () {
    expect(ThemeDecoder.decodeLocale(null), null);
    expect(ThemeEncoder.encodeLocale(null), null);

    const entry = Locale('en', 'US');

    expect(ThemeDecoder.decodeLocale(entry), entry);

    final encoded = ThemeEncoder.encodeLocale(entry);
    final decoded = ThemeDecoder.decodeLocale(encoded);

    expect(encoded, {'countryCode': 'US', 'languageCode': 'en'});

    expect(decoded, entry);
  });

  test('MainAxisAlignment', () {
    expect(ThemeDecoder.decodeMainAxisAlignment(null), null);
    expect(ThemeEncoder.encodeMainAxisAlignment(null), null);

    expect(
      ThemeDecoder.decodeMainAxisAlignment(MainAxisAlignment.center),
      MainAxisAlignment.center,
    );

    expect(
      ThemeDecoder.decodeMainAxisAlignment('center'),
      MainAxisAlignment.center,
    );
    expect(ThemeDecoder.decodeMainAxisAlignment('end'), MainAxisAlignment.end);
    expect(
      ThemeDecoder.decodeMainAxisAlignment('spaceAround'),
      MainAxisAlignment.spaceAround,
    );
    expect(
      ThemeDecoder.decodeMainAxisAlignment('spaceBetween'),
      MainAxisAlignment.spaceBetween,
    );
    expect(
      ThemeDecoder.decodeMainAxisAlignment('spaceEvenly'),
      MainAxisAlignment.spaceEvenly,
    );
    expect(
      ThemeDecoder.decodeMainAxisAlignment('start'),
      MainAxisAlignment.start,
    );

    expect(
      ThemeEncoder.encodeMainAxisAlignment(MainAxisAlignment.center),
      'center',
    );
    expect(ThemeEncoder.encodeMainAxisAlignment(MainAxisAlignment.end), 'end');
    expect(
      ThemeEncoder.encodeMainAxisAlignment(MainAxisAlignment.spaceAround),
      'spaceAround',
    );
    expect(
      ThemeEncoder.encodeMainAxisAlignment(MainAxisAlignment.spaceBetween),
      'spaceBetween',
    );
    expect(
      ThemeEncoder.encodeMainAxisAlignment(MainAxisAlignment.spaceEvenly),
      'spaceEvenly',
    );
    expect(
      ThemeEncoder.encodeMainAxisAlignment(MainAxisAlignment.start),
      'start',
    );
  });

  test('MainAxisSize', () {
    expect(ThemeDecoder.decodeMainAxisSize(null), null);
    expect(ThemeEncoder.encodeMainAxisSize(null), null);

    expect(ThemeDecoder.decodeMainAxisSize(MainAxisSize.max), MainAxisSize.max);

    expect(ThemeDecoder.decodeMainAxisSize('max'), MainAxisSize.max);
    expect(ThemeDecoder.decodeMainAxisSize('min'), MainAxisSize.min);

    expect(ThemeEncoder.encodeMainAxisSize(MainAxisSize.max), 'max');
    expect(ThemeEncoder.encodeMainAxisSize(MainAxisSize.min), 'min');
  });

  test('MaterialBannerThemeData', () {
    expect(ThemeDecoder.decodeMaterialBannerThemeData(null), null);
    expect(ThemeEncoder.encodeMaterialBannerThemeData(null), null);

    const entry = MaterialBannerThemeData(
      backgroundColor: _kColor,
      contentTextStyle: _kTextStyle,
      dividerColor: Color(0xff111111),
      elevation: 5.5,
      leadingPadding: EdgeInsets.all(1.0),
      padding: EdgeInsets.all(2.0),
      shadowColor: Color(0xff222222),
      surfaceTintColor: Color(0xff333333),
    );

    expect(ThemeDecoder.decodeMaterialBannerThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeMaterialBannerThemeData(entry);
    final decoded = ThemeDecoder.decodeMaterialBannerThemeData(encoded);

    expect(encoded, {
      'backgroundColor': _kColorStr,
      'contentTextStyle': _kTextStyleJson,
      'dividerColor': '#ff111111',
      'elevation': 5.5,
      'leadingPadding': {'bottom': 1.0, 'left': 1.0, 'right': 1.0, 'top': 1.0},
      'padding': {'bottom': 2.0, 'left': 2.0, 'right': 2.0, 'top': 2.0},
      'shadowColor': '#ff222222',
      'surfaceTintColor': '#ff333333',
    });

    expect(decoded, entry);
  });

  test('MaterialColor', () {
    expect(ThemeDecoder.decodeMaterialColor(null), null);
    expect(ThemeEncoder.encodeMaterialColor(null), null);

    final entry = MaterialColor(colorToInt(_kColor)!, const {
      50: _kColor,
      100: _kColor,
      200: _kColor,
      300: _kColor,
      400: _kColor,
      500: _kColor,
      600: _kColor,
      700: _kColor,
      800: _kColor,
      900: _kColor,
    });

    expect(ThemeDecoder.decodeMaterialColor(entry), entry);

    final encoded = ThemeEncoder.encodeMaterialColor(entry);
    final decoded = ThemeDecoder.decodeMaterialColor(encoded);

    expect(encoded, {
      'primary': _kColorStr,
      'swatches': {
        '50': _kColorStr,
        '100': _kColorStr,
        '200': _kColorStr,
        '300': _kColorStr,
        '400': _kColorStr,
        '500': _kColorStr,
        '600': _kColorStr,
        '700': _kColorStr,
        '800': _kColorStr,
        '900': _kColorStr,
      },
    });

    expect(ThemeEncoder.encodeMaterialColor(decoded), encoded);
  });

  test('MaterialTapTargetSize', () {
    expect(ThemeDecoder.decodeMaterialTapTargetSize(null), null);
    expect(ThemeEncoder.encodeMaterialTapTargetSize(null), null);

    expect(
      ThemeDecoder.decodeMaterialTapTargetSize(MaterialTapTargetSize.padded),
      MaterialTapTargetSize.padded,
    );

    expect(
      ThemeDecoder.decodeMaterialTapTargetSize('padded'),
      MaterialTapTargetSize.padded,
    );
    expect(
      ThemeDecoder.decodeMaterialTapTargetSize('shrinkWrap'),
      MaterialTapTargetSize.shrinkWrap,
    );

    expect(
      ThemeEncoder.encodeMaterialTapTargetSize(MaterialTapTargetSize.padded),
      'padded',
    );
    expect(
      ThemeEncoder.encodeMaterialTapTargetSize(
        MaterialTapTargetSize.shrinkWrap,
      ),
      'shrinkWrap',
    );
  });

  test('MaterialType', () {
    expect(ThemeDecoder.decodeMaterialType(null), null);
    expect(ThemeEncoder.encodeMaterialType(null), null);

    expect(
      ThemeDecoder.decodeMaterialType(MaterialType.button),
      MaterialType.button,
    );

    expect(ThemeDecoder.decodeMaterialType('button'), MaterialType.button);
    expect(ThemeDecoder.decodeMaterialType('canvas'), MaterialType.canvas);
    expect(ThemeDecoder.decodeMaterialType('card'), MaterialType.card);
    expect(ThemeDecoder.decodeMaterialType('circle'), MaterialType.circle);
    expect(
      ThemeDecoder.decodeMaterialType('transparency'),
      MaterialType.transparency,
    );

    expect(ThemeEncoder.encodeMaterialType(MaterialType.button), 'button');
    expect(ThemeEncoder.encodeMaterialType(MaterialType.canvas), 'canvas');
    expect(ThemeEncoder.encodeMaterialType(MaterialType.card), 'card');
    expect(ThemeEncoder.encodeMaterialType(MaterialType.circle), 'circle');
    expect(
      ThemeEncoder.encodeMaterialType(MaterialType.transparency),
      'transparency',
    );
  });

  test('Matrix4', () {
    expect(ThemeDecoder.decodeMatrix4(null), null);
    expect(ThemeEncoder.encodeMatrix4(null), null);

    final entry = Matrix4(
      1.0,
      2.0,
      3.0,
      4.0,
      5.0,
      6.0,
      7.0,
      8.0,
      9.0,
      10.0,
      11.0,
      12.0,
      13.0,
      14.0,
      15.0,
      16.0,
    );

    expect(ThemeDecoder.decodeMatrix4(entry), entry);

    final encoded = ThemeEncoder.encodeMatrix4(entry);
    final decoded = ThemeDecoder.decodeMatrix4(encoded);

    expect(encoded, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]);

    expect(decoded, entry);
  });

  test('MaxLengthEnforcement', () {
    expect(ThemeDecoder.decodeMaxLengthEnforcement(null), null);
    expect(ThemeEncoder.encodeMaxLengthEnforcement(null), null);

    expect(
      ThemeDecoder.decodeMaxLengthEnforcement('enforced'),
      MaxLengthEnforcement.enforced,
    );
    expect(
      ThemeDecoder.decodeMaxLengthEnforcement('none'),
      MaxLengthEnforcement.none,
    );
    expect(
      ThemeDecoder.decodeMaxLengthEnforcement('truncateAfterCompositionEnds'),
      MaxLengthEnforcement.truncateAfterCompositionEnds,
    );

    expect(
      ThemeEncoder.encodeMaxLengthEnforcement(MaxLengthEnforcement.enforced),
      'enforced',
    );
    expect(
      ThemeEncoder.encodeMaxLengthEnforcement(MaxLengthEnforcement.none),
      'none',
    );
    expect(
      ThemeEncoder.encodeMaxLengthEnforcement(
        MaxLengthEnforcement.truncateAfterCompositionEnds,
      ),
      'truncateAfterCompositionEnds',
    );
  });

  test('MenuButtonThemeData', () {
    expect(ThemeDecoder.decodeMenuButtonThemeData(null), null);
    expect(ThemeEncoder.encodeMenuButtonThemeData(null), null);

    final entry = MenuButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.bottomCenter,
        animationDuration: const Duration(milliseconds: 1000),
        backgroundColor: WidgetStateProperty.all(const Color(0xff555555)),
        elevation: WidgetStateProperty.all(1.0),
        enableFeedback: false,
        fixedSize: WidgetStateProperty.all(const Size(50.0, 50.0)),
        foregroundColor: WidgetStateProperty.all(const Color(0xff555555)),
        iconColor: WidgetStateProperty.all(const Color(0xff555555)),
        iconSize: WidgetStateProperty.all(12.0),
        maximumSize: WidgetStateProperty.all(const Size(10.0, 10.0)),
        minimumSize: WidgetStateProperty.all(const Size(100.0, 100.0)),
        mouseCursor: WidgetStateProperty.all(MouseCursor.defer),
        overlayColor: WidgetStateProperty.all(const Color(0xff555555)),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        shadowColor: WidgetStateProperty.all(const Color(0xff555555)),
        shape: WidgetStateProperty.all(const CircleBorder()),
        side: WidgetStateProperty.all(const BorderSide()),
        tapTargetSize: MaterialTapTargetSize.padded,
        textStyle: WidgetStateProperty.all(const TextStyle()),
        visualDensity: VisualDensity.standard,
      ),
    );

    expect(ThemeDecoder.decodeMenuButtonThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeMenuButtonThemeData(entry);
    final decoded = ThemeDecoder.decodeMenuButtonThemeData(encoded);

    expect(encoded, {
      'style': {
        'alignment': 'bottomCenter',
        'animationDuration': 1000,
        'backgroundColor': _materializeState('#ff555555'),
        'elevation': _materializeState(1.0),
        'enableFeedback': false,
        'fixedSize': _materializeState({'height': 50.0, 'width': 50.0}),
        'foregroundColor': _materializeState('#ff555555'),
        'iconColor': _materializeState('#ff555555'),
        'iconSize': _materializeState(12.0),
        'maximumSize': _materializeState({'height': 10.0, 'width': 10.0}),
        'minimumSize': _materializeState({'height': 100.0, 'width': 100.0}),
        'mouseCursor': _materializeState({'type': 'defer'}),
        'overlayColor': _materializeState('#ff555555'),
        'padding': _materializeState({
          'bottom': 0.0,
          'left': 0.0,
          'right': 0.0,
          'top': 0.0,
        }),
        'shadowColor': _materializeState('#ff555555'),
        'shape': _materializeState({
          'side': {
            'color': '#ff000000',
            'strokeAlign': -1.0,
            'style': 'none',
            'width': 0.0,
          },
          'type': 'circle',
        }),
        'side': _materializeState({
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'solid',
          'width': 1.0,
        }),
        'tapTargetSize': 'padded',
        'textStyle': _materializeState({'inherit': true}),
        'visualDensity': 'standard',
      },
    });

    expect(_buttonStylesAreEqual(decoded!.style, entry.style), true);
  });

  test('MenuStyle', () {
    expect(ThemeDecoder.decodeMenuStyle(null), null);
    expect(ThemeEncoder.encodeMenuStyle(null), null);

    const entry = MenuStyle(alignment: Alignment.center);

    expect(ThemeDecoder.decodeMenuStyle(entry), entry);

    final encoded = ThemeEncoder.encodeMenuStyle(entry);
    final decoded = ThemeDecoder.decodeMenuStyle(encoded);

    expect(encoded, {'alignment': 'center'});

    expect(entry, decoded);
  });

  test('MouseCursor', () {
    expect(ThemeDecoder.decodeMouseCursor(null), null);
    expect(ThemeEncoder.encodeMouseCursor(null), null);

    expect(
      ThemeDecoder.decodeMouseCursor(MouseCursor.defer),
      MouseCursor.defer,
    );

    expect(
      ThemeDecoder.decodeMouseCursor({'type': 'defer'}),
      MouseCursor.defer,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'clickable',
        'type': 'material',
      }),
      WidgetStateMouseCursor.clickable,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'textable',
        'type': 'material',
      }),
      WidgetStateMouseCursor.textable,
    );

    expect(
      ThemeDecoder.decodeMouseCursor({'cursor': 'alias', 'type': 'system'}),
      SystemMouseCursors.alias,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({'cursor': 'allScroll', 'type': 'system'}),
      SystemMouseCursors.allScroll,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({'cursor': 'basic', 'type': 'system'}),
      SystemMouseCursors.basic,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({'cursor': 'cell', 'type': 'system'}),
      SystemMouseCursors.cell,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({'cursor': 'click', 'type': 'system'}),
      SystemMouseCursors.click,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'contextMenu',
        'type': 'system',
      }),
      SystemMouseCursors.contextMenu,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({'cursor': 'copy', 'type': 'system'}),
      SystemMouseCursors.copy,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'disappearing',
        'type': 'system',
      }),
      SystemMouseCursors.disappearing,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({'cursor': 'forbidden', 'type': 'system'}),
      SystemMouseCursors.forbidden,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({'cursor': 'grab', 'type': 'system'}),
      SystemMouseCursors.grab,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({'cursor': 'grabbing', 'type': 'system'}),
      SystemMouseCursors.grabbing,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({'cursor': 'help', 'type': 'system'}),
      SystemMouseCursors.help,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({'cursor': 'move', 'type': 'system'}),
      SystemMouseCursors.move,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({'cursor': 'noDrop', 'type': 'system'}),
      SystemMouseCursors.noDrop,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({'cursor': 'none', 'type': 'system'}),
      SystemMouseCursors.none,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({'cursor': 'precise', 'type': 'system'}),
      SystemMouseCursors.precise,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({'cursor': 'progress', 'type': 'system'}),
      SystemMouseCursors.progress,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeColumn',
        'type': 'system',
      }),
      SystemMouseCursors.resizeColumn,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeDown',
        'type': 'system',
      }),
      SystemMouseCursors.resizeDown,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeDownLeft',
        'type': 'system',
      }),
      SystemMouseCursors.resizeDownLeft,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeDownRight',
        'type': 'system',
      }),
      SystemMouseCursors.resizeDownRight,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeLeft',
        'type': 'system',
      }),
      SystemMouseCursors.resizeLeft,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeRight',
        'type': 'system',
      }),
      SystemMouseCursors.resizeRight,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({'cursor': 'resizeRow', 'type': 'system'}),
      SystemMouseCursors.resizeRow,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({'cursor': 'resizeUp', 'type': 'system'}),
      SystemMouseCursors.resizeUp,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeUpDown',
        'type': 'system',
      }),
      SystemMouseCursors.resizeUpDown,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeUpLeft',
        'type': 'system',
      }),
      SystemMouseCursors.resizeUpLeft,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeUpLeftDownRight',
        'type': 'system',
      }),
      SystemMouseCursors.resizeUpLeftDownRight,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeUpRight',
        'type': 'system',
      }),
      SystemMouseCursors.resizeUpRight,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'resizeUpRightDownLeft',
        'type': 'system',
      }),
      SystemMouseCursors.resizeUpRightDownLeft,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({'cursor': 'text', 'type': 'system'}),
      SystemMouseCursors.text,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({
        'cursor': 'verticalText',
        'type': 'system',
      }),
      SystemMouseCursors.verticalText,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({'cursor': 'wait', 'type': 'system'}),
      SystemMouseCursors.wait,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({'cursor': 'zoomIn', 'type': 'system'}),
      SystemMouseCursors.zoomIn,
    );
    expect(
      ThemeDecoder.decodeMouseCursor({'cursor': 'zoomOut', 'type': 'system'}),
      SystemMouseCursors.zoomOut,
    );

    expect(
      ThemeDecoder.decodeMouseCursor({'type': 'uncontrolled'}),
      MouseCursor.uncontrolled,
    );

    expect(ThemeEncoder.encodeMouseCursor(MouseCursor.defer), {
      'type': 'defer',
    });
    expect(ThemeEncoder.encodeMouseCursor(WidgetStateMouseCursor.clickable), {
      'cursor': 'clickable',
      'type': 'material',
    });
    expect(ThemeEncoder.encodeMouseCursor(WidgetStateMouseCursor.textable), {
      'cursor': 'textable',
      'type': 'material',
    });

    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.alias), {
      'cursor': 'alias',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.allScroll), {
      'cursor': 'allScroll',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.basic), {
      'cursor': 'basic',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.cell), {
      'cursor': 'cell',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.click), {
      'cursor': 'click',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.contextMenu), {
      'cursor': 'contextMenu',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.copy), {
      'cursor': 'copy',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.disappearing), {
      'cursor': 'disappearing',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.forbidden), {
      'cursor': 'forbidden',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.grab), {
      'cursor': 'grab',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.grabbing), {
      'cursor': 'grabbing',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.help), {
      'cursor': 'help',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.move), {
      'cursor': 'move',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.noDrop), {
      'cursor': 'noDrop',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.none), {
      'cursor': 'none',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.precise), {
      'cursor': 'precise',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.progress), {
      'cursor': 'progress',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.resizeColumn), {
      'cursor': 'resizeColumn',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.resizeDown), {
      'cursor': 'resizeDown',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.resizeDownLeft), {
      'cursor': 'resizeDownLeft',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.resizeDownRight), {
      'cursor': 'resizeDownRight',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.resizeLeft), {
      'cursor': 'resizeLeft',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.resizeRight), {
      'cursor': 'resizeRight',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.resizeRow), {
      'cursor': 'resizeRow',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.resizeUp), {
      'cursor': 'resizeUp',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.resizeUpDown), {
      'cursor': 'resizeUpDown',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.resizeUpLeft), {
      'cursor': 'resizeUpLeft',
      'type': 'system',
    });
    expect(
      ThemeEncoder.encodeMouseCursor(SystemMouseCursors.resizeUpLeftDownRight),
      {'cursor': 'resizeUpLeftDownRight', 'type': 'system'},
    );
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.resizeUpRight), {
      'cursor': 'resizeUpRight',
      'type': 'system',
    });
    expect(
      ThemeEncoder.encodeMouseCursor(SystemMouseCursors.resizeUpRightDownLeft),
      {'cursor': 'resizeUpRightDownLeft', 'type': 'system'},
    );
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.text), {
      'cursor': 'text',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.verticalText), {
      'cursor': 'verticalText',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.wait), {
      'cursor': 'wait',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.zoomIn), {
      'cursor': 'zoomIn',
      'type': 'system',
    });
    expect(ThemeEncoder.encodeMouseCursor(SystemMouseCursors.zoomOut), {
      'cursor': 'zoomOut',
      'type': 'system',
    });

    expect(ThemeEncoder.encodeMouseCursor(MouseCursor.uncontrolled), {
      'type': 'uncontrolled',
    });
  });

  test('NavigationDestinationLabelBehavior', () {
    expect(ThemeDecoder.decodeNavigationDestinationLabelBehavior(null), null);
    expect(ThemeEncoder.encodeNavigationDestinationLabelBehavior(null), null);

    expect(
      ThemeDecoder.decodeNavigationDestinationLabelBehavior(
        NavigationDestinationLabelBehavior.alwaysHide,
      ),
      NavigationDestinationLabelBehavior.alwaysHide,
    );

    expect(
      ThemeDecoder.decodeNavigationDestinationLabelBehavior('alwaysHide'),
      NavigationDestinationLabelBehavior.alwaysHide,
    );
    expect(
      ThemeDecoder.decodeNavigationDestinationLabelBehavior('alwaysShow'),
      NavigationDestinationLabelBehavior.alwaysShow,
    );
    expect(
      ThemeDecoder.decodeNavigationDestinationLabelBehavior('onlyShowSelected'),
      NavigationDestinationLabelBehavior.onlyShowSelected,
    );

    expect(
      ThemeEncoder.encodeNavigationDestinationLabelBehavior(
        NavigationDestinationLabelBehavior.alwaysHide,
      ),
      'alwaysHide',
    );
    expect(
      ThemeEncoder.encodeNavigationDestinationLabelBehavior(
        NavigationDestinationLabelBehavior.alwaysShow,
      ),
      'alwaysShow',
    );
    expect(
      ThemeEncoder.encodeNavigationDestinationLabelBehavior(
        NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
      'onlyShowSelected',
    );
  });

  test('NavigationRailLabelType', () {
    expect(ThemeDecoder.decodeNavigationRailLabelType(null), null);
    expect(ThemeEncoder.encodeNavigationRailLabelType(null), null);

    expect(
      ThemeDecoder.decodeNavigationRailLabelType(NavigationRailLabelType.all),
      NavigationRailLabelType.all,
    );

    expect(
      ThemeDecoder.decodeNavigationRailLabelType('all'),
      NavigationRailLabelType.all,
    );
    expect(
      ThemeDecoder.decodeNavigationRailLabelType('none'),
      NavigationRailLabelType.none,
    );
    expect(
      ThemeDecoder.decodeNavigationRailLabelType('selected'),
      NavigationRailLabelType.selected,
    );

    expect(
      ThemeEncoder.encodeNavigationRailLabelType(NavigationRailLabelType.all),
      'all',
    );
    expect(
      ThemeEncoder.encodeNavigationRailLabelType(NavigationRailLabelType.none),
      'none',
    );
    expect(
      ThemeEncoder.encodeNavigationRailLabelType(
        NavigationRailLabelType.selected,
      ),
      'selected',
    );
  });

  test('NavigationBarThemeData', () {
    expect(ThemeDecoder.decodeNavigationBarThemeData(null), null);
    expect(ThemeEncoder.encodeNavigationBarThemeData(null), null);

    final entry = NavigationBarThemeData(
      backgroundColor: Color(0xff111111),
      elevation: 4.0,
      height: 12.0,
      indicatorColor: Color(0xff222222),
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      labelPadding: EdgeInsets.all(8.0),
      overlayColor: WidgetStateProperty.all(Color(0xff222222)),
      shadowColor: Color(0xff333333),
      surfaceTintColor: Color(0xff444444),
    );

    final encoded = ThemeEncoder.encodeNavigationBarThemeData(entry);
    final decoded = ThemeDecoder.decodeNavigationBarThemeData(encoded);

    expect(encoded, {
      'backgroundColor': '#ff111111',
      'elevation': 4.0,
      'height': 12.0,
      'indicatorColor': '#ff222222',
      'labelBehavior': 'onlyShowSelected',
      'labelPadding': {'bottom': 8.0, 'left': 8.0, 'right': 8.0, 'top': 8.0},
      'overlayColor': _materializeState('#ff222222'),
      'shadowColor': '#ff333333',
      'surfaceTintColor': '#ff444444',
    });
    expect(ThemeEncoder.encodeNavigationBarThemeData(decoded), encoded);
  });

  test('NavigationRailThemeData', () {
    expect(ThemeDecoder.decodeNavigationRailThemeData(null), null);
    expect(ThemeEncoder.encodeNavigationRailThemeData(null), null);

    const entry = NavigationRailThemeData(
      backgroundColor: Color(0xff111111),
      elevation: 1.0,
      groupAlignment: 2.0,
      indicatorColor: Color(0xff666666),
      labelType: NavigationRailLabelType.all,
      selectedIconTheme: IconThemeData(
        color: Color(0xff222222),
        opacity: 0.5,
        size: 4.0,
      ),
      selectedLabelTextStyle: TextStyle(color: Color(0xff333333)),
      unselectedIconTheme: IconThemeData(
        color: Color(0xff444444),
        opacity: 0.6,
        size: 6.0,
      ),
      unselectedLabelTextStyle: TextStyle(color: Color(0xff555555)),
      useIndicator: true,
    );

    expect(ThemeDecoder.decodeNavigationRailThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeNavigationRailThemeData(entry);
    final decoded = ThemeDecoder.decodeNavigationRailThemeData(encoded);

    expect(encoded, {
      'backgroundColor': '#ff111111',
      'elevation': 1.0,
      'groupAlignment': 2.0,
      'indicatorColor': '#ff666666',
      'labelType': 'all',
      'selectedIconTheme': {'color': '#ff222222', 'opacity': 0.5, 'size': 4.0},
      'selectedLabelTextStyle': {'color': '#ff333333', 'inherit': true},
      'unselectedIconTheme': {
        'color': '#ff444444',
        'opacity': 0.6,
        'size': 6.0,
      },
      'unselectedLabelTextStyle': {'color': '#ff555555', 'inherit': true},
      'useIndicator': true,
    });

    expect(decoded, entry);
  });

  test('NotchedShape', () {
    expect(ThemeDecoder.decodeNotchedShape(null), null);
    expect(ThemeEncoder.encodeNotchedShape(null), null);

    const entry = CircularNotchedRectangle();
    expect(ThemeDecoder.decodeNotchedShape(entry), entry);
    expect(
      ThemeDecoder.decodeNotchedShape('circular')?.runtimeType,
      const CircularNotchedRectangle().runtimeType,
    );
    expect(
      ThemeEncoder.encodeNotchedShape(const CircularNotchedRectangle()),
      'circular',
    );
  });

  test('OrdinalSortKey', () {
    expect(ThemeDecoder.decodeOrdinalSortKey(null), null);
    expect(ThemeEncoder.encodeOrdinalSortKey(null), null);

    const entry = OrdinalSortKey(1.0, name: 'foo');

    expect(ThemeDecoder.decodeOrdinalSortKey(entry), entry);

    final encoded = ThemeEncoder.encodeOrdinalSortKey(entry);
    final decoded = ThemeDecoder.decodeOrdinalSortKey(encoded);

    expect(encoded, {'name': 'foo', 'order': 1.0});

    expect(decoded!.name, entry.name);
    expect(decoded.order, entry.order);
  });

  test('Offset', () {
    expect(ThemeDecoder.decodeOffset(null), null);
    expect(ThemeEncoder.encodeOffset(null), null);

    const entry = Offset(1.0, 2.0);

    expect(ThemeDecoder.decodeOffset(entry), entry);

    final encoded = ThemeEncoder.encodeOffset(entry);
    final decoded = ThemeDecoder.decodeOffset(encoded);

    expect(encoded, {'dx': 1.0, 'dy': 2.0});

    expect(decoded, entry);
  });

  test('OutlinedBorder', () {
    expect(ThemeDecoder.decodeOutlinedBorder(null), null);
    expect(ThemeEncoder.encodeOutlinedBorder(null), null);

    OutlinedBorder entry = BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),
      side: const BorderSide(
        color: _kColor,
        width: 1.0,
        style: BorderStyle.solid,
      ),
    );

    expect(ThemeDecoder.decodeOutlinedBorder(entry), entry);

    var encoded = ThemeEncoder.encodeOutlinedBorder(entry);
    var decoded = ThemeDecoder.decodeOutlinedBorder(encoded);

    expect(encoded, {
      'borderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'bottomRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'topLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'topRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'type': 'only',
      },
      'side': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'type': 'beveled',
    });

    expect(decoded, entry);

    entry = const CircleBorder(
      side: BorderSide(color: _kColor, width: 1.0, style: BorderStyle.solid),
    );

    encoded = ThemeEncoder.encodeOutlinedBorder(entry);
    decoded = ThemeDecoder.decodeOutlinedBorder(encoded);

    expect(encoded, {
      'side': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'type': 'circle',
    });

    expect(decoded, entry);

    entry = ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),
      side: const BorderSide(
        color: _kColor,
        width: 1.0,
        style: BorderStyle.solid,
      ),
    );

    encoded = ThemeEncoder.encodeOutlinedBorder(entry);
    decoded = ThemeDecoder.decodeOutlinedBorder(encoded);

    expect(encoded, {
      'borderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'bottomRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'topLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'topRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'type': 'only',
      },
      'side': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'type': 'rectangle',
    });

    expect(decoded, entry);

    entry = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),
      side: const BorderSide(
        color: _kColor,
        width: 1.0,
        style: BorderStyle.solid,
      ),
    );

    encoded = ThemeEncoder.encodeOutlinedBorder(entry);
    decoded = ThemeDecoder.decodeOutlinedBorder(encoded);

    expect(encoded, {
      'borderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'bottomRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'topLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'topRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'type': 'only',
      },
      'side': {
        'color': '#00123456',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'type': 'rounded',
    });

    expect(decoded, entry);

    entry = const StadiumBorder(
      side: BorderSide(color: _kColor, width: 1.0, style: BorderStyle.solid),
    );

    encoded = ThemeEncoder.encodeOutlinedBorder(entry);
    decoded = ThemeDecoder.decodeOutlinedBorder(encoded);

    expect(encoded, {
      'side': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'type': 'stadium',
    });

    expect(decoded, entry);
  });

  test('OutlinedButtonThemeData', () {
    expect(ThemeDecoder.decodeOutlinedButtonThemeData(null), null);
    expect(ThemeEncoder.encodeOutlinedButtonThemeData(null), null);

    final entry = OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(const Color(0xff222222)),
      ),
    );

    expect(ThemeDecoder.decodeOutlinedButtonThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeOutlinedButtonThemeData(entry);
    final decoded = ThemeDecoder.decodeOutlinedButtonThemeData(encoded);

    expect(encoded, {
      'style': {'backgroundColor': _materializeState('#ff222222')},
    });

    bool? outlinedButtonThemeDatasAreEqual(Object? first, Object second) {
      bool? result;

      if (first.runtimeType != second.runtimeType) {
        result = false;
      } else if (first is! OutlinedButtonThemeData) {
        result = false;
      } else if (second is OutlinedButtonThemeData) {
        result = _buttonStylesAreEqual(first.style, second.style);
      }

      return result;
    }

    expect(outlinedButtonThemeDatasAreEqual(decoded, entry), true);
  });

  test('OverflowBoxFit', () {
    expect(ThemeDecoder.decodeOverflowBoxFit(null), null);
    expect(ThemeEncoder.encodeOverflowBoxFit(null), null);

    expect(
      ThemeDecoder.decodeOverflowBoxFit(OverflowBoxFit.deferToChild),
      OverflowBoxFit.deferToChild,
    );

    expect(
      ThemeDecoder.decodeOverflowBoxFit('deferToChild'),
      OverflowBoxFit.deferToChild,
    );
    expect(ThemeDecoder.decodeOverflowBoxFit('max'), OverflowBoxFit.max);

    expect(
      ThemeEncoder.encodeOverflowBoxFit(OverflowBoxFit.deferToChild),
      'deferToChild',
    );
    expect(ThemeEncoder.encodeOverflowBoxFit(OverflowBoxFit.max), 'max');
  });

  test('PageTransitionsBuilder', () {
    expect(ThemeDecoder.decodePageTransitionsBuilder(null), null);
    expect(ThemeEncoder.encodePageTransitionsBuilder(null), null);

    expect(
      ThemeDecoder.decodePageTransitionsBuilder('cupertino').runtimeType,
      CupertinoPageTransitionsBuilder,
    );
    expect(
      ThemeDecoder.decodePageTransitionsBuilder('fadeUpwards').runtimeType,
      FadeUpwardsPageTransitionsBuilder,
    );
    expect(
      ThemeDecoder.decodePageTransitionsBuilder('openUpwards').runtimeType,
      OpenUpwardsPageTransitionsBuilder,
    );
    expect(
      ThemeDecoder.decodePageTransitionsBuilder('zoom').runtimeType,
      ZoomPageTransitionsBuilder,
    );

    expect(
      ThemeEncoder.encodePageTransitionsBuilder(
        const CupertinoPageTransitionsBuilder(),
      ),
      'cupertino',
    );
    expect(
      ThemeEncoder.encodePageTransitionsBuilder(
        const FadeUpwardsPageTransitionsBuilder(),
      ),
      'fadeUpwards',
    );
    expect(
      ThemeEncoder.encodePageTransitionsBuilder(
        const OpenUpwardsPageTransitionsBuilder(),
      ),
      'openUpwards',
    );
    expect(
      ThemeEncoder.encodePageTransitionsBuilder(
        const ZoomPageTransitionsBuilder(),
      ),
      'zoom',
    );
  });

  test('PageTransitionsTheme', () {
    expect(ThemeDecoder.decodePageTransitionsTheme(null), null);
    expect(ThemeEncoder.encodePageTransitionsTheme(null), null);

    final builders = {
      TargetPlatform.fuchsia: const CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: const FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.macOS: const OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.windows: const ZoomPageTransitionsBuilder(),
    };

    final encoded = ThemeEncoder.encodePageTransitionsTheme(
      PageTransitionsTheme(builders: builders),
    );

    expect(encoded, {
      'builders': {
        'fuchsia': 'cupertino',
        'linux': 'fadeUpwards',
        'macOS': 'openUpwards',
        'windows': 'zoom',
      },
    });

    final decoded = ThemeDecoder.decodePageTransitionsTheme(encoded);
    for (var entry in builders.entries) {
      expect(
        decoded?.builders[entry.key]?.runtimeType,
        entry.value.runtimeType,
      );
    }
  });

  test('PanAxis', () {
    expect(ThemeDecoder.decodePanAxis(null), null);
    expect(ThemeEncoder.encodePanAxis(null), null);

    expect(ThemeDecoder.decodePanAxis(PanAxis.aligned), PanAxis.aligned);
    expect(ThemeDecoder.decodePanAxis('aligned'), PanAxis.aligned);
    expect(ThemeDecoder.decodePanAxis('free'), PanAxis.free);
    expect(ThemeDecoder.decodePanAxis('horizontal'), PanAxis.horizontal);
    expect(ThemeDecoder.decodePanAxis('vertical'), PanAxis.vertical);

    expect(ThemeEncoder.encodePanAxis(PanAxis.aligned), 'aligned');
    expect(ThemeEncoder.encodePanAxis(PanAxis.free), 'free');
    expect(ThemeEncoder.encodePanAxis(PanAxis.horizontal), 'horizontal');
    expect(ThemeEncoder.encodePanAxis(PanAxis.vertical), 'vertical');
  });

  test('PointerDeviceKind', () {
    expect(ThemeDecoder.decodePointerDeviceKind(null), null);
    expect(ThemeEncoder.encodePointerDeviceKind(null), null);

    expect(
      ThemeDecoder.decodePointerDeviceKind(PointerDeviceKind.mouse),
      PointerDeviceKind.mouse,
    );
    expect(
      ThemeDecoder.decodePointerDeviceKind('invertedStylus'),
      PointerDeviceKind.invertedStylus,
    );
    expect(
      ThemeDecoder.decodePointerDeviceKind('mouse'),
      PointerDeviceKind.mouse,
    );
    expect(
      ThemeDecoder.decodePointerDeviceKind('stylus'),
      PointerDeviceKind.stylus,
    );
    expect(
      ThemeDecoder.decodePointerDeviceKind('touch'),
      PointerDeviceKind.touch,
    );
    expect(
      ThemeDecoder.decodePointerDeviceKind('trackpad'),
      PointerDeviceKind.trackpad,
    );
    expect(
      ThemeDecoder.decodePointerDeviceKind('unknown'),
      PointerDeviceKind.unknown,
    );

    expect(
      ThemeEncoder.encodePointerDeviceKind(PointerDeviceKind.invertedStylus),
      'invertedStylus',
    );
    expect(
      ThemeEncoder.encodePointerDeviceKind(PointerDeviceKind.mouse),
      'mouse',
    );
    expect(
      ThemeEncoder.encodePointerDeviceKind(PointerDeviceKind.stylus),
      'stylus',
    );
    expect(
      ThemeEncoder.encodePointerDeviceKind(PointerDeviceKind.touch),
      'touch',
    );
    expect(
      ThemeEncoder.encodePointerDeviceKind(PointerDeviceKind.trackpad),
      'trackpad',
    );
    expect(
      ThemeEncoder.encodePointerDeviceKind(PointerDeviceKind.unknown),
      'unknown',
    );
  });

  test('PopupMenuPosition', () {
    expect(ThemeDecoder.decodePopupMenuPosition(null), null);
    expect(ThemeEncoder.encodePopupMenuPosition(null), null);

    expect(
      ThemeDecoder.decodePopupMenuPosition(PopupMenuPosition.over),
      PopupMenuPosition.over,
    );
    expect(
      ThemeDecoder.decodePopupMenuPosition('over'),
      PopupMenuPosition.over,
    );
    expect(
      ThemeDecoder.decodePopupMenuPosition('under'),
      PopupMenuPosition.under,
    );

    expect(
      ThemeEncoder.encodePopupMenuPosition(PopupMenuPosition.over),
      'over',
    );
    expect(
      ThemeEncoder.encodePopupMenuPosition(PopupMenuPosition.under),
      'under',
    );
  });

  test('PopupMenuThemeData', () {
    expect(ThemeDecoder.decodePopupMenuThemeData(null), null);
    expect(ThemeEncoder.encodePopupMenuThemeData(null), null);

    const entry = PopupMenuThemeData(
      color: _kColor,
      elevation: 1.0,
      enableFeedback: true,
      iconColor: _kColor,
      iconSize: 16.0,
      menuPadding: EdgeInsets.only(top: 20.0),
      position: PopupMenuPosition.over,
      shadowColor: Color(0xff111111),
      shape: RoundedRectangleBorder(),
      surfaceTintColor: Color(0xff222222),
      textStyle: _kTextStyle,
    );

    expect(ThemeDecoder.decodePopupMenuThemeData(entry), entry);

    final encoded = ThemeEncoder.encodePopupMenuThemeData(entry);
    final decoded = ThemeDecoder.decodePopupMenuThemeData(encoded);

    expect(encoded, {
      'color': '#00123456',
      'elevation': 1.0,
      'enableFeedback': true,
      'iconColor': _kColorStr,
      'iconSize': 16.0,
      'menuPadding': {'bottom': 0.0, 'left': 0.0, 'right': 0.0, 'top': 20.0},
      'position': 'over',
      'shadowColor': '#ff111111',
      'shape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'bottomRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'topLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'topRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded',
      },
      'surfaceTintColor': '#ff222222',
      'textStyle': {'color': '#00123456', 'inherit': true},
    });

    expect(decoded, entry);
  });

  test('ProgressIndicatorThemeData', () {
    expect(ThemeDecoder.decodeProgressIndicatorThemeData(null), null);
    expect(ThemeEncoder.encodeProgressIndicatorThemeData(null), null);

    const entry = ProgressIndicatorThemeData(
      circularTrackColor: _kColor,
      color: _kColor,
      linearMinHeight: 16.0,
      linearTrackColor: _kColor,
      refreshBackgroundColor: _kColor,
      strokeCap: StrokeCap.butt,
    );

    expect(ThemeDecoder.decodeProgressIndicatorThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeProgressIndicatorThemeData(entry);
    final decoded = ThemeDecoder.decodeProgressIndicatorThemeData(encoded);

    expect(encoded, {
      'circularTrackColor': _kColorStr,
      'color': _kColorStr,
      'linearMinHeight': 16.0,
      'linearTrackColor': _kColorStr,
      'refreshBackgroundColor': _kColorStr,
      'strokeCap': 'butt',
    });

    expect(decoded, entry);
  });

  test('RadioThemeData', () {
    expect(ThemeDecoder.decodeRadioThemeData(null), null);
    expect(ThemeEncoder.encodeRadioThemeData(null), null);

    final entry = RadioThemeData(
      fillColor: WidgetStateProperty.all(_kColor),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      mouseCursor: WidgetStateProperty.all(MouseCursor.uncontrolled),
      overlayColor: WidgetStateProperty.all(_kColor),
      splashRadius: 2.0,
      visualDensity: VisualDensity.comfortable,
    );

    expect(ThemeDecoder.decodeRadioThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeRadioThemeData(entry);
    final decoded = ThemeDecoder.decodeRadioThemeData(encoded);

    expect(
      decoded!.fillColor!.resolve({WidgetState.error}),
      entry.fillColor!.resolve({WidgetState.error}),
    );
    expect(decoded.materialTapTargetSize, entry.materialTapTargetSize);
    expect(
      decoded.mouseCursor!.resolve({WidgetState.error}),
      entry.mouseCursor!.resolve({WidgetState.error}),
    );
    expect(
      decoded.overlayColor!.resolve({WidgetState.error}),
      entry.overlayColor!.resolve({WidgetState.error}),
    );
    expect(decoded.splashRadius, entry.splashRadius);
    expect(decoded.visualDensity, entry.visualDensity);
  });
  test('Radius', () {
    expect(ThemeDecoder.decodeRadius(null), null);
    expect(ThemeEncoder.encodeRadius(null), null);

    const entry = Radius.circular(1.0);

    expect(ThemeDecoder.decodeRadius(entry), entry);

    final encoded = ThemeEncoder.encodeRadius(entry);
    final decoded = ThemeDecoder.decodeRadius(encoded);

    expect(encoded, {'type': 'elliptical', 'x': 1.0, 'y': 1.0});

    expect(decoded, entry);

    expect(
      ThemeDecoder.decodeRadius({'radius': 4.0, 'type': 'circular'}),
      const Radius.circular(4.0),
    );
    expect(
      ThemeDecoder.decodeRadius({'type': 'elliptical', 'x': 1.0, 'y': 2.0}),
      const Radius.elliptical(1.0, 2.0),
    );
    expect(ThemeDecoder.decodeRadius({'type': 'zero'}), Radius.zero);

    expect(ThemeDecoder.decodeRadius(16), const Radius.circular(16));
  });

  test('RangeSliderThumbShape', () {
    expect(ThemeDecoder.decodeRangeSliderThumbShape(null), null);
    expect(ThemeEncoder.encodeRangeSliderThumbShape(null), null);

    const entry = RoundRangeSliderThumbShape(
      disabledThumbRadius: 1.0,
      elevation: 3.0,
      enabledThumbRadius: 2.0,
      pressedElevation: 4.0,
    );

    expect(ThemeDecoder.decodeRangeSliderThumbShape(entry), entry);

    final encoded = ThemeEncoder.encodeRangeSliderThumbShape(entry);
    final decoded =
        ThemeDecoder.decodeRangeSliderThumbShape(encoded)
            as RoundRangeSliderThumbShape;

    expect(encoded, {
      'disabledThumbRadius': 1.0,
      'elevation': 3.0,
      'enabledThumbRadius': 2.0,
      'pressedElevation': 4.0,
      'type': 'round',
    });

    expect(decoded.disabledThumbRadius, entry.disabledThumbRadius);

    expect(decoded.enabledThumbRadius, entry.enabledThumbRadius);
  });

  test('RangeSliderTickMarkShape', () {
    expect(ThemeDecoder.decodeRangeSliderTickMarkShape(null), null);
    expect(ThemeEncoder.encodeRangeSliderTickMarkShape(null), null);

    const entry = RoundRangeSliderTickMarkShape(tickMarkRadius: 1.0);

    expect(ThemeDecoder.decodeRangeSliderTickMarkShape(entry), entry);

    final encoded = ThemeEncoder.encodeRangeSliderTickMarkShape(entry);
    final decoded =
        ThemeDecoder.decodeRangeSliderTickMarkShape(encoded)
            as RoundRangeSliderTickMarkShape;

    expect(encoded, {'tickMarkRadius': 1.0, 'type': 'round'});

    expect(decoded.tickMarkRadius, entry.tickMarkRadius);
  });

  test('RangeSliderTrackShape', () {
    expect(ThemeDecoder.decodeRangeSliderTrackShape(null), null);
    expect(ThemeEncoder.encodeRangeSliderTrackShape(null), null);

    const entry = RectangularRangeSliderTrackShape();

    expect(ThemeDecoder.decodeRangeSliderTrackShape(entry), entry);

    final encoded = ThemeEncoder.encodeRangeSliderTrackShape(entry);
    final decoded = ThemeDecoder.decodeRangeSliderTrackShape(encoded);

    expect(encoded, 'rectangular');
    expect(
      ThemeEncoder.encodeRangeSliderTrackShape(
        const RoundedRectRangeSliderTrackShape(),
      ),
      'rounded',
    );
    expect(
      ThemeDecoder.decodeRangeSliderTrackShape('rounded').runtimeType,
      const RoundedRectRangeSliderTrackShape().runtimeType,
    );

    expect(decoded?.runtimeType, entry.runtimeType);
  });

  test('RangeSliderValueIndicatorShape', () {
    expect(ThemeDecoder.decodeRangeSliderValueIndicatorShape(null), null);
    expect(ThemeEncoder.encodeRangeSliderValueIndicatorShape(null), null);

    const entry = PaddleRangeSliderValueIndicatorShape();

    expect(ThemeDecoder.decodeRangeSliderValueIndicatorShape(entry), entry);

    final encoded = ThemeEncoder.encodeRangeSliderValueIndicatorShape(entry);
    final decoded = ThemeDecoder.decodeRangeSliderValueIndicatorShape(encoded);

    expect(encoded, 'paddle');

    expect(decoded.runtimeType, entry.runtimeType);

    const entry2 = RectangularRangeSliderValueIndicatorShape();

    final encoded2 = ThemeEncoder.encodeRangeSliderValueIndicatorShape(entry2);
    final decoded2 = ThemeDecoder.decodeRangeSliderValueIndicatorShape(
      encoded2,
    );

    expect(encoded2, 'rectangular');

    expect(decoded2.runtimeType, entry2.runtimeType);
  });

  test('Rect', () {
    expect(ThemeDecoder.decodeRect(null), null);
    expect(ThemeEncoder.encodeRect(null), null);

    const entry = Rect.fromLTRB(1.0, 2.0, 3.0, 4.0);

    expect(ThemeDecoder.decodeRect(entry), entry);

    final encoded = ThemeEncoder.encodeRect(entry);
    final decoded = ThemeDecoder.decodeRect(encoded);

    expect(encoded, {
      'bottom': 4.0,
      'left': 1.0,
      'right': 3.0,
      'top': 2.0,
      'type': 'ltrb',
    });

    expect(decoded, entry);

    expect(
      ThemeDecoder.decodeRect({
        'center': {'dx': 1.0, 'dy': 2.0},
        'height': 3.0,
        'width': 4.0,
        'type': 'center',
      }),
      Rect.fromCenter(center: const Offset(1.0, 2.0), height: 3.0, width: 4.0),
    );

    expect(
      ThemeDecoder.decodeRect({
        'center': {'dx': 1.0, 'dy': 2.0},
        'radius': 3.0,
        'type': 'circle',
      }),
      Rect.fromCircle(center: const Offset(1.0, 2.0), radius: 3.0),
    );
    expect(ThemeDecoder.decodeRect({'type': 'largest'}), Rect.largest);
    expect(
      ThemeDecoder.decodeRect({
        'bottom': 4.0,
        'left': 1.0,
        'right': 3.0,
        'top': 2.0,
        'type': 'ltrb',
      }),
      const Rect.fromLTRB(1.0, 2.0, 3.0, 4.0),
    );
    expect(
      ThemeDecoder.decodeRect({
        'height': 4.0,
        'left': 1.0,
        'top': 2.0,
        'type': 'ltwh',
        'width': 3.0,
      }),
      const Rect.fromLTWH(1.0, 2.0, 3.0, 4.0),
    );
    expect(
      ThemeDecoder.decodeRect({
        'a': {'dx': 1.0, 'dy': 2.0},
        'b': {'dx': 3.0, 'dy': 4.0},
        'type': 'points',
      }),
      Rect.fromPoints(const Offset(1.0, 2.0), const Offset(3.0, 4.0)),
    );
    expect(ThemeDecoder.decodeRect({'type': 'zero'}), Rect.zero);
  });

  test('ScrollBehavior', () {
    expect(ThemeDecoder.decodeScrollBehavior(null), null);
    expect(ThemeEncoder.encodeScrollBehavior(null), null);

    const entry = ScrollBehavior();

    expect(ThemeDecoder.decodeScrollBehavior(entry), entry);

    ThemeEncoder.encodeScrollBehavior(entry);
  });

  test('ScrollPhysics', () {
    expect(ThemeDecoder.decodeScrollPhysics(null), null);
    expect(ThemeEncoder.encodeScrollPhysics(null), null);

    const entry = AlwaysScrollableScrollPhysics();
    expect(ThemeDecoder.decodeScrollPhysics(entry), entry);
    expect(
      ThemeDecoder.decodeScrollPhysics({'type': 'always'}).runtimeType,
      const AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({'type': 'bouncing'}).runtimeType,
      const BouncingScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({'type': 'clamping'}).runtimeType,
      const ClampingScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({'type': 'fixedExtent'}).runtimeType,
      const FixedExtentScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({'type': 'never'}).runtimeType,
      const NeverScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({'type': 'page'}).runtimeType,
      const PageScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({
        'type': 'rangeMaintaining',
      }).runtimeType,
      const RangeMaintainingScrollPhysics().runtimeType,
    );

    expect(
      ThemeDecoder.decodeScrollPhysics({
        'parent': {'type': 'always'},
        'type': 'always',
      })!.parent.runtimeType,
      const AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({
        'parent': {'type': 'always'},
        'type': 'bouncing',
      })!.parent.runtimeType,
      const AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({
        'parent': {'type': 'always'},
        'type': 'clamping',
      })!.parent.runtimeType,
      const AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({
        'parent': {'type': 'always'},
        'type': 'fixedExtent',
      })!.parent.runtimeType,
      const AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({
        'parent': {'type': 'always'},
        'type': 'never',
      })!.parent.runtimeType,
      const AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({
        'parent': {'type': 'always'},
        'type': 'page',
      })!.parent.runtimeType,
      const AlwaysScrollableScrollPhysics().runtimeType,
    );
    expect(
      ThemeDecoder.decodeScrollPhysics({
        'parent': {'type': 'always'},
        'type': 'rangeMaintaining',
      })!.parent.runtimeType,
      const AlwaysScrollableScrollPhysics().runtimeType,
    );

    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(const AlwaysScrollableScrollPhysics()),
      ),
      {'type': 'always'},
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(const BouncingScrollPhysics()),
      ),
      {'type': 'bouncing'},
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(const ClampingScrollPhysics()),
      ),
      {'type': 'clamping'},
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(const FixedExtentScrollPhysics()),
      ),
      {'type': 'fixedExtent'},
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(const NeverScrollableScrollPhysics()),
      ),
      {'type': 'never'},
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(const PageScrollPhysics()),
      ),
      {'type': 'page'},
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(const RangeMaintainingScrollPhysics()),
      ),
      {'type': 'rangeMaintaining'},
    );

    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(
          const AlwaysScrollableScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
        ),
      ),
      {
        'parent': {'type': 'always'},
        'type': 'always',
      },
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        ),
      ),
      {
        'parent': {'type': 'always'},
        'type': 'bouncing',
      },
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(
          const ClampingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        ),
      ),
      {
        'parent': {'type': 'always'},
        'type': 'clamping',
      },
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(
          const FixedExtentScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
        ),
      ),
      {
        'parent': {'type': 'always'},
        'type': 'fixedExtent',
      },
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(
          const NeverScrollableScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
        ),
      ),
      {
        'parent': {'type': 'always'},
        'type': 'never',
      },
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(
          const PageScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        ),
      ),
      {
        'parent': {'type': 'always'},
        'type': 'page',
      },
    );
    expect(
      JsonClass.removeNull(
        ThemeEncoder.encodeScrollPhysics(
          const RangeMaintainingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
        ),
      ),
      {
        'parent': {'type': 'always'},
        'type': 'rangeMaintaining',
      },
    );
  });

  test('ScrollViewKeyboardDismissBehavior', () {
    expect(ThemeDecoder.decodeScrollViewKeyboardDismissBehavior(null), null);
    expect(ThemeEncoder.encodeScrollViewKeyboardDismissBehavior(null), null);

    expect(
      ThemeDecoder.decodeScrollViewKeyboardDismissBehavior(
        ScrollViewKeyboardDismissBehavior.manual,
      ),
      ScrollViewKeyboardDismissBehavior.manual,
    );

    expect(
      ThemeDecoder.decodeScrollViewKeyboardDismissBehavior('manual'),
      ScrollViewKeyboardDismissBehavior.manual,
    );
    expect(
      ThemeDecoder.decodeScrollViewKeyboardDismissBehavior('onDrag'),
      ScrollViewKeyboardDismissBehavior.onDrag,
    );

    expect(
      ThemeEncoder.encodeScrollViewKeyboardDismissBehavior(
        ScrollViewKeyboardDismissBehavior.manual,
      ),
      'manual',
    );
    expect(
      ThemeEncoder.encodeScrollViewKeyboardDismissBehavior(
        ScrollViewKeyboardDismissBehavior.onDrag,
      ),
      'onDrag',
    );
  });

  test('ScrollbarOrientation', () {
    expect(ThemeDecoder.decodeScrollbarOrientation(null), null);
    expect(ThemeEncoder.encodeScrollbarOrientation(null), null);

    expect(
      ThemeDecoder.decodeScrollbarOrientation(ScrollbarOrientation.top),
      ScrollbarOrientation.top,
    );

    expect(
      ThemeDecoder.decodeScrollbarOrientation('bottom'),
      ScrollbarOrientation.bottom,
    );
    expect(
      ThemeDecoder.decodeScrollbarOrientation('left'),
      ScrollbarOrientation.left,
    );
    expect(
      ThemeDecoder.decodeScrollbarOrientation('right'),
      ScrollbarOrientation.right,
    );
    expect(
      ThemeDecoder.decodeScrollbarOrientation('top'),
      ScrollbarOrientation.top,
    );

    expect(
      ThemeEncoder.encodeScrollbarOrientation(ScrollbarOrientation.bottom),
      'bottom',
    );
    expect(
      ThemeEncoder.encodeScrollbarOrientation(ScrollbarOrientation.left),
      'left',
    );
    expect(
      ThemeEncoder.encodeScrollbarOrientation(ScrollbarOrientation.right),
      'right',
    );
    expect(
      ThemeEncoder.encodeScrollbarOrientation(ScrollbarOrientation.top),
      'top',
    );
  });

  test('ScrollbarThemeData', () {
    expect(ThemeDecoder.decodeScrollbarThemeData(null), null);
    expect(ThemeEncoder.encodeScrollbarThemeData(null), null);

    final entry = ScrollbarThemeData(
      crossAxisMargin: 1.0,
      interactive: true,
      mainAxisMargin: 2.0,
      minThumbLength: 3.0,
      radius: const Radius.circular(4.0),
      thickness: WidgetStateProperty.all(5.0),
      thumbVisibility: WidgetStateProperty.all(true),
    );

    expect(ThemeDecoder.decodeScrollbarThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeScrollbarThemeData(entry);
    expect(encoded!['crossAxisMargin'], entry.crossAxisMargin);

    expect(encoded['interactive'], entry.interactive);

    expect(encoded['mainAxisMargin'], entry.mainAxisMargin);

    expect(encoded['minThumbLength'], entry.minThumbLength);

    expect(encoded['radius'], ThemeEncoder.encodeRadius(entry.radius));

    expect(
      encoded['thickness']['error'],
      entry.thickness!.resolve({WidgetState.error}),
    );

    expect(
      encoded['thumbVisibility']['error'],
      entry.thumbVisibility!.resolve({WidgetState.error}),
    );

    final decoded = ThemeDecoder.decodeScrollbarThemeData(encoded);
    expect(decoded!.crossAxisMargin, entry.crossAxisMargin);

    expect(decoded.interactive, entry.interactive);

    expect(decoded.mainAxisMargin, entry.mainAxisMargin);

    expect(decoded.minThumbLength, entry.minThumbLength);

    expect(decoded.radius, entry.radius);

    expect(
      decoded.thickness!.resolve({WidgetState.error}),
      entry.thickness!.resolve({WidgetState.error}),
    );

    expect(
      decoded.thumbVisibility!.resolve({WidgetState.error}),
      entry.thumbVisibility!.resolve({WidgetState.error}),
    );
  });

  test('SearchBarThemeData', () {
    expect(ThemeDecoder.decodeSearchBarThemeData(null), null);
    expect(ThemeEncoder.encodeSearchBarThemeData(null), null);

    final entry = SearchBarThemeData(
      backgroundColor: WidgetStateProperty.all(_kColor),
      constraints: const BoxConstraints(maxWidth: 200.0, minWidth: 100.0),
      elevation: WidgetStateProperty.all(4.0),
      hintStyle: WidgetStateProperty.all(_kTextStyle),
      overlayColor: WidgetStateProperty.all(_kColor),
      padding: WidgetStateProperty.all(const EdgeInsets.all(16.0)),
      shadowColor: WidgetStateProperty.all(_kColor),
      textCapitalization: TextCapitalization.sentences,
      textStyle: WidgetStateProperty.all(_kTextStyle),
    );

    expect(ThemeDecoder.decodeSearchBarThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeSearchBarThemeData(entry);

    expect(encoded, {
      'backgroundColor': {
        'disabled': '#00123456',
        'dragged': '#00123456',
        'empty': '#00123456',
        'error': '#00123456',
        'focused': '#00123456',
        'hovered': '#00123456',
        'pressed': '#00123456',
        'scrolledUnder': '#00123456',
        'selected': '#00123456',
      },
      'constraints': {'maxWidth': 200.0, 'minHeight': 0.0, 'minWidth': 100.0},
      'elevation': {
        'disabled': 4.0,
        'dragged': 4.0,
        'empty': 4.0,
        'error': 4.0,
        'focused': 4.0,
        'hovered': 4.0,
        'pressed': 4.0,
        'scrolledUnder': 4.0,
        'selected': 4.0,
      },
      'hintStyle': {
        'disabled': {'color': '#00123456', 'inherit': true},
        'dragged': {'color': '#00123456', 'inherit': true},
        'empty': {'color': '#00123456', 'inherit': true},
        'error': {'color': '#00123456', 'inherit': true},
        'focused': {'color': '#00123456', 'inherit': true},
        'hovered': {'color': '#00123456', 'inherit': true},
        'pressed': {'color': '#00123456', 'inherit': true},
        'scrolledUnder': {'color': '#00123456', 'inherit': true},
        'selected': {'color': '#00123456', 'inherit': true},
      },
      'overlayColor': {
        'disabled': '#00123456',
        'dragged': '#00123456',
        'empty': '#00123456',
        'error': '#00123456',
        'focused': '#00123456',
        'hovered': '#00123456',
        'pressed': '#00123456',
        'scrolledUnder': '#00123456',
        'selected': '#00123456',
      },
      'padding': {
        'disabled': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0},
        'dragged': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0},
        'empty': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0},
        'error': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0},
        'focused': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0},
        'hovered': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0},
        'pressed': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0},
        'scrolledUnder': {
          'bottom': 16.0,
          'left': 16.0,
          'right': 16.0,
          'top': 16.0,
        },
        'selected': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0},
      },
      'shadowColor': {
        'disabled': '#00123456',
        'dragged': '#00123456',
        'empty': '#00123456',
        'error': '#00123456',
        'focused': '#00123456',
        'hovered': '#00123456',
        'pressed': '#00123456',
        'scrolledUnder': '#00123456',
        'selected': '#00123456',
      },
      'textCapitalization': 'sentences',
      'textStyle': {
        'disabled': {'color': '#00123456', 'inherit': true},
        'dragged': {'color': '#00123456', 'inherit': true},
        'empty': {'color': '#00123456', 'inherit': true},
        'error': {'color': '#00123456', 'inherit': true},
        'focused': {'color': '#00123456', 'inherit': true},
        'hovered': {'color': '#00123456', 'inherit': true},
        'pressed': {'color': '#00123456', 'inherit': true},
        'scrolledUnder': {'color': '#00123456', 'inherit': true},
        'selected': {'color': '#00123456', 'inherit': true},
      },
    });
  });

  test('SearchViewThemeData', () {
    expect(ThemeDecoder.decodeSearchViewThemeData(null), null);
    expect(ThemeEncoder.encodeSearchViewThemeData(null), null);

    const entry = SearchViewThemeData(
      backgroundColor: _kColor,
      barPadding: EdgeInsets.all(6.0),
      constraints: BoxConstraints(maxWidth: 200.0, minWidth: 100.0),
      dividerColor: _kColor,
      elevation: 4.0,
      headerHeight: 11.0,
      headerHintStyle: _kTextStyle,
      headerTextStyle: _kTextStyle,
      padding: EdgeInsets.all(8.0),
      shrinkWrap: true,
      surfaceTintColor: _kColor,
    );

    expect(ThemeDecoder.decodeSearchViewThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeSearchViewThemeData(entry);
    final decoded = ThemeDecoder.decodeSearchViewThemeData(encoded);

    expect(encoded, {
      'backgroundColor': '#00123456',
      'barPadding': {'bottom': 6.0, 'left': 6.0, 'right': 6.0, 'top': 6.0},
      'constraints': {'maxWidth': 200.0, 'minHeight': 0.0, 'minWidth': 100.0},
      'dividerColor': '#00123456',
      'elevation': 4.0,
      'headerHeight': 11.0,
      'headerHintStyle': {'color': '#00123456', 'inherit': true},
      'headerTextStyle': {'color': '#00123456', 'inherit': true},
      'padding': {'bottom': 8.0, 'left': 8.0, 'right': 8.0, 'top': 8.0},
      'shrinkWrap': true,
      'surfaceTintColor': '#00123456',
    });

    expect(decoded, entry);
  });

  test('SegmentedButton', () {
    expect(ThemeDecoder.decodeSegmentedButtonThemeData(null), null);
    expect(ThemeEncoder.encodeSegmentedButtonThemeData(null), null);

    const entry = SegmentedButtonThemeData(
      selectedIcon: Icon(Icons.abc),
      style: ButtonStyle(enableFeedback: false),
    );

    final encoded = ThemeEncoder.encodeSegmentedButtonThemeData(entry);
    final decoded = ThemeDecoder.decodeSegmentedButtonThemeData(encoded);

    expect(encoded, {
      'selectedIcon': {
        'icon': {
          'codePoint': 984246,
          'fontFamily': 'MaterialIcons',
          'matchTextDirection': false,
        },
      },
      'style': {'enableFeedback': false},
    });

    expect(entry.selectedIcon.toString(), decoded?.selectedIcon.toString());
    expect(entry.style, decoded?.style);
  });

  test('SemanticsTag', () {
    expect(ThemeDecoder.decodeSemanticsTag(null), null);
    expect(ThemeEncoder.encodeSemanticsTag(null), null);

    const entry = SemanticsTag('foo');

    expect(ThemeDecoder.decodeSemanticsTag(entry), entry);

    final encoded = ThemeEncoder.encodeSemanticsTag(entry);
    final decoded = ThemeDecoder.decodeSemanticsTag(encoded);

    expect(encoded, {'name': 'foo'});

    expect(decoded!.name, entry.name);
  });

  test('Shadow', () {
    expect(ThemeDecoder.decodeShadow(null), null);
    expect(ThemeEncoder.encodeShadow(null), null);

    const entry = Shadow(
      color: _kColor,
      blurRadius: 1.0,
      offset: Offset(2.0, 3.0),
    );

    expect(ThemeDecoder.decodeShadow(entry), entry);

    final encoded = ThemeEncoder.encodeShadow(entry);
    final decoded = ThemeDecoder.decodeShadow(encoded);

    expect(encoded, {
      'blurRadius': 1.0,
      'color': _kColorStr,
      'offset': {'dx': 2.0, 'dy': 3.0},
    });

    expect(decoded, entry);
  });

  test('ShapeBorder', () {
    expect(ThemeDecoder.decodeShapeBorder(null), null);
    expect(ThemeEncoder.encodeShapeBorder(null), null);

    ShapeBorder entry = const CircleBorder(
      side: BorderSide(color: _kColor, width: 1.0, style: BorderStyle.solid),
    );

    expect(ThemeDecoder.decodeShapeBorder(entry), entry);

    var encoded = ThemeEncoder.encodeShapeBorder(entry);
    var decoded = ThemeDecoder.decodeShapeBorder(encoded);

    expect(encoded, {
      'side': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'type': 'circle',
    });

    expect(decoded, entry);

    entry = ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),
      side: const BorderSide(
        color: _kColor,
        width: 1.0,
        style: BorderStyle.solid,
      ),
    );

    encoded = ThemeEncoder.encodeShapeBorder(entry);
    decoded = ThemeDecoder.decodeShapeBorder(encoded);

    expect(encoded, {
      'borderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'bottomRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'topLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'topRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'type': 'only',
      },
      'side': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'type': 'rectangle',
    });

    expect(decoded, entry);

    entry = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),
      side: const BorderSide(
        color: _kColor,
        width: 1.0,
        style: BorderStyle.solid,
      ),
    );

    encoded = ThemeEncoder.encodeShapeBorder(entry);
    decoded = ThemeDecoder.decodeShapeBorder(encoded);

    expect(encoded, {
      'borderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'bottomRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'topLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'topRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
        'type': 'only',
      },
      'side': {
        'color': '#00123456',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'type': 'rounded',
    });

    expect(decoded, entry);

    entry = const StadiumBorder(
      side: BorderSide(color: _kColor, width: 1.0, style: BorderStyle.solid),
    );

    encoded = ThemeEncoder.encodeShapeBorder(entry);
    decoded = ThemeDecoder.decodeShapeBorder(encoded);

    expect(encoded, {
      'side': {
        'color': '#00123456',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'type': 'stadium',
    });

    expect(decoded, entry);
  });

  test('ShowValueIndicator', () {
    expect(ThemeDecoder.decodeShowValueIndicator(null), null);
    expect(ThemeEncoder.encodeShowValueIndicator(null), null);

    expect(
      ThemeDecoder.decodeShowValueIndicator(ShowValueIndicator.always),
      ShowValueIndicator.always,
    );

    expect(
      ThemeDecoder.decodeShowValueIndicator('always'),
      ShowValueIndicator.always,
    );
    expect(
      ThemeDecoder.decodeShowValueIndicator('never'),
      ShowValueIndicator.never,
    );
    expect(
      ThemeDecoder.decodeShowValueIndicator('onlyForContinuous'),
      ShowValueIndicator.onlyForContinuous,
    );
    expect(
      ThemeDecoder.decodeShowValueIndicator('onlyForDiscrete'),
      ShowValueIndicator.onlyForDiscrete,
    );

    expect(
      ThemeEncoder.encodeShowValueIndicator(ShowValueIndicator.always),
      'always',
    );
    expect(
      ThemeEncoder.encodeShowValueIndicator(ShowValueIndicator.never),
      'never',
    );
    expect(
      ThemeEncoder.encodeShowValueIndicator(
        ShowValueIndicator.onlyForContinuous,
      ),
      'onlyForContinuous',
    );
    expect(
      ThemeEncoder.encodeShowValueIndicator(ShowValueIndicator.onlyForDiscrete),
      'onlyForDiscrete',
    );
  });

  test('Size', () {
    expect(ThemeDecoder.decodeSize(null), null);
    expect(ThemeEncoder.encodeSize(null), null);

    const entry = Size(0.0, 0.0);

    expect(ThemeDecoder.decodeSize(entry), entry);

    final encoded = ThemeEncoder.encodeSize(entry);
    final decoded = ThemeDecoder.decodeSize(encoded);

    expect(encoded, {'height': 0.0, 'width': 0.0});

    expect(decoded, entry);
  });

  test('SliderComponentShape', () {
    expect(ThemeDecoder.decodeSliderComponentShape(null), null);
    expect(ThemeEncoder.encodeSliderComponentShape(null), null);

    expect(
      ThemeDecoder.decodeSliderComponentShape(SliderComponentShape.noOverlay),
      SliderComponentShape.noOverlay,
    );

    expect(
      ThemeDecoder.decodeSliderComponentShape('noOverlay'),
      SliderComponentShape.noOverlay,
    );
    expect(
      ThemeDecoder.decodeSliderComponentShape('noThumb'),
      SliderComponentShape.noThumb,
    );

    expect(
      ThemeEncoder.encodeSliderComponentShape(SliderComponentShape.noOverlay),
      'noOverlay',
    );
    expect(
      ThemeEncoder.encodeSliderComponentShape(SliderComponentShape.noThumb),
      'noOverlay',
    );
  });

  test('SliderInteraction', () {
    expect(ThemeDecoder.decodeSliderInteraction(null), null);
    expect(ThemeEncoder.encodeSliderInteraction(null), null);

    expect(
      ThemeDecoder.decodeSliderInteraction(SliderInteraction.slideOnly),
      SliderInteraction.slideOnly,
    );

    expect(
      ThemeDecoder.decodeSliderInteraction('slideOnly'),
      SliderInteraction.slideOnly,
    );
    expect(
      ThemeDecoder.decodeSliderInteraction('slideThumb'),
      SliderInteraction.slideThumb,
    );
    expect(
      ThemeDecoder.decodeSliderInteraction('tapAndSlide'),
      SliderInteraction.tapAndSlide,
    );
    expect(
      ThemeDecoder.decodeSliderInteraction('tapOnly'),
      SliderInteraction.tapOnly,
    );

    expect(
      ThemeEncoder.encodeSliderInteraction(SliderInteraction.slideOnly),
      'slideOnly',
    );
    expect(
      ThemeEncoder.encodeSliderInteraction(SliderInteraction.slideThumb),
      'slideThumb',
    );
    expect(
      ThemeEncoder.encodeSliderInteraction(SliderInteraction.tapAndSlide),
      'tapAndSlide',
    );
    expect(
      ThemeEncoder.encodeSliderInteraction(SliderInteraction.tapOnly),
      'tapOnly',
    );
  });

  test('SliderThemeData', () {
    expect(ThemeDecoder.decodeSliderThemeData(null), null);
    expect(ThemeEncoder.encodeSliderThemeData(null), null);

    final entry = SliderThemeData(
      activeTickMarkColor: const Color(0xff111111),
      activeTrackColor: const Color(0xff222222),
      disabledActiveTickMarkColor: const Color(0xff333333),
      disabledActiveTrackColor: const Color(0xff444444),
      disabledInactiveTickMarkColor: const Color(0xff555555),
      disabledInactiveTrackColor: const Color(0xff666666),
      disabledSecondaryActiveTrackColor: const Color(0xff676767),
      disabledThumbColor: const Color(0xff777777),
      inactiveTickMarkColor: const Color(0xff888888),
      inactiveTrackColor: const Color(0xff999999),
      minThumbSeparation: 5.0,
      overlappingShapeStrokeColor: const Color(0xff000000),
      overlayColor: const Color(0xffaaaaaa),
      overlayShape: SliderComponentShape.noOverlay,
      padding: EdgeInsets.all(5.0),
      rangeThumbShape: const RoundRangeSliderThumbShape(),
      rangeTrackShape: const RectangularRangeSliderTrackShape(),
      rangeValueIndicatorShape: const PaddleRangeSliderValueIndicatorShape(),
      secondaryActiveTrackColor: const Color(0xffababab),
      showValueIndicator: ShowValueIndicator.always,
      thumbColor: const Color(0xffbbbbbb),
      thumbShape: SliderComponentShape.noOverlay,
      trackGap: 11.0,
      trackHeight: 10.0,
      trackShape: const RectangularSliderTrackShape(),
      valueIndicatorColor: const Color(0xffcccccc),
      valueIndicatorShape: SliderComponentShape.noOverlay,
      valueIndicatorStrokeColor: const Color(0xffcccccc),
      valueIndicatorTextStyle: _kTextStyle,
    );

    expect(ThemeDecoder.decodeSliderThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeSliderThemeData(entry);
    final decoded = ThemeDecoder.decodeSliderThemeData(encoded);

    expect(encoded, {
      'activeTickMarkColor': '#ff111111',
      'activeTrackColor': '#ff222222',
      'disabledActiveTickMarkColor': '#ff333333',
      'disabledActiveTrackColor': '#ff444444',
      'disabledInactiveTickMarkColor': '#ff555555',
      'disabledInactiveTrackColor': '#ff666666',
      'disabledSecondaryActiveTrackColor': '#ff676767',
      'disabledThumbColor': '#ff777777',
      'inactiveTickMarkColor': '#ff888888',
      'inactiveTrackColor': '#ff999999',
      'minThumbSeparation': 5.0,
      'overlappingShapeStrokeColor': '#ff000000',
      'overlayColor': '#ffaaaaaa',
      'overlayShape': 'noOverlay',
      'padding': {'bottom': 5.0, 'left': 5.0, 'right': 5.0, 'top': 5.0},
      'rangeThumbShape': {
        'elevation': 1.0,
        'enabledThumbRadius': 10.0,
        'pressedElevation': 6.0,
        'type': 'round',
      },
      'rangeTrackShape': 'rectangular',
      'rangeValueIndicatorShape': 'paddle',
      'secondaryActiveTrackColor': '#ffababab',
      'showValueIndicator': 'always',
      'thumbColor': '#ffbbbbbb',
      'thumbShape': 'noOverlay',
      'trackGap': 11.0,
      'trackHeight': 10.0,
      'trackShape': {'type': 'rectangular'},
      'valueIndicatorColor': '#ffcccccc',
      'valueIndicatorShape': 'noOverlay',
      'valueIndicatorStrokeColor': '#ffcccccc',
      'valueIndicatorTextStyle': {'color': '#00123456', 'inherit': true},
    });

    expect(ThemeEncoder.encodeSliderThemeData(decoded), encoded);
  });

  test('SliderTickMarkShape', () {
    expect(ThemeDecoder.decodeSliderTickMarkShape(null), null);
    expect(ThemeEncoder.encodeSliderTickMarkShape(null), null);

    expect(
      ThemeDecoder.decodeSliderTickMarkShape(SliderTickMarkShape.noTickMark),
      SliderTickMarkShape.noTickMark,
    );

    expect(
      ThemeDecoder.decodeSliderTickMarkShape('noTickMark'),
      SliderTickMarkShape.noTickMark,
    );

    expect(
      ThemeEncoder.encodeSliderTickMarkShape(SliderTickMarkShape.noTickMark),
      'noTickMark',
    );
  });

  test('SliderTrackShape', () {
    expect(ThemeDecoder.decodeSliderTrackShape(null), null);
    expect(ThemeEncoder.encodeSliderTrackShape(null), null);

    SliderTrackShape entry = const RectangularSliderTrackShape();

    expect(ThemeDecoder.decodeSliderTrackShape(entry), entry);

    var encoded = ThemeEncoder.encodeSliderTrackShape(entry);
    var decoded = ThemeDecoder.decodeSliderTrackShape(encoded);

    expect(encoded, {'type': 'rectangular'});

    expect(decoded?.runtimeType, entry.runtimeType);

    entry = const RoundedRectSliderTrackShape();

    encoded = ThemeEncoder.encodeSliderTrackShape(entry);
    decoded = ThemeDecoder.decodeSliderTrackShape(encoded);

    expect(encoded, {'type': 'rounded'});

    expect(decoded?.runtimeType, entry.runtimeType);
  });

  test('SnackBarBehavior', () {
    expect(ThemeDecoder.decodeSnackBarBehavior(null), null);
    expect(ThemeEncoder.encodeSnackBarBehavior(null), null);

    expect(
      ThemeDecoder.decodeSnackBarBehavior(SnackBarBehavior.fixed),
      SnackBarBehavior.fixed,
    );

    expect(
      ThemeDecoder.decodeSnackBarBehavior('fixed'),
      SnackBarBehavior.fixed,
    );
    expect(
      ThemeDecoder.decodeSnackBarBehavior('floating'),
      SnackBarBehavior.floating,
    );

    expect(
      ThemeEncoder.encodeSnackBarBehavior(SnackBarBehavior.fixed),
      'fixed',
    );
    expect(
      ThemeEncoder.encodeSnackBarBehavior(SnackBarBehavior.floating),
      'floating',
    );
  });

  test('SnackBarThemeData', () {
    expect(ThemeDecoder.decodeSnackBarThemeData(null), null);
    expect(ThemeEncoder.encodeSnackBarThemeData(null), null);

    const entry = SnackBarThemeData(
      actionTextColor: Color(0xff111111),
      backgroundColor: Color(0xff222222),
      behavior: SnackBarBehavior.floating,
      contentTextStyle: TextStyle(color: Color(0xff333333)),
      disabledActionTextColor: Color(0xff444444),
      dismissDirection: DismissDirection.endToStart,
      elevation: 1.0,
      shape: RoundedRectangleBorder(),
      width: 12.0,
    );

    expect(ThemeDecoder.decodeSnackBarThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeSnackBarThemeData(entry);
    final decoded = ThemeDecoder.decodeSnackBarThemeData(encoded);

    expect(encoded, {
      'actionTextColor': '#ff111111',
      'backgroundColor': '#ff222222',
      'behavior': 'floating',
      'contentTextStyle': {'color': '#ff333333', 'inherit': true},
      'disabledActionTextColor': '#ff444444',
      'dismissDirection': 'endToStart',
      'elevation': 1.0,
      'shape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'bottomRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'topLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'topRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded',
      },
      'width': 12.0,
    });

    expect(decoded, entry);
  });

  test('SmartDashesType', () {
    expect(ThemeDecoder.decodeSmartDashesType(null), null);
    expect(ThemeEncoder.encodeSmartDashesType(null), null);

    expect(
      ThemeDecoder.decodeSmartDashesType(SmartDashesType.disabled),
      SmartDashesType.disabled,
    );

    expect(
      ThemeDecoder.decodeSmartDashesType('disabled'),
      SmartDashesType.disabled,
    );
    expect(
      ThemeDecoder.decodeSmartDashesType('enabled'),
      SmartDashesType.enabled,
    );

    expect(
      ThemeEncoder.encodeSmartDashesType(SmartDashesType.disabled),
      'disabled',
    );
    expect(
      ThemeEncoder.encodeSmartDashesType(SmartDashesType.enabled),
      'enabled',
    );
  });

  test('SmartQuotesType', () {
    expect(ThemeDecoder.decodeSmartQuotesType(null), null);
    expect(ThemeEncoder.encodeSmartQuotesType(null), null);

    expect(
      ThemeDecoder.decodeSmartQuotesType(SmartQuotesType.disabled),
      SmartQuotesType.disabled,
    );

    expect(
      ThemeDecoder.decodeSmartQuotesType('disabled'),
      SmartQuotesType.disabled,
    );
    expect(
      ThemeDecoder.decodeSmartQuotesType('enabled'),
      SmartQuotesType.enabled,
    );

    expect(
      ThemeEncoder.encodeSmartQuotesType(SmartQuotesType.disabled),
      'disabled',
    );
    expect(
      ThemeEncoder.encodeSmartQuotesType(SmartQuotesType.enabled),
      'enabled',
    );
  });
  test('StackFit', () {
    expect(ThemeDecoder.decodeStackFit(null), null);
    expect(ThemeEncoder.encodeStackFit(null), null);

    expect(ThemeDecoder.decodeStackFit(StackFit.expand), StackFit.expand);

    expect(ThemeDecoder.decodeStackFit('expand'), StackFit.expand);
    expect(ThemeDecoder.decodeStackFit('loose'), StackFit.loose);
    expect(ThemeDecoder.decodeStackFit('passthrough'), StackFit.passthrough);

    expect(ThemeEncoder.encodeStackFit(StackFit.expand), 'expand');
    expect(ThemeEncoder.encodeStackFit(StackFit.loose), 'loose');
    expect(ThemeEncoder.encodeStackFit(StackFit.passthrough), 'passthrough');
  });

  test('StrokeCap', () {
    expect(ThemeDecoder.decodeStrokeCap(null), null);
    expect(ThemeEncoder.encodeStrokeCap(null), null);

    expect(ThemeDecoder.decodeStrokeCap(StrokeCap.butt), StrokeCap.butt);

    expect(ThemeDecoder.decodeStrokeCap('butt'), StrokeCap.butt);
    expect(ThemeDecoder.decodeStrokeCap('round'), StrokeCap.round);
    expect(ThemeDecoder.decodeStrokeCap('square'), StrokeCap.square);

    expect(ThemeEncoder.encodeStrokeCap(StrokeCap.butt), 'butt');
    expect(ThemeEncoder.encodeStrokeCap(StrokeCap.round), 'round');
    expect(ThemeEncoder.encodeStrokeCap(StrokeCap.square), 'square');
  });

  test('StrutStyle', () {
    expect(ThemeDecoder.decodeStrutStyle(null), null);
    expect(ThemeEncoder.encodeStrutStyle(null), null);

    const entry = StrutStyle(
      fontFamily: 'foo',
      fontFamilyFallback: ['a', 'b', 'c'],
      fontSize: 1.0,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w200,
      forceStrutHeight: true,
      height: 2.0,
      leading: 3.0,
      leadingDistribution: TextLeadingDistribution.even,
      package: 'bar',
    );

    expect(ThemeDecoder.decodeStrutStyle(entry), entry);

    final encoded = ThemeEncoder.encodeStrutStyle(entry);
    final decoded = ThemeDecoder.decodeStrutStyle(encoded);

    expect(encoded, {
      'fontFamily': 'packages/bar/foo',
      'fontFamilyFallback': [
        'packages/bar/a',
        'packages/bar/b',
        'packages/bar/c',
      ],
      'fontSize': 1.0,
      'fontStyle': 'italic',
      'fontWeight': 'w200',
      'forceStrutHeight': true,
      'height': 2.0,
      'leading': 3.0,
      'leadingDistribution': 'even',
    });

    expect(ThemeEncoder.encodeStrutStyle(decoded), encoded);
  });

  test('SwitchThemeData', () {
    expect(ThemeDecoder.decodeSwitchThemeData(null), null);
    expect(ThemeEncoder.encodeSwitchThemeData(null), null);

    final entry = SwitchThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      mouseCursor: WidgetStateProperty.all(MouseCursor.defer),
      overlayColor: WidgetStateProperty.all(_kColor),
      padding: EdgeInsets.all(8.0),
      splashRadius: 20.0,
      thumbColor: WidgetStateProperty.all(_kColor),
      trackColor: WidgetStateProperty.all(_kColor),
      trackOutlineWidth: WidgetStateProperty.all(2.0),
    );

    final encoded = {
      'materialTapTargetSize': 'shrinkWrap',
      'mouseCursor': {
        'disabled': {'type': 'defer'},
        'dragged': {'type': 'defer'},
        'empty': {'type': 'defer'},
        'error': {'type': 'defer'},
        'focused': {'type': 'defer'},
        'hovered': {'type': 'defer'},
        'pressed': {'type': 'defer'},
        'scrolledUnder': {'type': 'defer'},
        'selected': {'type': 'defer'},
      },
      'overlayColor': {
        'disabled': '#00123456',
        'dragged': '#00123456',
        'empty': '#00123456',
        'error': '#00123456',
        'focused': '#00123456',
        'hovered': '#00123456',
        'pressed': '#00123456',
        'scrolledUnder': '#00123456',
        'selected': '#00123456',
      },
      'padding': {'bottom': 8.0, 'left': 8.0, 'right': 8.0, 'top': 8.0},
      'splashRadius': 20.0,
      'thumbColor': {
        'disabled': '#00123456',
        'dragged': '#00123456',
        'empty': '#00123456',
        'error': '#00123456',
        'focused': '#00123456',
        'hovered': '#00123456',
        'pressed': '#00123456',
        'scrolledUnder': '#00123456',
        'selected': '#00123456',
      },
      'trackColor': {
        'disabled': '#00123456',
        'dragged': '#00123456',
        'empty': '#00123456',
        'error': '#00123456',
        'focused': '#00123456',
        'hovered': '#00123456',
        'pressed': '#00123456',
        'scrolledUnder': '#00123456',
        'selected': '#00123456',
      },
      'trackOutlineColor': {
        'disabled': '#00123456',
        'dragged': '#00123456',
        'empty': '#00123456',
        'error': '#00123456',
        'focused': '#00123456',
        'hovered': '#00123456',
        'pressed': '#00123456',
        'scrolledUnder': '#00123456',
        'selected': '#00123456',
      },
      'trackOutlineWidth': {
        'disabled': 2.0,
        'dragged': 2.0,
        'empty': 2.0,
        'error': 2.0,
        'focused': 2.0,
        'hovered': 2.0,
        'pressed': 2.0,
        'scrolledUnder': 2.0,
        'selected': 2.0,
      },
    };

    expect(ThemeDecoder.decodeSwitchThemeData(entry), entry);
    expect(ThemeEncoder.encodeSwitchThemeData(entry), encoded);

    final theme = ThemeDecoder.decodeSwitchThemeData({
      'thumbColor': {
        'disabled': '#ff9e9e9e',
        'dragged': '#fff44336',
        'empty': '#fff44336',
        'error': '#fff44336',
        'focused': '#fff44336',
        'hovered': '#fff44336',
        'pressed': '#fff44336',
        'selected': '#ff2196f3',
      },
    });

    expect(
      theme!.thumbColor!.resolve({WidgetState.selected}),
      const Color(0xff2196f3),
    );
  });

  test('SystemUiOverlayStyle', () {
    expect(ThemeDecoder.decodeSystemUiOverlayStyle(null), null);
    expect(ThemeEncoder.encodeSystemUiOverlayStyle(null), null);

    expect(
      ThemeDecoder.decodeSystemUiOverlayStyle(SystemUiOverlayStyle.dark),
      SystemUiOverlayStyle.dark,
    );

    expect(
      ThemeDecoder.decodeSystemUiOverlayStyle('dark'),
      SystemUiOverlayStyle.dark,
    );
    expect(
      ThemeDecoder.decodeSystemUiOverlayStyle('light'),
      SystemUiOverlayStyle.light,
    );

    expect(
      ThemeEncoder.encodeSystemUiOverlayStyle(SystemUiOverlayStyle.dark),
      'dark',
    );
    expect(
      ThemeEncoder.encodeSystemUiOverlayStyle(SystemUiOverlayStyle.light),
      'light',
    );

    expect(
      ThemeDecoder.decodeSystemUiOverlayStyle({
        'statusBarBrightness': 'light',
        'statusBarColor': '#ff000000',
        'statusBarIconBrightness': 'dark',
        'systemNavigationBarColor': '#ff111111',
        'systemNavigationBarContrastEnforced': true,
        'systemNavigationBarDividerColor': '#ff222222',
        'systemNavigationBarIconBrightness': 'light',
        'systemStatusBarContrastEnforced': false,
      }),
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Color(0xff000000),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xff111111),
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarDividerColor: Color(0xff222222),
        systemNavigationBarIconBrightness: Brightness.light,
        systemStatusBarContrastEnforced: false,
      ),
    );

    expect(
      ThemeEncoder.encodeSystemUiOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Color(0xff000000),
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Color(0xff111111),
          systemNavigationBarContrastEnforced: true,
          systemNavigationBarDividerColor: Color(0xff222222),
          systemNavigationBarIconBrightness: Brightness.light,
          systemStatusBarContrastEnforced: false,
        ),
      ),
      {
        'statusBarBrightness': 'light',
        'statusBarColor': '#ff000000',
        'statusBarIconBrightness': 'dark',
        'systemNavigationBarColor': '#ff111111',
        'systemNavigationBarContrastEnforced': true,
        'systemNavigationBarDividerColor': '#ff222222',
        'systemNavigationBarIconBrightness': 'light',
        'systemStatusBarContrastEnforced': false,
      },
    );
  });

  test('TabAlignment', () {
    expect(ThemeDecoder.decodeTabAlignment(null), null);
    expect(ThemeEncoder.encodeTabAlignment(null), null);

    expect(
      ThemeDecoder.decodeTabAlignment(TabAlignment.center),
      TabAlignment.center,
    );

    expect(ThemeDecoder.decodeTabAlignment('center'), TabAlignment.center);
    expect(ThemeDecoder.decodeTabAlignment('fill'), TabAlignment.fill);
    expect(ThemeDecoder.decodeTabAlignment('start'), TabAlignment.start);
    expect(
      ThemeDecoder.decodeTabAlignment('startOffset'),
      TabAlignment.startOffset,
    );

    expect(ThemeEncoder.encodeTabAlignment(TabAlignment.center), 'center');
    expect(ThemeEncoder.encodeTabAlignment(TabAlignment.fill), 'fill');
    expect(ThemeEncoder.encodeTabAlignment(TabAlignment.start), 'start');
    expect(
      ThemeEncoder.encodeTabAlignment(TabAlignment.startOffset),
      'startOffset',
    );
  });

  test('TabBarIndicatorSize', () {
    expect(ThemeDecoder.decodeTabBarIndicatorSize(null), null);
    expect(ThemeEncoder.encodeTabBarIndicatorSize(null), null);

    expect(
      ThemeDecoder.decodeTabBarIndicatorSize(TabBarIndicatorSize.label),
      TabBarIndicatorSize.label,
    );

    expect(
      ThemeDecoder.decodeTabBarIndicatorSize('label'),
      TabBarIndicatorSize.label,
    );
    expect(
      ThemeDecoder.decodeTabBarIndicatorSize('tab'),
      TabBarIndicatorSize.tab,
    );

    expect(
      ThemeEncoder.encodeTabBarIndicatorSize(TabBarIndicatorSize.label),
      'label',
    );
    expect(
      ThemeEncoder.encodeTabBarIndicatorSize(TabBarIndicatorSize.tab),
      'tab',
    );
  });

  test('TabBarTheme', () {
    expect(ThemeDecoder.decodeTabBarTheme(null), null);
    expect(ThemeEncoder.encodeTabBarTheme(null), null);

    try {
      ThemeDecoder.decodeTabBarTheme({'indicator': 'foo'});
      fail('exception expected');
    } catch (e) {
      // pass
    }

    const entry = TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: Color(0xff111111),
      labelPadding: EdgeInsets.all(1.0),
      labelStyle: _kTextStyle,
      textScaler: TextScaler.noScaling,
      unselectedLabelColor: Color(0xff222222),
      unselectedLabelStyle: TextStyle(color: Color(0xff333333)),
    );

    expect(ThemeDecoder.decodeTabBarTheme(entry), entry);

    final encoded = ThemeEncoder.encodeTabBarTheme(entry);

    expect(encoded, {
      'data': {
        'indicatorSize': 'label',
        'labelColor': '#ff111111',
        'labelPadding': {'bottom': 1.0, 'left': 1.0, 'right': 1.0, 'top': 1.0},
        'labelStyle': _kTextStyleJson,
        'textScaler': 'noScaling',
        'unselectedLabelColor': '#ff222222',
        'unselectedLabelStyle': {'color': '#ff333333', 'inherit': true},
      },
    });
  });

  test('TabBarThemeData', () {
    expect(ThemeDecoder.decodeTabBarThemeData(null), null);
    expect(ThemeEncoder.encodeTabBarThemeData(null), null);

    try {
      ThemeDecoder.decodeTabBarTheme({'indicator': 'foo'});
      fail('exception expected');
    } catch (e) {
      // pass
    }

    final entry = TabBarThemeData(
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: Color(0xff111111),
      labelPadding: EdgeInsets.all(1.0),
      labelStyle: _kTextStyle,
      splashBorderRadius: BorderRadius.circular(4.0),
      textScaler: TextScaler.noScaling,
      unselectedLabelColor: Color(0xff222222),
      unselectedLabelStyle: TextStyle(color: Color(0xff333333)),
    );

    expect(ThemeDecoder.decodeTabBarThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeTabBarThemeData(entry);
    final decoded = ThemeDecoder.decodeTabBarThemeData(encoded);

    expect(encoded, {
      'indicatorSize': 'label',
      'labelColor': '#ff111111',
      'labelPadding': {'bottom': 1.0, 'left': 1.0, 'right': 1.0, 'top': 1.0},
      'labelStyle': _kTextStyleJson,
      'splashBorderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
        'bottomRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
        'topLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
        'topRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
        'type': 'only',
      },
      'textScaler': 'noScaling',
      'unselectedLabelColor': '#ff222222',
      'unselectedLabelStyle': {'color': '#ff333333', 'inherit': true},
    });

    expect(decoded, entry);
  });

  test('TabIndicatorAnimation', () {
    expect(ThemeDecoder.decodeTabIndicatorAnimation(null), null);
    expect(ThemeEncoder.encodeTabIndicatorAnimation(null), null);

    expect(
      ThemeDecoder.decodeTabIndicatorAnimation(TabIndicatorAnimation.elastic),
      TabIndicatorAnimation.elastic,
    );

    expect(
      ThemeDecoder.decodeTabIndicatorAnimation('elastic'),
      TabIndicatorAnimation.elastic,
    );
    expect(
      ThemeDecoder.decodeTabIndicatorAnimation('linear'),
      TabIndicatorAnimation.linear,
    );

    expect(
      ThemeEncoder.encodeTabIndicatorAnimation(TabIndicatorAnimation.elastic),
      'elastic',
    );
    expect(
      ThemeEncoder.encodeTabIndicatorAnimation(TabIndicatorAnimation.linear),
      'linear',
    );
  });

  test('TableBorder', () {
    expect(ThemeDecoder.decodeTableBorder(null), null);
    expect(ThemeEncoder.encodeTableBorder(null), null);

    final entry = TableBorder(
      borderRadius: BorderRadius.circular(1.0),
      bottom: const BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 2.0,
      ),
      horizontalInside: const BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 3.0,
      ),
      left: const BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 4.0,
      ),
      right: const BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 5.0,
      ),
      top: const BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 6.0,
      ),
      verticalInside: const BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: 7.0,
      ),
    );

    expect(ThemeDecoder.decodeTableBorder(entry), entry);

    final encoded = ThemeEncoder.encodeTableBorder(entry);
    final decoded = ThemeDecoder.decodeTableBorder(encoded);

    expect(encoded, {
      'borderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'bottomRight': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'topLeft': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'topRight': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'type': 'only',
      },
      'bottom': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 2.0,
      },
      'horizontalInside': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 3.0,
      },
      'left': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 4.0,
      },
      'right': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 5.0,
      },
      'top': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 6.0,
      },
      'verticalInside': {
        'color': _kColorStr,
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 7.0,
      },
    });

    expect(decoded, entry);
  });

  test('TableColumnWidth', () {
    expect(ThemeDecoder.decodeTableColumnWidth(null), null);
    expect(ThemeEncoder.encodeTableColumnWidth(null), null);

    const entry = FlexColumnWidth();

    expect(ThemeDecoder.decodeTableColumnWidth(entry), entry);

    expect(
      ThemeDecoder.decodeTableColumnWidth({
        'type': 'fixed',
        'value': 1.0,
      }).toString(),
      const FixedColumnWidth(1.0).toString(),
    );
    expect(
      ThemeDecoder.decodeTableColumnWidth({
        'type': 'flex',
        'value': 2.0,
      }).toString(),
      const FlexColumnWidth(2.0).toString(),
    );
    expect(
      ThemeDecoder.decodeTableColumnWidth({
        'type': 'fraction',
        'value': 3.0,
      }).toString(),
      const FractionColumnWidth(3.0).toString(),
    );
    expect(
      ThemeDecoder.decodeTableColumnWidth({
        'type': 'intrinsic',
        'value': 4.0,
      }).toString(),
      const IntrinsicColumnWidth(flex: 4.0).toString(),
    );
    expect(
      ThemeDecoder.decodeTableColumnWidth({
        'a': {'type': 'fixed', 'value': 5.0},
        'b': {'type': 'fixed', 'value': 6.0},
        'type': 'max',
      }).toString(),
      const MaxColumnWidth(
        FixedColumnWidth(5.0),
        FixedColumnWidth(6.0),
      ).toString(),
    );
    expect(
      ThemeDecoder.decodeTableColumnWidth({
        'a': {'type': 'fixed', 'value': 5.0},
        'b': {'type': 'fixed', 'value': 6.0},
        'type': 'min',
      }).toString(),
      const MinColumnWidth(
        FixedColumnWidth(5.0),
        FixedColumnWidth(6.0),
      ).toString(),
    );

    expect(ThemeEncoder.encodeTableColumnWidth(const FixedColumnWidth(1.0)), {
      'type': 'fixed',
      'value': 1.0,
    });
    expect(ThemeEncoder.encodeTableColumnWidth(const FlexColumnWidth(2.0)), {
      'type': 'flex',
      'value': 2.0,
    });
    expect(
      ThemeEncoder.encodeTableColumnWidth(const FractionColumnWidth(3.0)),
      {'type': 'fraction', 'value': 3.0},
    );
    expect(
      ThemeEncoder.encodeTableColumnWidth(
        const IntrinsicColumnWidth(flex: 4.0),
      ),
      {'type': 'intrinsic', 'value': 4.0},
    );
    expect(
      ThemeEncoder.encodeTableColumnWidth(
        const MaxColumnWidth(FixedColumnWidth(5.0), FixedColumnWidth(6.0)),
      ),
      {
        'a': {'type': 'fixed', 'value': 5.0},
        'b': {'type': 'fixed', 'value': 6.0},
        'type': 'max',
      },
    );
    expect(
      ThemeEncoder.encodeTableColumnWidth(
        const MinColumnWidth(FixedColumnWidth(5.0), FixedColumnWidth(6.0)),
      ),
      {
        'a': {'type': 'fixed', 'value': 5.0},
        'b': {'type': 'fixed', 'value': 6.0},
        'type': 'min',
      },
    );
  });

  test('TargetPlatform', () {
    expect(ThemeDecoder.decodeTargetPlatform(null), null);
    expect(ThemeEncoder.encodeTargetPlatform(null), null);

    expect(
      ThemeDecoder.decodeTargetPlatform(TargetPlatform.android),
      TargetPlatform.android,
    );

    expect(
      ThemeDecoder.decodeTargetPlatform('android'),
      TargetPlatform.android,
    );
    expect(
      ThemeDecoder.decodeTargetPlatform('fuchsia'),
      TargetPlatform.fuchsia,
    );
    expect(ThemeDecoder.decodeTargetPlatform('iOS'), TargetPlatform.iOS);
    expect(ThemeDecoder.decodeTargetPlatform('linux'), TargetPlatform.linux);
    expect(ThemeDecoder.decodeTargetPlatform('macOS'), TargetPlatform.macOS);
    expect(
      ThemeDecoder.decodeTargetPlatform('windows'),
      TargetPlatform.windows,
    );

    expect(
      ThemeEncoder.encodeTargetPlatform(TargetPlatform.android),
      'android',
    );
    expect(
      ThemeEncoder.encodeTargetPlatform(TargetPlatform.fuchsia),
      'fuchsia',
    );
    expect(ThemeEncoder.encodeTargetPlatform(TargetPlatform.iOS), 'iOS');
    expect(ThemeEncoder.encodeTargetPlatform(TargetPlatform.linux), 'linux');
    expect(ThemeEncoder.encodeTargetPlatform(TargetPlatform.macOS), 'macOS');
    expect(
      ThemeEncoder.encodeTargetPlatform(TargetPlatform.windows),
      'windows',
    );
  });

  test('TextAlign', () {
    expect(ThemeDecoder.decodeTextAlign(null), null);
    expect(ThemeEncoder.encodeTextAlign(null), null);

    expect(ThemeDecoder.decodeTextAlign(TextAlign.center), TextAlign.center);

    expect(ThemeDecoder.decodeTextAlign('center'), TextAlign.center);
    expect(ThemeDecoder.decodeTextAlign('end'), TextAlign.end);
    expect(ThemeDecoder.decodeTextAlign('justify'), TextAlign.justify);
    expect(ThemeDecoder.decodeTextAlign('left'), TextAlign.left);
    expect(ThemeDecoder.decodeTextAlign('right'), TextAlign.right);
    expect(ThemeDecoder.decodeTextAlign('start'), TextAlign.start);

    expect(ThemeEncoder.encodeTextAlign(TextAlign.center), 'center');
    expect(ThemeEncoder.encodeTextAlign(TextAlign.end), 'end');
    expect(ThemeEncoder.encodeTextAlign(TextAlign.justify), 'justify');
    expect(ThemeEncoder.encodeTextAlign(TextAlign.left), 'left');
    expect(ThemeEncoder.encodeTextAlign(TextAlign.right), 'right');
    expect(ThemeEncoder.encodeTextAlign(TextAlign.start), 'start');
  });

  test('TextAlignVertical', () {
    expect(ThemeDecoder.decodeTextAlignVertical(null), null);
    expect(ThemeEncoder.encodeTextAlignVertical(null), null);

    expect(
      ThemeDecoder.decodeTextAlignVertical(TextAlignVertical.bottom),
      TextAlignVertical.bottom,
    );

    expect(
      ThemeDecoder.decodeTextAlignVertical('bottom'),
      TextAlignVertical.bottom,
    );
    expect(
      ThemeDecoder.decodeTextAlignVertical('center'),
      TextAlignVertical.center,
    );
    expect(ThemeDecoder.decodeTextAlignVertical('top'), TextAlignVertical.top);

    expect(
      ThemeEncoder.encodeTextAlignVertical(TextAlignVertical.bottom),
      'bottom',
    );
    expect(
      ThemeEncoder.encodeTextAlignVertical(TextAlignVertical.center),
      'center',
    );
    expect(ThemeEncoder.encodeTextAlignVertical(TextAlignVertical.top), 'top');
  });

  test('TextBaseline', () {
    expect(ThemeDecoder.decodeTextBaseline(null), null);
    expect(ThemeEncoder.encodeTextBaseline(null), null);

    expect(
      ThemeDecoder.decodeTextBaseline(TextBaseline.alphabetic),
      TextBaseline.alphabetic,
    );

    expect(
      ThemeDecoder.decodeTextBaseline('alphabetic'),
      TextBaseline.alphabetic,
    );
    expect(
      ThemeDecoder.decodeTextBaseline('ideographic'),
      TextBaseline.ideographic,
    );

    expect(
      ThemeEncoder.encodeTextBaseline(TextBaseline.alphabetic),
      'alphabetic',
    );
    expect(
      ThemeEncoder.encodeTextBaseline(TextBaseline.ideographic),
      'ideographic',
    );
  });

  test('TextButtonThemeData', () {
    expect(ThemeDecoder.decodeTextButtonThemeData(null), null);
    expect(ThemeEncoder.encodeTextButtonThemeData(null), null);

    final entry = TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(const Color(0xff222222)),
      ),
    );

    expect(ThemeDecoder.decodeTextButtonThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeTextButtonThemeData(entry);
    final decoded = ThemeDecoder.decodeTextButtonThemeData(encoded);

    expect(encoded, {
      'style': {'backgroundColor': _materializeState('#ff222222')},
    });

    bool? textButtonThemeDatasAreEqual(Object? first, Object second) {
      bool? result;

      if (first.runtimeType != second.runtimeType) {
        result = false;
      } else if (first is! TextButtonThemeData) {
        result = false;
      } else if (second is TextButtonThemeData) {
        result = _buttonStylesAreEqual(first.style, second.style);
      }

      return result;
    }

    expect(textButtonThemeDatasAreEqual(decoded, entry), true);
  });

  test('TextCapitalization', () {
    expect(ThemeDecoder.decodeTextCapitalization(null), null);
    expect(ThemeEncoder.encodeTextCapitalization(null), null);

    expect(
      ThemeDecoder.decodeTextCapitalization(TextCapitalization.characters),
      TextCapitalization.characters,
    );

    expect(
      ThemeDecoder.decodeTextCapitalization('characters'),
      TextCapitalization.characters,
    );
    expect(
      ThemeDecoder.decodeTextCapitalization('none'),
      TextCapitalization.none,
    );
    expect(
      ThemeDecoder.decodeTextCapitalization('sentences'),
      TextCapitalization.sentences,
    );
    expect(
      ThemeDecoder.decodeTextCapitalization('words'),
      TextCapitalization.words,
    );

    expect(
      ThemeEncoder.encodeTextCapitalization(TextCapitalization.characters),
      'characters',
    );
    expect(
      ThemeEncoder.encodeTextCapitalization(TextCapitalization.none),
      'none',
    );
    expect(
      ThemeEncoder.encodeTextCapitalization(TextCapitalization.sentences),
      'sentences',
    );
    expect(
      ThemeEncoder.encodeTextCapitalization(TextCapitalization.words),
      'words',
    );
  });

  test('TextDecoration', () {
    expect(ThemeDecoder.decodeTextDecoration(null), null);
    expect(ThemeEncoder.encodeTextDecoration(null), null);

    expect(
      ThemeDecoder.decodeTextDecoration(TextDecoration.lineThrough),
      TextDecoration.lineThrough,
    );

    expect(
      ThemeDecoder.decodeTextDecoration('lineThrough'),
      TextDecoration.lineThrough,
    );
    expect(ThemeDecoder.decodeTextDecoration('none'), TextDecoration.none);
    expect(
      ThemeDecoder.decodeTextDecoration('overline'),
      TextDecoration.overline,
    );
    expect(
      ThemeDecoder.decodeTextDecoration('underline'),
      TextDecoration.underline,
    );

    expect(
      ThemeEncoder.encodeTextDecoration(TextDecoration.lineThrough),
      'lineThrough',
    );
    expect(ThemeEncoder.encodeTextDecoration(TextDecoration.none), 'none');
    expect(
      ThemeEncoder.encodeTextDecoration(TextDecoration.overline),
      'overline',
    );
    expect(
      ThemeEncoder.encodeTextDecoration(TextDecoration.underline),
      'underline',
    );
  });

  test('TextDecorationStyle', () {
    expect(ThemeDecoder.decodeTextDecorationStyle(null), null);
    expect(ThemeEncoder.encodeTextDecorationStyle(null), null);

    expect(
      ThemeDecoder.decodeTextDecorationStyle(TextDecorationStyle.dashed),
      TextDecorationStyle.dashed,
    );

    expect(
      ThemeDecoder.decodeTextDecorationStyle('dashed'),
      TextDecorationStyle.dashed,
    );
    expect(
      ThemeDecoder.decodeTextDecorationStyle('dotted'),
      TextDecorationStyle.dotted,
    );
    expect(
      ThemeDecoder.decodeTextDecorationStyle('double'),
      TextDecorationStyle.double,
    );
    expect(
      ThemeDecoder.decodeTextDecorationStyle('solid'),
      TextDecorationStyle.solid,
    );
    expect(
      ThemeDecoder.decodeTextDecorationStyle('wavy'),
      TextDecorationStyle.wavy,
    );

    expect(
      ThemeEncoder.encodeTextDecorationStyle(TextDecorationStyle.dashed),
      'dashed',
    );
    expect(
      ThemeEncoder.encodeTextDecorationStyle(TextDecorationStyle.dotted),
      'dotted',
    );
    expect(
      ThemeEncoder.encodeTextDecorationStyle(TextDecorationStyle.double),
      'double',
    );
    expect(
      ThemeEncoder.encodeTextDecorationStyle(TextDecorationStyle.solid),
      'solid',
    );
    expect(
      ThemeEncoder.encodeTextDecorationStyle(TextDecorationStyle.wavy),
      'wavy',
    );
  });

  test('TextDirection', () {
    expect(ThemeDecoder.decodeTextDirection(null), null);
    expect(ThemeEncoder.encodeTextDirection(null), null);

    expect(
      ThemeDecoder.decodeTextDirection(TextDirection.ltr),
      TextDirection.ltr,
    );

    expect(ThemeDecoder.decodeTextDirection('ltr'), TextDirection.ltr);
    expect(ThemeDecoder.decodeTextDirection('rtl'), TextDirection.rtl);

    expect(ThemeEncoder.encodeTextDirection(TextDirection.ltr), 'ltr');
    expect(ThemeEncoder.encodeTextDirection(TextDirection.rtl), 'rtl');
  });

  test('TextHeightBehavior', () {
    expect(ThemeDecoder.decodeTextHeightBehavior(null), null);
    expect(ThemeEncoder.encodeTextHeightBehavior(null), null);

    const entry = TextHeightBehavior(
      applyHeightToFirstAscent: true,
      applyHeightToLastDescent: true,
      leadingDistribution: TextLeadingDistribution.even,
    );

    expect(ThemeDecoder.decodeTextHeightBehavior(entry), entry);

    final encoded = ThemeEncoder.encodeTextHeightBehavior(entry);
    final decoded = ThemeDecoder.decodeTextHeightBehavior(encoded);

    expect(encoded, {
      'applyHeightToFirstAscent': true,
      'applyHeightToLastDescent': true,
      'leadingDistribution': 'even',
    });

    expect(decoded, entry);
  });

  test('TextInputAction', () {
    expect(ThemeDecoder.decodeTextInputAction(null), null);
    expect(ThemeEncoder.encodeTextInputAction(null), null);

    expect(
      ThemeDecoder.decodeTextInputAction(TextInputAction.continueAction),
      TextInputAction.continueAction,
    );

    expect(
      ThemeDecoder.decodeTextInputAction('continueAction'),
      TextInputAction.continueAction,
    );
    expect(ThemeDecoder.decodeTextInputAction('done'), TextInputAction.done);
    expect(
      ThemeDecoder.decodeTextInputAction('emergencyCall'),
      TextInputAction.emergencyCall,
    );
    expect(ThemeDecoder.decodeTextInputAction('go'), TextInputAction.go);
    expect(ThemeDecoder.decodeTextInputAction('join'), TextInputAction.join);
    expect(
      ThemeDecoder.decodeTextInputAction('newline'),
      TextInputAction.newline,
    );
    expect(ThemeDecoder.decodeTextInputAction('next'), TextInputAction.next);
    expect(ThemeDecoder.decodeTextInputAction('none'), TextInputAction.none);
    expect(
      ThemeDecoder.decodeTextInputAction('previous'),
      TextInputAction.previous,
    );
    expect(ThemeDecoder.decodeTextInputAction('route'), TextInputAction.route);
    expect(
      ThemeDecoder.decodeTextInputAction('search'),
      TextInputAction.search,
    );
    expect(ThemeDecoder.decodeTextInputAction('send'), TextInputAction.send);
    expect(
      ThemeDecoder.decodeTextInputAction('unspecified'),
      TextInputAction.unspecified,
    );

    expect(
      ThemeEncoder.encodeTextInputAction(TextInputAction.continueAction),
      'continueAction',
    );
    expect(ThemeEncoder.encodeTextInputAction(TextInputAction.done), 'done');
    expect(
      ThemeEncoder.encodeTextInputAction(TextInputAction.emergencyCall),
      'emergencyCall',
    );
    expect(ThemeEncoder.encodeTextInputAction(TextInputAction.go), 'go');
    expect(ThemeEncoder.encodeTextInputAction(TextInputAction.join), 'join');
    expect(
      ThemeEncoder.encodeTextInputAction(TextInputAction.newline),
      'newline',
    );
    expect(ThemeEncoder.encodeTextInputAction(TextInputAction.next), 'next');
    expect(ThemeEncoder.encodeTextInputAction(TextInputAction.none), 'none');
    expect(
      ThemeEncoder.encodeTextInputAction(TextInputAction.previous),
      'previous',
    );
    expect(ThemeEncoder.encodeTextInputAction(TextInputAction.route), 'route');
    expect(
      ThemeEncoder.encodeTextInputAction(TextInputAction.search),
      'search',
    );
    expect(ThemeEncoder.encodeTextInputAction(TextInputAction.send), 'send');
    expect(
      ThemeEncoder.encodeTextInputAction(TextInputAction.unspecified),
      'unspecified',
    );
  });

  test('TextInputType', () {
    expect(ThemeDecoder.decodeTextInputType(null), null);
    expect(ThemeEncoder.encodeTextInputType(null), null);

    expect(
      ThemeDecoder.decodeTextInputType(TextInputType.datetime),
      TextInputType.datetime,
    );

    expect(
      ThemeDecoder.decodeTextInputType('datetime'),
      TextInputType.datetime,
    );
    expect(
      ThemeDecoder.decodeTextInputType('emailAddress'),
      TextInputType.emailAddress,
    );
    expect(
      ThemeDecoder.decodeTextInputType('multiline'),
      TextInputType.multiline,
    );
    expect(ThemeDecoder.decodeTextInputType('name'), TextInputType.name);
    expect(ThemeDecoder.decodeTextInputType('none'), TextInputType.none);
    expect(ThemeDecoder.decodeTextInputType('number'), TextInputType.number);
    expect(ThemeDecoder.decodeTextInputType('phone'), TextInputType.phone);
    expect(
      ThemeDecoder.decodeTextInputType('streetAddress'),
      TextInputType.streetAddress,
    );
    expect(ThemeDecoder.decodeTextInputType('text'), TextInputType.text);
    expect(ThemeDecoder.decodeTextInputType('twitter'), TextInputType.twitter);
    expect(ThemeDecoder.decodeTextInputType('url'), TextInputType.url);
    expect(
      ThemeDecoder.decodeTextInputType('visiblePassword'),
      TextInputType.visiblePassword,
    );
    expect(
      ThemeDecoder.decodeTextInputType('webSearch'),
      TextInputType.webSearch,
    );

    expect(
      ThemeEncoder.encodeTextInputType(TextInputType.datetime),
      'datetime',
    );
    expect(
      ThemeEncoder.encodeTextInputType(TextInputType.emailAddress),
      'emailAddress',
    );
    expect(
      ThemeEncoder.encodeTextInputType(TextInputType.multiline),
      'multiline',
    );
    expect(ThemeEncoder.encodeTextInputType(TextInputType.name), 'name');
    expect(ThemeEncoder.encodeTextInputType(TextInputType.none), 'none');
    expect(ThemeEncoder.encodeTextInputType(TextInputType.number), 'number');
    expect(ThemeEncoder.encodeTextInputType(TextInputType.phone), 'phone');
    expect(
      ThemeEncoder.encodeTextInputType(TextInputType.streetAddress),
      'streetAddress',
    );
    expect(ThemeEncoder.encodeTextInputType(TextInputType.text), 'text');
    expect(ThemeEncoder.encodeTextInputType(TextInputType.twitter), 'twitter');
    expect(ThemeEncoder.encodeTextInputType(TextInputType.url), 'url');
    expect(
      ThemeEncoder.encodeTextInputType(TextInputType.visiblePassword),
      'visiblePassword',
    );
    expect(
      ThemeEncoder.encodeTextInputType(TextInputType.webSearch),
      'webSearch',
    );
  });

  test('TextLeadingDistribution', () {
    expect(ThemeDecoder.decodeTextLeadingDistribution(null), null);
    expect(ThemeEncoder.encodeTextLeadingDistribution(null), null);

    expect(
      ThemeDecoder.decodeTextLeadingDistribution(TextLeadingDistribution.even),
      TextLeadingDistribution.even,
    );

    expect(
      ThemeDecoder.decodeTextLeadingDistribution('even'),
      TextLeadingDistribution.even,
    );
    expect(
      ThemeDecoder.decodeTextLeadingDistribution('proportional'),
      TextLeadingDistribution.proportional,
    );

    expect(
      ThemeEncoder.encodeTextLeadingDistribution(TextLeadingDistribution.even),
      'even',
    );
    expect(
      ThemeEncoder.encodeTextLeadingDistribution(
        TextLeadingDistribution.proportional,
      ),
      'proportional',
    );
  });

  test('TextOverflow', () {
    expect(ThemeDecoder.decodeTextOverflow(null), null);
    expect(ThemeEncoder.encodeTextOverflow(null), null);

    expect(
      ThemeDecoder.decodeTextOverflow(TextOverflow.clip),
      TextOverflow.clip,
    );

    expect(ThemeDecoder.decodeTextOverflow('clip'), TextOverflow.clip);
    expect(ThemeDecoder.decodeTextOverflow('ellipsis'), TextOverflow.ellipsis);
    expect(ThemeDecoder.decodeTextOverflow('fade'), TextOverflow.fade);
    expect(ThemeDecoder.decodeTextOverflow('visible'), TextOverflow.visible);

    expect(ThemeEncoder.encodeTextOverflow(TextOverflow.clip), 'clip');
    expect(ThemeEncoder.encodeTextOverflow(TextOverflow.ellipsis), 'ellipsis');
    expect(ThemeEncoder.encodeTextOverflow(TextOverflow.fade), 'fade');
    expect(ThemeEncoder.encodeTextOverflow(TextOverflow.visible), 'visible');
  });

  test('TextScaler', () {
    expect(ThemeDecoder.decodeTextScaler(null), null);
    expect(ThemeEncoder.encodeTextScaler(null), null);

    expect(
      ThemeDecoder.decodeTextScaler(TextScaler.noScaling),
      TextScaler.noScaling,
    );

    expect(ThemeDecoder.decodeTextScaler('noScaling'), TextScaler.noScaling);

    expect(ThemeEncoder.encodeTextScaler(TextScaler.noScaling), 'noScaling');
  });

  test('TextSelectionThemeData', () {
    expect(ThemeDecoder.decodeTextSelectionThemeData(null), null);
    expect(ThemeEncoder.encodeTextSelectionThemeData(null), null);

    const entry = TextSelectionThemeData(
      cursorColor: Color(0xff222222),
      selectionColor: Color(0xff222222),
      selectionHandleColor: Color(0xff222222),
    );

    expect(ThemeDecoder.decodeTextSelectionThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeTextSelectionThemeData(entry);
    final decoded = ThemeDecoder.decodeTextSelectionThemeData(encoded);

    expect(encoded, {
      'cursorColor': '#ff222222',
      'selectionColor': '#ff222222',
      'selectionHandleColor': '#ff222222',
    });

    expect(decoded, entry);
  });

  test('TextSpan', () {
    expect(ThemeDecoder.decodeTextSpan(null), null);
    expect(ThemeEncoder.encodeTextSpan(null), null);

    const entry = TextSpan(
      children: [
        TextSpan(text: 'Hello'),
        TextSpan(text: 'World', style: TextStyle(fontSize: 24.0)),
      ],
      mouseCursor: SystemMouseCursors.copy,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w100),
    );
    final encoded = ThemeEncoder.encodeTextSpan(entry);
    final decoded = ThemeDecoder.decodeTextSpan(encoded);

    expect(encoded, {
      'children': [
        {
          'mouseCursor': {'type': 'defer'},
          'text': 'Hello',
        },
        {
          'mouseCursor': {'type': 'defer'},
          'text': 'World',
          'style': {'fontSize': 24.0, 'inherit': true},
        },
      ],
      'mouseCursor': {'cursor': 'copy', 'type': 'system'},
      'style': {'fontSize': 20.0, 'fontWeight': 'w100', 'inherit': true},
    });

    expect(decoded, entry);

    expect(
      ThemeDecoder.decodeTextSpan('Hello World'),
      const TextSpan(text: 'Hello World'),
    );
  });

  test('TextStyle', () {
    expect(ThemeDecoder.decodeTextStyle(null), null);
    expect(ThemeEncoder.encodeTextStyle(null), null);

    const entry = TextStyle(
      backgroundColor: Color(0xff111111),
      color: Color(0xff222222),
      decoration: TextDecoration.lineThrough,
      decorationColor: Color(0xff333333),
      decorationStyle: TextDecorationStyle.solid,
      decorationThickness: 1.0,
      fontFamily: 'foo',
      fontFamilyFallback: ['bar'],
      fontFeatures: [FontFeature('fooo', 2)],
      fontSize: 3.0,
      fontStyle: FontStyle.italic,
      fontVariations: [FontVariation('slnt', 20.0)],
      fontWeight: FontWeight.w100,
      height: 4.0,
      inherit: false,
      leadingDistribution: TextLeadingDistribution.even,
      letterSpacing: 5.0,
      locale: Locale('en', 'US'),
      overflow: TextOverflow.ellipsis,
      package: 'bar',
      shadows: [
        Shadow(
          blurRadius: 6.0,
          color: Color(0xff444444),
          offset: Offset(6.0, 7.0),
        ),
      ],
      textBaseline: TextBaseline.alphabetic,
      wordSpacing: 8.0,
    );

    expect(ThemeDecoder.decodeTextStyle(entry), entry);

    final encoded = ThemeEncoder.encodeTextStyle(entry);
    final decoded = ThemeDecoder.decodeTextStyle(encoded);

    expect(encoded, {
      'backgroundColor': '#ff111111',
      'color': '#ff222222',
      'decoration': 'lineThrough',
      'decorationColor': '#ff333333',
      'decorationStyle': 'solid',
      'decorationThickness': 1.0,
      'fontFamily': 'packages/bar/foo',
      'fontFamilyFallback': ['packages/bar/bar'],
      'fontFeatures': [
        {'feature': 'fooo', 'value': 2},
      ],
      'fontVariations': [
        {'axis': 'slnt', 'value': 20.0},
      ],
      'fontWeight': 'w100',
      'fontSize': 3.0,
      'fontStyle': 'italic',
      'height': 4.0,
      'inherit': false,
      'leadingDistribution': 'even',
      'letterSpacing': 5.0,
      'locale': {'countryCode': 'US', 'languageCode': 'en'},
      'overflow': 'ellipsis',
      'shadows': [
        {
          'blurRadius': 6.0,
          'color': '#ff444444',
          'offset': {'dx': 6.0, 'dy': 7.0},
        },
      ],
      'textBaseline': 'alphabetic',
      'wordSpacing': 8.0,
    });

    expect(decoded!.color, entry.color);
  });

  test('TextTheme', () {
    expect(ThemeDecoder.decodeTextTheme(null), null);
    expect(ThemeEncoder.encodeTextTheme(null), null);

    const entry = TextTheme(
      bodyLarge: TextStyle(color: Color(0xff111111)),
      bodyMedium: TextStyle(color: Color(0xff222222)),
      bodySmall: TextStyle(color: Color(0xff333333)),
      displayLarge: TextStyle(color: Color(0xff444444)),
      displayMedium: TextStyle(color: Color(0xff555555)),
      displaySmall: TextStyle(color: Color(0xff666666)),
      headlineLarge: TextStyle(color: Color(0xff777777)),
      headlineMedium: TextStyle(color: Color(0xff888888)),
      headlineSmall: TextStyle(color: Color(0xff999999)),
      labelLarge: TextStyle(color: Color(0xff000000)),
      labelMedium: TextStyle(color: Color(0xffaaaaaa)),
      labelSmall: TextStyle(color: Color(0xffbbbbbb)),
      titleLarge: TextStyle(color: Color(0xffcccccc)),
      titleMedium: TextStyle(color: Color(0xffdddddd)),
      titleSmall: TextStyle(color: Color(0xffeeeeee)),
    );

    expect(ThemeDecoder.decodeTextTheme(entry), entry);

    final encoded = ThemeEncoder.encodeTextTheme(entry);
    final decoded = ThemeDecoder.decodeTextTheme(encoded);

    expect(encoded, {
      'bodyLarge': {'color': '#ff111111', 'inherit': true},
      'bodyMedium': {'color': '#ff222222', 'inherit': true},
      'bodySmall': {'color': '#ff333333', 'inherit': true},
      'displayLarge': {'color': '#ff444444', 'inherit': true},
      'displayMedium': {'color': '#ff555555', 'inherit': true},
      'displaySmall': {'color': '#ff666666', 'inherit': true},
      'headlineLarge': {'color': '#ff777777', 'inherit': true},
      'headlineMedium': {'color': '#ff888888', 'inherit': true},
      'headlineSmall': {'color': '#ff999999', 'inherit': true},
      'labelLarge': {'color': '#ff000000', 'inherit': true},
      'labelMedium': {'color': '#ffaaaaaa', 'inherit': true},
      'labelSmall': {'color': '#ffbbbbbb', 'inherit': true},
      'titleLarge': {'color': '#ffcccccc', 'inherit': true},
      'titleMedium': {'color': '#ffdddddd', 'inherit': true},
      'titleSmall': {'color': '#ffeeeeee', 'inherit': true},
    });

    expect(decoded, entry);
  });

  test('TextWidthBasis', () {
    expect(ThemeDecoder.decodeTextWidthBasis(null), null);
    expect(ThemeEncoder.encodeTextWidthBasis(null), null);

    expect(
      ThemeDecoder.decodeTextWidthBasis(TextWidthBasis.longestLine),
      TextWidthBasis.longestLine,
    );

    expect(
      ThemeDecoder.decodeTextWidthBasis('longestLine'),
      TextWidthBasis.longestLine,
    );
    expect(ThemeDecoder.decodeTextWidthBasis('parent'), TextWidthBasis.parent);

    expect(
      ThemeEncoder.encodeTextWidthBasis(TextWidthBasis.longestLine),
      'longestLine',
    );
    expect(ThemeEncoder.encodeTextWidthBasis(TextWidthBasis.parent), 'parent');
  });

  test('ThemeData', () {
    expect(ThemeDecoder.decodeThemeData(null), null);
    expect(ThemeEncoder.encodeThemeData(null), null);

    final entry = ThemeData(
      appBarTheme: const AppBarTheme(color: Color(0xff444444)),
      applyElevationOverlayColor: true,
      bannerTheme: const MaterialBannerThemeData(
        backgroundColor: Color(0xff666666),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Color(0xff888888),
        shape: CircularNotchedRectangle(),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xff999999),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0xff000000),
      ),
      buttonTheme: const ButtonThemeData(buttonColor: Color(0xffbbbbbb)),
      canvasColor: const Color(0xffcccccc),
      cardColor: const Color(0xffdddddd),
      cardTheme: const CardTheme(color: Color(0xffeeeeee)),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(const Color(0xff123456)),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xff111111),
        brightness: Brightness.light,
        checkmarkColor: const Color(0xff222222),
        deleteIconColor: const Color(0xff333333),
        disabledColor: const Color(0xff444444),
        elevation: 2.0,
        labelPadding: const EdgeInsets.all(4.0),
        labelStyle: const TextStyle(color: Color(0xff555555)),
        padding: const EdgeInsets.all(8.0),
        pressElevation: 1.0,
        secondaryLabelStyle: const TextStyle(color: _kColor),
        secondarySelectedColor: const Color(0xff666666),
        selectedColor: _kColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        selectedShadowColor: const Color(0xff777777),
        shadowColor: const Color(0xff888888),
        showCheckmark: true,
      ),
      colorScheme: const ColorScheme.dark(),
      cupertinoOverrideTheme: const CupertinoThemeData(
        barBackgroundColor: Color(0xee111111),
      ),
      dataTableTheme: DataTableThemeData(
        columnSpacing: 1.0,
        dataRowColor: WidgetStateProperty.all(const Color(0xff555555)),
        dataRowMaxHeight: 1.0,
        dataRowMinHeight: 1.0,
        dataTextStyle: const TextStyle(),
        dividerThickness: 1.0,
        headingRowColor: WidgetStateProperty.all(const Color(0xff555555)),
        headingRowHeight: 1.0,
        headingTextStyle: const TextStyle(),
        horizontalMargin: 1.0,
      ),
      dialogTheme: const DialogTheme(backgroundColor: Color(0xee999999)),
      disabledColor: const Color(0xee000000),
      dividerColor: const Color(0xeeaaaaaa),
      dividerTheme: const DividerThemeData(color: Color(0xeebbbbbb)),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xff111111),
        elevation: 5,
        scrimColor: Color(0xff222222),
        shape: CircleBorder(side: BorderSide.none),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(const Color(0xff222222)),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(const Color(0xff222222)),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xeedddddd),
      ),
      focusColor: const Color(0xee333333),
      fontFamily: 'foo',
      highlightColor: const Color(0xdd111111),
      hintColor: const Color(0xdd222222),
      hoverColor: const Color(0xee222222),
      iconTheme: const IconThemeData(color: Color(0xdd333333)),
      indicatorColor: const Color(0xdd444444),
      inputDecorationTheme: const InputDecorationTheme(
        focusColor: Color(0xdd555555),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.fromLTRB(1, 2, 3, 4),
        dense: true,
        enableFeedback: false,
        horizontalTitleGap: 5,
        iconColor: Color(0xff111111),
        minLeadingWidth: 6,
        minVerticalPadding: 7,
        selectedColor: Color(0xff222222),
        selectedTileColor: Color(0xff333333),
        shape: ContinuousRectangleBorder(),
        style: ListTileStyle.drawer,
        textColor: Color(0xff444444),
        tileColor: Color(0xff555555),
      ),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Color(0xff111111),
        height: 12.0,
        indicatorColor: Color(0xff222222),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
      navigationRailTheme: const NavigationRailThemeData(
        backgroundColor: Color(0xdd666666),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(const Color(0xff222222)),
        ),
      ),
      platform: TargetPlatform.android,
      popupMenuTheme: const PopupMenuThemeData(color: Color(0xdd777777)),
      primaryColor: const Color(0xdd888888),
      primaryColorDark: const Color(0xdd999999),
      primaryColorLight: const Color(0xdd000000),
      primaryIconTheme: const IconThemeData(color: Color(0xddaaaaaa)),
      primarySwatch: const MaterialColor(0xcc000000, {
        50: Color(0xcc111111),
        100: Color(0xcc222222),
        200: Color(0xcc333333),
        300: Color(0xcc444444),
        400: Color(0xcc555555),
        500: Color(0xcc666666),
        600: Color(0xcc777777),
        700: Color(0xcc888888),
        800: Color(0xcc999999),
        900: Color(0xcc000000),
      }),
      primaryTextTheme: const TextTheme(
        bodyMedium: TextStyle(color: Color(0xccaaaaaa)),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.all(const Color(0xff123456)),
      ),
      scaffoldBackgroundColor: const Color(0xee666666),
      secondaryHeaderColor: const Color(0xccbbbbbb),
      shadowColor: const Color(0xcccccccc),
      sliderTheme: const SliderThemeData(
        activeTickMarkColor: Color(0xccdddddd),
      ),
      snackBarTheme: const SnackBarThemeData(
        actionTextColor: Color(0xcceeeeee),
      ),
      splashColor: const Color(0xee444444),
      splashFactory: InkSplash.splashFactory,
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(const Color(0xff123456)),
      ),
      tabBarTheme: const TabBarTheme(labelColor: Color(0xccffffff)),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(const Color(0xff222222)),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color(0xff222222),
        selectionColor: Color(0xff222222),
        selectionHandleColor: Color(0xff222222),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Color(0xee555555)),
      ),
      timePickerTheme: const TimePickerThemeData(
        backgroundColor: Color(0x11111111),
      ),
      toggleButtonsTheme: const ToggleButtonsThemeData(
        color: Color(0xbb222222),
      ),
      tooltipTheme: const TooltipThemeData(height: 19.0),
      typography: Typography.material2018(),
      unselectedWidgetColor: const Color(0xbb444444),
      useMaterial3: true,
      visualDensity: VisualDensity.comfortable,
    );

    expect(ThemeDecoder.decodeThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeThemeData(entry);
    final decoded = ThemeDecoder.decodeThemeData(encoded)!;

    final jsonMap = {
      'appBarTheme': {'backgroundColor': '#ff444444'},
      'applyElevationOverlayColor': true,
      'bannerTheme': {'backgroundColor': '#ff666666'},
      'bottomAppBarTheme': {
        'color': '#ff888888',
        'shape': 'circular',
        'surfaceTintColor': '#ff888888',
      },
      'bottomNavigationBarTheme': {'backgroundColor': '#ff999999'},
      'bottomSheetTheme': {'backgroundColor': '#ff000000'},
      'brightness': 'dark',
      'buttonTheme': {
        'alignedDropdown': false,
        'height': 36.0,
        'layoutBehavior': 'padded',
        'minWidth': 88.0,
        'padding': {'bottom': 0.0, 'left': 16.0, 'right': 16.0, 'top': 0.0},
        'shape': {
          'borderRadius': {
            'bottomLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
            'bottomRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
            'topLeft': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
            'topRight': {'type': 'elliptical', 'x': 2.0, 'y': 2.0},
            'type': 'only',
          },
          'side': {
            'color': '#ff000000',
            'strokeAlign': -1.0,
            'style': 'none',
            'width': 0.0,
          },
          'type': 'rounded',
        },
        'textTheme': 'normal',
      },
      'canvasColor': '#ffcccccc',
      'cardColor': '#ffdddddd',
      'cardTheme': {'color': '#ffeeeeee'},
      'checkboxTheme': {
        'fillColor': {
          'disabled': '#ff123456',
          'dragged': '#ff123456',
          'empty': '#ff123456',
          'error': '#ff123456',
          'focused': '#ff123456',
          'hovered': '#ff123456',
          'pressed': '#ff123456',
          'scrolledUnder': '#ff123456',
          'selected': '#ff123456',
        },
      },
      'chipTheme': {
        'backgroundColor': '#ff111111',
        'brightness': 'light',
        'checkmarkColor': '#ff222222',
        'deleteIconColor': '#ff333333',
        'disabledColor': '#ff444444',
        'elevation': 2.0,
        'labelPadding': {'bottom': 4.0, 'left': 4.0, 'right': 4.0, 'top': 4.0},
        'labelStyle': {'color': '#ff555555', 'inherit': true},
        'padding': {'bottom': 8.0, 'left': 8.0, 'right': 8.0, 'top': 8.0},
        'pressElevation': 1.0,
        'secondaryLabelStyle': {'color': '#00123456', 'inherit': true},
        'secondarySelectedColor': '#ff666666',
        'selectedColor': '#00123456',
        'shape': {
          'borderRadius': {
            'bottomLeft': {'type': 'elliptical', 'x': 10.0, 'y': 10.0},
            'bottomRight': {'type': 'elliptical', 'x': 10.0, 'y': 10.0},
            'topLeft': {'type': 'elliptical', 'x': 10.0, 'y': 10.0},
            'topRight': {'type': 'elliptical', 'x': 10.0, 'y': 10.0},
            'type': 'only',
          },
          'side': {
            'color': '#ff000000',
            'strokeAlign': -1.0,
            'style': 'none',
            'width': 0.0,
          },
          'type': 'rounded',
        },
        'selectedShadowColor': '#ff777777',
        'shadowColor': '#ff888888',
        'showCheckmark': true,
      },
      'colorScheme': {
        'brightness': 'dark',
        'error': '#ffcf6679',
        'errorContainer': '#ffcf6679',
        'inversePrimary': '#ff000000',
        'inverseSurface': '#ffffffff',
        'onError': '#ff000000',
        'onErrorContainer': '#ff000000',
        'onInverseSurface': '#ff121212',
        'onPrimaryFixed': '#ff000000',
        'onPrimary': '#ff000000',
        'onPrimaryContainer': '#ff000000',
        'onPrimaryFixedVariant': '#ff000000',
        'onSecondary': '#ff000000',
        'onSecondaryContainer': '#ff000000',
        'onSecondaryFixed': '#ff000000',
        'onSecondaryFixedVariant': '#ff000000',
        'onSurface': '#ffffffff',
        'onSurfaceVariant': '#ffffffff',
        'onTertiary': '#ff000000',
        'onTertiaryContainer': '#ff000000',
        'onTertiaryFixed': '#ff000000',
        'onTertiaryFixedVariant': '#ff000000',
        'outline': '#ffffffff',
        'outlineVariant': '#ffffffff',
        'primary': '#ffbb86fc',
        'primaryContainer': '#ffbb86fc',
        'primaryFixed': '#ffbb86fc',
        'primaryFixedDim': '#ffbb86fc',
        'scrim': '#ff000000',
        'secondary': '#ff03dac6',
        'secondaryContainer': '#ff03dac6',
        'surfaceBright': '#ff121212',
        'surfaceContainer': '#ff121212',
        'surfaceContainerHigh': '#ff121212',
        'surfaceContainerHighest': '#ff121212',
        'secondaryFixed': '#ff03dac6',
        'secondaryFixedDim': '#ff03dac6',
        'shadow': '#ff000000',
        'surface': '#ff121212',
        'surfaceContainerLow': '#ff121212',
        'surfaceContainerLowest': '#ff121212',
        'surfaceDim': '#ff121212',
        'tertiary': '#ff03dac6',
        'tertiaryContainer': '#ff03dac6',
        'tertiaryFixed': '#ff03dac6',
        'tertiaryFixedDim': '#ff03dac6',
      },
      'cupertinoOverrideTheme': {'barBackgroundColor': '#ee111111'},
      'dataTableTheme': {
        'columnSpacing': 1.0,
        'dataRowColor': {
          'disabled': '#ff555555',
          'dragged': '#ff555555',
          'empty': '#ff555555',
          'error': '#ff555555',
          'focused': '#ff555555',
          'hovered': '#ff555555',
          'pressed': '#ff555555',
          'scrolledUnder': '#ff555555',
          'selected': '#ff555555',
        },
        'dataRowMaxHeight': 1.0,
        'dataRowMinHeight': 1.0,
        'dataTextStyle': {'inherit': true},
        'dividerThickness': 1.0,
        'headingRowColor': {
          'disabled': '#ff555555',
          'dragged': '#ff555555',
          'empty': '#ff555555',
          'error': '#ff555555',
          'focused': '#ff555555',
          'hovered': '#ff555555',
          'pressed': '#ff555555',
          'scrolledUnder': '#ff555555',
          'selected': '#ff555555',
        },
        'headingRowHeight': 1.0,
        'headingTextStyle': {'inherit': true},
        'horizontalMargin': 1.0,
      },
      'dialogTheme': {'backgroundColor': '#ee999999'},
      'disabledColor': '#ee000000',
      'dividerColor': '#eeaaaaaa',
      'dividerTheme': {'color': '#eebbbbbb'},
      'drawerTheme': {
        'backgroundColor': '#ff111111',
        'elevation': 5.0,
        'scrimColor': '#ff222222',
        'shape': {
          'side': {
            'color': '#ff000000',
            'strokeAlign': -1.0,
            'style': 'none',
            'width': 0.0,
          },
          'type': 'circle',
        },
      },
      'elevatedButtonTheme': {
        'style': {
          'backgroundColor': {
            'disabled': '#ff222222',
            'dragged': '#ff222222',
            'empty': '#ff222222',
            'error': '#ff222222',
            'focused': '#ff222222',
            'hovered': '#ff222222',
            'pressed': '#ff222222',
            'scrolledUnder': '#ff222222',
            'selected': '#ff222222',
          },
        },
      },
      'filledButtonTheme': {
        'style': {
          'backgroundColor': {
            'disabled': '#ff222222',
            'dragged': '#ff222222',
            'empty': '#ff222222',
            'error': '#ff222222',
            'focused': '#ff222222',
            'hovered': '#ff222222',
            'pressed': '#ff222222',
            'scrolledUnder': '#ff222222',
            'selected': '#ff222222',
          },
        },
      },
      'floatingActionButtonTheme': {'backgroundColor': '#eedddddd'},
      'focusColor': '#ee333333',
      'highlightColor': '#dd111111',
      'hintColor': '#dd222222',
      'hoverColor': '#ee222222',
      'iconTheme': {'color': '#dd333333'},
      'indicatorColor': '#dd444444',
      'inputDecorationTheme': {
        'alignLabelWithHint': false,
        'filled': false,
        'floatingLabelAlignment': 'start',
        'floatingLabelBehavior': 'auto',
        'focusColor': '#dd555555',
        'isCollapsed': false,
        'isDense': false,
      },
      'listTileTheme': {
        'contentPadding': {
          'bottom': 4.0,
          'left': 1.0,
          'right': 3.0,
          'top': 2.0,
        },
        'dense': true,
        'enableFeedback': false,
        'horizontalTitleGap': 5.0,
        'iconColor': '#ff111111',
        'minLeadingWidth': 6.0,
        'minVerticalPadding': 7.0,
        'selectedColor': '#ff222222',
        'selectedTileColor': '#ff333333',
        'shape': {
          'borderRadius': {
            'bottomLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
            'bottomRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
            'topLeft': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
            'topRight': {'type': 'elliptical', 'x': 0.0, 'y': 0.0},
            'type': 'only',
          },
          'side': {
            'color': '#ff000000',
            'strokeAlign': -1.0,
            'style': 'none',
            'width': 0.0,
          },
          'type': 'rectangle',
        },
        'style': 'drawer',
        'textColor': '#ff444444',
        'tileColor': '#ff555555',
      },
      'materialTapTargetSize': 'padded',
      'navigationBarTheme': {
        'backgroundColor': '#ff111111',
        'height': 12.0,
        'indicatorColor': '#ff222222',
        'labelBehavior': 'onlyShowSelected',
      },
      'navigationRailTheme': {'backgroundColor': '#dd666666'},
      'outlinedButtonTheme': {
        'style': {
          'backgroundColor': {
            'disabled': '#ff222222',
            'dragged': '#ff222222',
            'empty': '#ff222222',
            'error': '#ff222222',
            'focused': '#ff222222',
            'hovered': '#ff222222',
            'pressed': '#ff222222',
            'scrolledUnder': '#ff222222',
            'selected': '#ff222222',
          },
        },
      },
      'platform': 'android',
      'popupMenuTheme': {'color': '#dd777777'},
      'primaryColor': '#dd888888',
      'primaryColorDark': '#dd999999',
      'primaryColorLight': '#dd000000',
      'primaryIconTheme': {'color': '#ddaaaaaa'},
      'primaryTextTheme': {
        'bodyLarge': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'bodyMedium': {
          'color': '#ccaaaaaa',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'bodySmall': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'displayLarge': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'displayMedium': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'displaySmall': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'headlineLarge': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'headlineMedium': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'headlineSmall': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'labelLarge': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'labelMedium': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'labelSmall': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'titleLarge': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'titleMedium': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'titleSmall': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
      },
      'radioTheme': {
        'fillColor': {
          'disabled': '#ff123456',
          'dragged': '#ff123456',
          'empty': '#ff123456',
          'error': '#ff123456',
          'focused': '#ff123456',
          'hovered': '#ff123456',
          'pressed': '#ff123456',
          'scrolledUnder': '#ff123456',
          'selected': '#ff123456',
        },
      },
      'scaffoldBackgroundColor': '#ee666666',
      'secondaryHeaderColor': '#ccbbbbbb',
      'shadowColor': '#cccccccc',
      'sliderTheme': {'activeTickMarkColor': '#ccdddddd'},
      'snackBarTheme': {'actionTextColor': '#cceeeeee'},
      'splashColor': '#ee444444',
      'splashFactory': 'splash',
      'switchTheme': {
        'thumbColor': {
          'disabled': '#ff123456',
          'dragged': '#ff123456',
          'empty': '#ff123456',
          'error': '#ff123456',
          'focused': '#ff123456',
          'hovered': '#ff123456',
          'pressed': '#ff123456',
          'scrolledUnder': '#ff123456',
          'selected': '#ff123456',
        },
      },
      'tabBarTheme': {'labelColor': '#ccffffff'},
      'textButtonTheme': {
        'style': {
          'backgroundColor': {
            'disabled': '#ff222222',
            'dragged': '#ff222222',
            'empty': '#ff222222',
            'error': '#ff222222',
            'focused': '#ff222222',
            'hovered': '#ff222222',
            'pressed': '#ff222222',
            'scrolledUnder': '#ff222222',
            'selected': '#ff222222',
          },
        },
      },
      'textSelectionTheme': {
        'cursorColor': '#ff222222',
        'selectionColor': '#ff222222',
        'selectionHandleColor': '#ff222222',
      },
      'textTheme': {
        'bodyLarge': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'bodyMedium': {
          'color': '#ee555555',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'bodySmall': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'displayLarge': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'displayMedium': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'displaySmall': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'headlineLarge': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'headlineMedium': {
          'color': '#b3ffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'headlineSmall': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'labelLarge': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'labelMedium': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'labelSmall': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'titleLarge': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'titleMedium': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
        'titleSmall': {
          'color': '#ffffffff',
          'decoration': 'none',
          'fontFamily': 'foo',
          'inherit': true,
        },
      },
      'toggleButtonsTheme': {'color': '#bb222222'},
      'tooltipTheme': {'height': 19.0},
      'typography': {
        'black': {
          'bodyLarge': {
            'color': '#dd000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'bodyMedium': {
            'color': '#dd000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'bodySmall': {
            'color': '#8a000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'displayLarge': {
            'color': '#8a000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'displayMedium': {
            'color': '#8a000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'displaySmall': {
            'color': '#8a000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'headlineLarge': {
            'color': '#8a000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'headlineMedium': {
            'color': '#8a000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'headlineSmall': {
            'color': '#dd000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'labelLarge': {
            'color': '#dd000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'labelMedium': {
            'color': '#ff000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'labelSmall': {
            'color': '#ff000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'titleLarge': {
            'color': '#dd000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'titleMedium': {
            'color': '#dd000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'titleSmall': {
            'color': '#ff000000',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
        },
        'dense': {
          'bodyLarge': {
            'fontSize': 17.0,
            'fontWeight': 'w400',
            'inherit': false,
            'textBaseline': 'ideographic',
          },
          'bodyMedium': {
            'fontSize': 15.0,
            'fontWeight': 'w400',
            'inherit': false,
            'textBaseline': 'ideographic',
          },
          'bodySmall': {
            'fontSize': 13.0,
            'fontWeight': 'w400',
            'inherit': false,
            'textBaseline': 'ideographic',
          },
          'displayLarge': {
            'fontSize': 96.0,
            'fontWeight': 'w100',
            'inherit': false,
            'textBaseline': 'ideographic',
          },
          'displayMedium': {
            'fontSize': 60.0,
            'fontWeight': 'w100',
            'inherit': false,
            'textBaseline': 'ideographic',
          },
          'displaySmall': {
            'fontSize': 48.0,
            'fontWeight': 'w400',
            'inherit': false,
            'textBaseline': 'ideographic',
          },
          'headlineLarge': {
            'fontSize': 40.0,
            'fontWeight': 'w400',
            'inherit': false,
            'textBaseline': 'ideographic',
          },
          'headlineMedium': {
            'fontSize': 34.0,
            'fontWeight': 'w400',
            'inherit': false,
            'textBaseline': 'ideographic',
          },
          'headlineSmall': {
            'fontSize': 24.0,
            'fontWeight': 'w400',
            'inherit': false,
            'textBaseline': 'ideographic',
          },
          'labelLarge': {
            'fontSize': 15.0,
            'fontWeight': 'w500',
            'inherit': false,
            'textBaseline': 'ideographic',
          },
          'labelMedium': {
            'fontSize': 12.0,
            'fontWeight': 'w400',
            'inherit': false,
            'textBaseline': 'ideographic',
          },
          'labelSmall': {
            'fontSize': 11.0,
            'fontWeight': 'w400',
            'inherit': false,
            'textBaseline': 'ideographic',
          },
          'titleLarge': {
            'fontSize': 21.0,
            'fontWeight': 'w500',
            'inherit': false,
            'textBaseline': 'ideographic',
          },
          'titleMedium': {
            'fontSize': 17.0,
            'fontWeight': 'w400',
            'inherit': false,
            'textBaseline': 'ideographic',
          },
          'titleSmall': {
            'fontSize': 15.0,
            'fontWeight': 'w500',
            'inherit': false,
            'textBaseline': 'ideographic',
          },
        },
        'englishLike': {
          'bodyLarge': {
            'fontSize': 16.0,
            'fontWeight': 'w400',
            'inherit': false,
            'letterSpacing': 0.5,
            'textBaseline': 'alphabetic',
          },
          'bodyMedium': {
            'fontSize': 14.0,
            'fontWeight': 'w400',
            'inherit': false,
            'letterSpacing': 0.25,
            'textBaseline': 'alphabetic',
          },
          'bodySmall': {
            'fontSize': 12.0,
            'fontWeight': 'w400',
            'inherit': false,
            'letterSpacing': 0.4,
            'textBaseline': 'alphabetic',
          },
          'displayLarge': {
            'fontSize': 96.0,
            'fontWeight': 'w300',
            'inherit': false,
            'letterSpacing': -1.5,
            'textBaseline': 'alphabetic',
          },
          'displayMedium': {
            'fontSize': 60.0,
            'fontWeight': 'w300',
            'inherit': false,
            'letterSpacing': -0.5,
            'textBaseline': 'alphabetic',
          },
          'displaySmall': {
            'fontSize': 48.0,
            'fontWeight': 'w400',
            'inherit': false,
            'letterSpacing': 0.0,
            'textBaseline': 'alphabetic',
          },
          'headlineLarge': {
            'fontSize': 40.0,
            'fontWeight': 'w400',
            'inherit': false,
            'letterSpacing': 0.25,
            'textBaseline': 'alphabetic',
          },
          'headlineMedium': {
            'fontSize': 34.0,
            'fontWeight': 'w400',
            'inherit': false,
            'letterSpacing': 0.25,
            'textBaseline': 'alphabetic',
          },
          'headlineSmall': {
            'fontSize': 24.0,
            'fontWeight': 'w400',
            'inherit': false,
            'letterSpacing': 0.0,
            'textBaseline': 'alphabetic',
          },
          'labelLarge': {
            'fontSize': 14.0,
            'fontWeight': 'w500',
            'inherit': false,
            'letterSpacing': 1.25,
            'textBaseline': 'alphabetic',
          },
          'labelMedium': {
            'fontSize': 11.0,
            'fontWeight': 'w400',
            'inherit': false,
            'letterSpacing': 1.5,
            'textBaseline': 'alphabetic',
          },
          'labelSmall': {
            'fontSize': 10.0,
            'fontWeight': 'w400',
            'inherit': false,
            'letterSpacing': 1.5,
            'textBaseline': 'alphabetic',
          },
          'titleLarge': {
            'fontSize': 20.0,
            'fontWeight': 'w500',
            'inherit': false,
            'letterSpacing': 0.15,
            'textBaseline': 'alphabetic',
          },
          'titleMedium': {
            'fontSize': 16.0,
            'fontWeight': 'w400',
            'inherit': false,
            'letterSpacing': 0.15,
            'textBaseline': 'alphabetic',
          },
          'titleSmall': {
            'fontSize': 14.0,
            'fontWeight': 'w500',
            'inherit': false,
            'letterSpacing': 0.1,
            'textBaseline': 'alphabetic',
          },
        },
        'tall': {
          'bodyLarge': {
            'fontSize': 17.0,
            'fontWeight': 'w700',
            'inherit': false,
            'textBaseline': 'alphabetic',
          },
          'bodyMedium': {
            'fontSize': 15.0,
            'fontWeight': 'w400',
            'inherit': false,
            'textBaseline': 'alphabetic',
          },
          'bodySmall': {
            'fontSize': 13.0,
            'fontWeight': 'w400',
            'inherit': false,
            'textBaseline': 'alphabetic',
          },
          'displayLarge': {
            'fontSize': 96.0,
            'fontWeight': 'w400',
            'inherit': false,
            'textBaseline': 'alphabetic',
          },
          'displayMedium': {
            'fontSize': 60.0,
            'fontWeight': 'w400',
            'inherit': false,
            'textBaseline': 'alphabetic',
          },
          'displaySmall': {
            'fontSize': 48.0,
            'fontWeight': 'w400',
            'inherit': false,
            'textBaseline': 'alphabetic',
          },
          'headlineLarge': {
            'fontSize': 40.0,
            'fontWeight': 'w400',
            'inherit': false,
            'textBaseline': 'alphabetic',
          },
          'headlineMedium': {
            'fontSize': 34.0,
            'fontWeight': 'w400',
            'inherit': false,
            'textBaseline': 'alphabetic',
          },
          'headlineSmall': {
            'fontSize': 24.0,
            'fontWeight': 'w400',
            'inherit': false,
            'textBaseline': 'alphabetic',
          },
          'labelLarge': {
            'fontSize': 15.0,
            'fontWeight': 'w700',
            'inherit': false,
            'textBaseline': 'alphabetic',
          },
          'labelMedium': {
            'fontSize': 12.0,
            'fontWeight': 'w400',
            'inherit': false,
            'textBaseline': 'alphabetic',
          },
          'labelSmall': {
            'fontSize': 11.0,
            'fontWeight': 'w400',
            'inherit': false,
            'textBaseline': 'alphabetic',
          },
          'titleLarge': {
            'fontSize': 21.0,
            'fontWeight': 'w700',
            'inherit': false,
            'textBaseline': 'alphabetic',
          },
          'titleMedium': {
            'fontSize': 17.0,
            'fontWeight': 'w400',
            'inherit': false,
            'textBaseline': 'alphabetic',
          },
          'titleSmall': {
            'fontSize': 15.0,
            'fontWeight': 'w500',
            'inherit': false,
            'textBaseline': 'alphabetic',
          },
        },
        'white': {
          'bodyLarge': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'bodyMedium': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'bodySmall': {
            'color': '#b3ffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'displayLarge': {
            'color': '#b3ffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'displayMedium': {
            'color': '#b3ffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'displaySmall': {
            'color': '#b3ffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'headlineLarge': {
            'color': '#b3ffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'headlineMedium': {
            'color': '#b3ffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'headlineSmall': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'labelLarge': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'labelMedium': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'labelSmall': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'titleLarge': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'titleMedium': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
          'titleSmall': {
            'color': '#ffffffff',
            'decoration': 'none',
            'fontFamily': 'Roboto',
            'inherit': true,
          },
        },
      },
      'unselectedWidgetColor': '#bb444444',
      'useMaterial3': true,
      'visualDensity': 'comfortable',
    };

    expect(encoded, jsonMap);

    final reencoded = ThemeEncoder.encodeThemeData(decoded);
    expect(reencoded, jsonMap);
  });

  test('TileMode', () {
    expect(ThemeDecoder.decodeTileMode(null), null);
    expect(ThemeEncoder.encodeTileMode(null), null);

    expect(ThemeDecoder.decodeTileMode(TileMode.clamp), TileMode.clamp);

    expect(ThemeDecoder.decodeTileMode('clamp'), TileMode.clamp);
    expect(ThemeDecoder.decodeTileMode('mirror'), TileMode.mirror);
    expect(ThemeDecoder.decodeTileMode('repeated'), TileMode.repeated);

    expect(ThemeEncoder.encodeTileMode(TileMode.clamp), 'clamp');
    expect(ThemeEncoder.encodeTileMode(TileMode.mirror), 'mirror');
    expect(ThemeEncoder.encodeTileMode(TileMode.repeated), 'repeated');
  });

  test('TimePickerThemeData', () {
    expect(ThemeDecoder.decodeTimePickerThemeData(null), null);
    expect(ThemeEncoder.encodeTimePickerThemeData(null), null);

    final entry = TimePickerThemeData(
      backgroundColor: const Color(0xff000001),
      dayPeriodBorderSide: const BorderSide(
        color: Color(0xff000002),
        style: BorderStyle.solid,
        width: 1.0,
      ),
      dayPeriodColor: WidgetStateColor.resolveWith(
        (_) => const Color(0xff000003),
      ),
      dayPeriodShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      dayPeriodTextColor: const Color(0xff000004),
      dayPeriodTextStyle: const TextStyle(fontSize: 1.0),
      dialBackgroundColor: const Color(0xff000005),
      dialHandColor: const Color(0xff000006),
      dialTextColor: const Color(0xff000007),
      entryModeIconColor: const Color(0xff000008),
      helpTextStyle: const TextStyle(fontSize: 2.0),
      hourMinuteColor: const Color(0xff000009),
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      hourMinuteTextColor: const Color(0xff000010),
      hourMinuteTextStyle: const TextStyle(fontSize: 3.0),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Color(0xff000011),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
    );

    expect(ThemeDecoder.decodeTimePickerThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeTimePickerThemeData(entry);
    final decoded = ThemeDecoder.decodeTimePickerThemeData(encoded);

    expect(encoded, {
      'backgroundColor': '#ff000001',
      'dayPeriodBorderSide': {
        'color': '#ff000002',
        'strokeAlign': -1.0,
        'style': 'solid',
        'width': 1.0,
      },
      'dayPeriodColor': '#ff000003',
      'dayPeriodShape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'bottomRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'topLeft': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'topRight': {'type': 'elliptical', 'x': 4.0, 'y': 4.0},
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded',
      },
      'dayPeriodTextColor': '#ff000004',
      'dayPeriodTextStyle': {'fontSize': 1.0, 'inherit': true},
      'dialBackgroundColor': '#ff000005',
      'dialHandColor': '#ff000006',
      'dialTextColor': '#ff000007',
      'entryModeIconColor': '#ff000008',
      'helpTextStyle': {'fontSize': 2.0, 'inherit': true},
      'hourMinuteColor': '#ff000009',
      'hourMinuteShape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 5.0, 'y': 5.0},
          'bottomRight': {'type': 'elliptical', 'x': 5.0, 'y': 5.0},
          'topLeft': {'type': 'elliptical', 'x': 5.0, 'y': 5.0},
          'topRight': {'type': 'elliptical', 'x': 5.0, 'y': 5.0},
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded',
      },
      'hourMinuteTextColor': '#ff000010',
      'hourMinuteTextStyle': {'fontSize': 3.0, 'inherit': true},
      'inputDecorationTheme': {
        'alignLabelWithHint': false,
        'fillColor': '#ff000011',
        'filled': false,
        'floatingLabelAlignment': 'start',
        'floatingLabelBehavior': 'auto',
        'isCollapsed': false,
        'isDense': false,
      },
      'shape': {
        'borderRadius': {
          'bottomLeft': {'type': 'elliptical', 'x': 6.0, 'y': 6.0},
          'bottomRight': {'type': 'elliptical', 'x': 6.0, 'y': 6.0},
          'topLeft': {'type': 'elliptical', 'x': 6.0, 'y': 6.0},
          'topRight': {'type': 'elliptical', 'x': 6.0, 'y': 6.0},
          'type': 'only',
        },
        'side': {
          'color': '#ff000000',
          'strokeAlign': -1.0,
          'style': 'none',
          'width': 0.0,
        },
        'type': 'rounded',
      },
    });

    expect(decoded, entry);
  });

  test('ToggleButtonsThemeData', () {
    expect(ThemeDecoder.decodeToggleButtonsThemeData(null), null);
    expect(ThemeEncoder.encodeToggleButtonsThemeData(null), null);

    final entry = ToggleButtonsThemeData(
      borderColor: const Color(0xff111111),
      borderRadius: BorderRadius.circular(1.0),
      borderWidth: 2.0,
      color: const Color(0xff222222),
      constraints: const BoxConstraints(
        maxHeight: 30.0,
        maxWidth: 40.0,
        minHeight: 5.0,
        minWidth: 6.0,
      ),
      disabledBorderColor: const Color(0xff333333),
      disabledColor: const Color(0xff444444),
      fillColor: const Color(0xff555555),
      focusColor: const Color(0xff666666),
      highlightColor: const Color(0xff777777),
      hoverColor: const Color(0xff888888),
      selectedBorderColor: const Color(0xff999999),
      selectedColor: const Color(0xff000000),
      splashColor: const Color(0xffaaaaaa),
      textStyle: const TextStyle(color: Color(0xffbbbbbb)),
    );

    expect(ThemeDecoder.decodeToggleButtonsThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeToggleButtonsThemeData(entry);
    final decoded = ThemeDecoder.decodeToggleButtonsThemeData(encoded);

    expect(encoded, {
      'borderColor': '#ff111111',
      'borderRadius': {
        'bottomLeft': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'bottomRight': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'topLeft': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'topRight': {'type': 'elliptical', 'x': 1.0, 'y': 1.0},
        'type': 'only',
      },
      'borderWidth': 2.0,
      'color': '#ff222222',
      'constraints': {
        'maxHeight': 30.0,
        'maxWidth': 40.0,
        'minHeight': 5.0,
        'minWidth': 6.0,
      },
      'disabledBorderColor': '#ff333333',
      'disabledColor': '#ff444444',
      'fillColor': '#ff555555',
      'focusColor': '#ff666666',
      'highlightColor': '#ff777777',
      'hoverColor': '#ff888888',
      'selectedBorderColor': '#ff999999',
      'selectedColor': '#ff000000',
      'splashColor': '#ffaaaaaa',
      'textStyle': {'color': '#ffbbbbbb', 'inherit': true},
    });

    expect(decoded, entry);
  });

  test('TooltipThemeData', () {
    expect(ThemeDecoder.decodeTooltipThemeData(null), null);
    expect(ThemeEncoder.encodeTooltipThemeData(null), null);

    const entry = TooltipThemeData(
      enableFeedback: true,
      excludeFromSemantics: true,
      exitDuration: Duration(milliseconds: 100),
      height: 1.0,
      margin: EdgeInsets.all(2.0),
      padding: EdgeInsets.all(3.0),
      preferBelow: true,
      showDuration: Duration(milliseconds: 4),
      textAlign: TextAlign.center,
      textStyle: _kTextStyle,
      triggerMode: TooltipTriggerMode.longPress,
      verticalOffset: 5.0,
      waitDuration: Duration(milliseconds: 6),
    );

    expect(ThemeDecoder.decodeTooltipThemeData(entry), entry);

    final encoded = ThemeEncoder.encodeTooltipThemeData(entry);
    final decoded = ThemeDecoder.decodeTooltipThemeData(encoded);

    expect(encoded, {
      'enableFeedback': true,
      'excludeFromSemantics': true,
      'exitDuration': 100,
      'height': 1.0,
      'margin': {'bottom': 2.0, 'left': 2.0, 'right': 2.0, 'top': 2.0},
      'padding': {'bottom': 3.0, 'left': 3.0, 'right': 3.0, 'top': 3.0},
      'preferBelow': true,
      'showDuration': 4,
      'textAlign': 'center',
      'textStyle': {'color': '#00123456', 'inherit': true},
      'triggerMode': 'longPress',
      'verticalOffset': 5.0,
      'waitDuration': 6,
    });

    expect(decoded, entry);
  });

  test('TooltipTriggerMode', () {
    expect(ThemeDecoder.decodeTooltipTriggerMode(null), null);
    expect(ThemeEncoder.encodeTooltipTriggerMode(null), null);

    expect(
      ThemeDecoder.decodeTooltipTriggerMode(TooltipTriggerMode.longPress),
      TooltipTriggerMode.longPress,
    );

    expect(
      ThemeDecoder.decodeTooltipTriggerMode('longPress'),
      TooltipTriggerMode.longPress,
    );
    expect(
      ThemeDecoder.decodeTooltipTriggerMode('manual'),
      TooltipTriggerMode.manual,
    );
    expect(
      ThemeDecoder.decodeTooltipTriggerMode('tap'),
      TooltipTriggerMode.tap,
    );

    expect(
      ThemeEncoder.encodeTooltipTriggerMode(TooltipTriggerMode.longPress),
      'longPress',
    );
    expect(
      ThemeEncoder.encodeTooltipTriggerMode(TooltipTriggerMode.manual),
      'manual',
    );
    expect(
      ThemeEncoder.encodeTooltipTriggerMode(TooltipTriggerMode.tap),
      'tap',
    );
  });

  test('Typography', () {
    expect(ThemeDecoder.decodeTypography(null), null);
    expect(ThemeEncoder.encodeTypography(null), null);

    final entry = Typography.material2018(
      black: const TextTheme(bodyLarge: TextStyle(color: Color(0xff111111))),
      dense: const TextTheme(bodyLarge: TextStyle(color: Color(0xff222222))),
      englishLike: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xff333333)),
      ),
      tall: const TextTheme(bodyLarge: TextStyle(color: Color(0xff444444))),
      white: const TextTheme(bodyLarge: TextStyle(color: Color(0xff555555))),
    );

    expect(ThemeDecoder.decodeTypography(entry), entry);

    final encoded = ThemeEncoder.encodeTypography(entry);
    final decoded = ThemeDecoder.decodeTypography(encoded);

    expect(encoded, {
      'black': {
        'bodyLarge': {'color': '#ff111111', 'inherit': true},
      },
      'dense': {
        'bodyLarge': {'color': '#ff222222', 'inherit': true},
      },
      'englishLike': {
        'bodyLarge': {'color': '#ff333333', 'inherit': true},
      },
      'tall': {
        'bodyLarge': {'color': '#ff444444', 'inherit': true},
      },
      'white': {
        'bodyLarge': {'color': '#ff555555', 'inherit': true},
      },
    });

    expect(decoded, entry);
  });
  test('VerticalDirection', () {
    expect(ThemeDecoder.decodeVerticalDirection(null), null);
    expect(ThemeEncoder.encodeVerticalDirection(null), null);

    expect(
      ThemeDecoder.decodeVerticalDirection(VerticalDirection.down),
      VerticalDirection.down,
    );

    expect(
      ThemeDecoder.decodeVerticalDirection('down'),
      VerticalDirection.down,
    );
    expect(ThemeDecoder.decodeVerticalDirection('up'), VerticalDirection.up);

    expect(
      ThemeEncoder.encodeVerticalDirection(VerticalDirection.down),
      'down',
    );
    expect(ThemeEncoder.encodeVerticalDirection(VerticalDirection.up), 'up');
  });

  test('VisualDensity', () {
    expect(ThemeDecoder.decodeVisualDensity(null), null);
    expect(ThemeEncoder.encodeVisualDensity(null), null);

    expect(
      ThemeDecoder.decodeVisualDensity(VisualDensity.adaptivePlatformDensity),
      VisualDensity.adaptivePlatformDensity,
    );

    expect(
      ThemeDecoder.decodeVisualDensity('adaptivePlatformDensity'),
      VisualDensity.adaptivePlatformDensity,
    );
    expect(
      ThemeDecoder.decodeVisualDensity('comfortable'),
      VisualDensity.comfortable,
    );
    expect(ThemeDecoder.decodeVisualDensity('compact'), VisualDensity.compact);
    expect(
      ThemeDecoder.decodeVisualDensity('standard'),
      VisualDensity.standard,
    );

    expect(
      ThemeEncoder.encodeVisualDensity(VisualDensity.comfortable),
      'comfortable',
    );
    expect(ThemeEncoder.encodeVisualDensity(VisualDensity.compact), 'compact');
    expect(
      ThemeEncoder.encodeVisualDensity(VisualDensity.standard),
      'standard',
    );
  });

  test('WidgetStateColor', () {
    expect(ThemeDecoder.decodeWidgetStateColor(null), null);
    expect(ThemeEncoder.encodeWidgetStateColor(null), null);

    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    final colors = {
      'disabled': '#ff111111',
      'dragged': '#ff222222',
      'error': '#ff333333',
      'focused': '#ff444444',
      'hovered': '#ff555555',
      'pressed': '#ff666666',
      'scrolledUnder': '#ff888888',
      'selected': '#ff777777',
      'empty': '#00000000',
    };

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final colorStr = colors[stateKey];
      final color = ThemeDecoder.decodeColor(colorStr);

      var decoded = ThemeDecoder.decodeWidgetStateColor(color);
      expect(decoded!.resolve({state}), color);

      decoded = ThemeDecoder.decodeWidgetStateColor(colorStr);
      expect(decoded!.resolve({state}), color);

      final encoded = ThemeEncoder.encodeWidgetStateColor(decoded);
      expect(encoded![stateKey], colorStr);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final colorStr = colors[stateKey];
      final color = ThemeDecoder.decodeColor(colorStr);
      final encodedColor = ThemeEncoder.encodeColor(color);

      final decoded = ThemeDecoder.decodeWidgetStateColor(encodedColor);

      expect(decoded!.resolve({state}), color);

      final encoded = ThemeEncoder.encodeWidgetStateColor(decoded);

      expect(encoded![stateKey], colorStr);
    }

    /// Test if pressed takes precedence over hovered
    final materialColor = ThemeDecoder.decodeWidgetStateColor(colors);
    final color = materialColor?.resolve({states['pressed']!});
    expect(ThemeEncoder.encodeColor(color), colors['pressed']);
  });

  test('WidgetStatePropertyBool', () {
    expect(ThemeDecoder.decodeWidgetStatePropertyBool(null), null);
    expect(ThemeEncoder.encodeWidgetStatePropertyBool(null), null);

    final stateMap = {
      WidgetState.disabled: 'disabled',
      WidgetState.dragged: 'dragged',
      WidgetState.error: 'error',
      WidgetState.focused: 'focused',
      WidgetState.hovered: 'hovered',
      WidgetState.pressed: 'pressed',
      WidgetState.scrolledUnder: 'scrolledUnder',
      WidgetState.selected: 'selected',
    };

    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    final values = {
      'disabled': true,
      'dragged': true,
      'error': true,
      'focused': true,
      'hovered': false,
      'pressed': true,
      'scrolledUnder': false,
      'selected': false,
    };

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final value = values[stateKey];

      var decoded = ThemeDecoder.decodeWidgetStatePropertyBool(value);
      expect(decoded?.resolve({state}), value);

      decoded = ThemeDecoder.decodeWidgetStatePropertyBool(value.toString());
      expect(decoded?.resolve({state}), value);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyBool(decoded);
      expect(encoded![stateKey], value);
    }

    bool? func(Set<WidgetState> states) =>
        states.isEmpty ? null : values[stateMap[states.first]!];

    final prop = WidgetStateProperty.resolveWith(func);
    final decoded = ThemeDecoder.decodeWidgetStatePropertyBool(prop);
    for (var entry in states.entries) {
      final value = values[stateMap[entry.value]!];

      expect(decoded!.resolve({entry.value}), value);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyBool(decoded);

      expect(encoded?[entry.key], value);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final value = values[stateKey];

      final decoded = ThemeDecoder.decodeWidgetStatePropertyBool(value);

      expect(decoded!.resolve({state}), value);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyBool(decoded);

      expect(encoded![stateKey], value);
    }
  });

  test('WidgetStatePropertyBorderSide', () {
    expect(ThemeDecoder.decodeWidgetStatePropertyBorderSide(null), null);
    expect(ThemeEncoder.encodeWidgetStatePropertyBorderSide(null), null);

    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    var count = 1.0;
    final sides = <WidgetState, BorderSide>{};

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final side = BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: ++count,
      );
      sides[state] = side;

      final decoded = ThemeDecoder.decodeWidgetStatePropertyBorderSide(side);

      expect(decoded!.resolve({state}), side);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyBorderSide(decoded);

      expect(encoded![stateKey]['width'], side.width);
    }

    BorderSide? func(Set<WidgetState> states) =>
        states.isEmpty ? null : sides[states.first];

    final prop = WidgetStateProperty.resolveWith(func);
    final decoded = ThemeDecoder.decodeWidgetStatePropertyBorderSide(prop);
    for (var entry in states.entries) {
      final side = sides[entry.value];

      expect(decoded!.resolve({entry.value}), side);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyBorderSide(decoded);

      expect(encoded![entry.key]['width'], side!.width);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final side = BorderSide(
        color: _kColor,
        style: BorderStyle.solid,
        width: ++count,
      );
      final encodedSide = ThemeEncoder.encodeBorderSide(side);

      final decoded = ThemeDecoder.decodeWidgetStatePropertyBorderSide(
        encodedSide,
      );

      expect(decoded!.resolve({state}), side);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyBorderSide(decoded);

      expect(encoded![stateKey]['width'], side.width);
    }
  });

  test('WidgetStatePropertyColor', () {
    expect(ThemeDecoder.decodeWidgetStatePropertyColor(null), null);
    expect(ThemeEncoder.encodeWidgetStatePropertyColor(null), null);

    final stateMap = {
      WidgetState.disabled: 'disabled',
      WidgetState.dragged: 'dragged',
      WidgetState.error: 'error',
      WidgetState.focused: 'focused',
      WidgetState.hovered: 'hovered',
      WidgetState.pressed: 'pressed',
      WidgetState.scrolledUnder: 'scrolledUnder',
      WidgetState.selected: 'selected',
    };
    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    final colors = {
      'disabled': '#ff111111',
      'dragged': '#ff222222',
      'error': '#ff333333',
      'focused': '#ff444444',
      'hovered': '#ff555555',
      'pressed': '#ff666666',
      'scrolledUnder': '#ff888888',
      'selected': '#ff777777',
    };

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final colorStr = colors[stateKey];
      final color = ThemeDecoder.decodeColor(colorStr);

      var decoded = ThemeDecoder.decodeWidgetStatePropertyColor(color);
      expect(decoded!.resolve({state}), color);

      decoded = ThemeDecoder.decodeWidgetStatePropertyColor(colorStr);
      expect(decoded!.resolve({state}), color);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyColor(decoded);
      expect(encoded![stateKey], colorStr);
    }

    Color? func(Set<WidgetState> states) =>
        states.isEmpty
            ? null
            : ThemeDecoder.decodeColor(colors[stateMap[states.first]]);

    final prop = WidgetStateProperty.resolveWith(func);
    final decoded = ThemeDecoder.decodeWidgetStatePropertyColor(prop);
    for (var entry in states.entries) {
      final colorStr = colors[stateMap[entry.value]];
      final color = ThemeDecoder.decodeColor(colorStr);

      expect(decoded!.resolve({entry.value}), color);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyColor(decoded);

      expect(encoded?[entry.key], colorStr);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final colorStr = colors[stateKey];
      final color = ThemeDecoder.decodeColor(colorStr);
      final encodedColor = ThemeEncoder.encodeColor(color);

      final decoded = ThemeDecoder.decodeWidgetStatePropertyColor(encodedColor);

      expect(decoded!.resolve({state}), color);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyColor(decoded);

      expect(encoded![stateKey], colorStr);
    }

    /// Test if pressed takes precedence over hovered
    final materialColor = ThemeDecoder.decodeWidgetStatePropertyColor(colors);
    final color = materialColor?.resolve({
      states['hovered']!,
      states['pressed']!,
    });
    expect(ThemeEncoder.encodeColor(color), colors['pressed']);
  });

  test('WidgetStatePropertyDouble', () {
    expect(ThemeDecoder.decodeWidgetStatePropertyDouble(null), null);
    expect(ThemeEncoder.encodeWidgetStatePropertyDouble(null), null);
    final stateMap = {
      WidgetState.disabled: 'disabled',
      WidgetState.dragged: 'dragged',
      WidgetState.error: 'error',
      WidgetState.focused: 'focused',
      WidgetState.hovered: 'hovered',
      WidgetState.pressed: 'pressed',
      WidgetState.scrolledUnder: 'scrolledUnder',
      WidgetState.selected: 'selected',
    };

    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    final values = {
      'disabled': 1.0,
      'dragged': 2.0,
      'error': 3.0,
      'focused': 4.0,
      'hovered': 5.0,
      'pressed': 6.0,
      'scrolledUnder': 8.0,
      'selected': 7.0,
    };

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final value = values[stateKey];

      var decoded = ThemeDecoder.decodeWidgetStatePropertyDouble(value);
      expect(decoded!.resolve({state}), value);

      decoded = ThemeDecoder.decodeWidgetStatePropertyDouble(value.toString());
      expect(decoded!.resolve({state}), value);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyDouble(decoded);
      expect(encoded![stateKey], value);
    }

    double? func(Set<WidgetState> states) =>
        states.isEmpty ? null : values[stateMap[states.first]];

    final prop = WidgetStateProperty.resolveWith(func);
    final decoded = ThemeDecoder.decodeWidgetStatePropertyDouble(prop);
    for (var entry in states.entries) {
      final value = values[stateMap[entry.value]];

      expect(decoded!.resolve({entry.value}), value);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyDouble(decoded);

      expect(encoded?[entry.key], value);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final value = values[stateKey];

      final decoded = ThemeDecoder.decodeWidgetStatePropertyDouble(value);

      expect(decoded!.resolve({state}), value);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyDouble(decoded);

      expect(encoded![stateKey], value);
    }
  });

  test('WidgetStatePropertyEdgeInsetsGeometry', () {
    expect(
      ThemeDecoder.decodeWidgetStatePropertyEdgeInsetsGeometry(null),
      null,
    );
    expect(
      ThemeEncoder.encodeWidgetStatePropertyEdgeInsetsGeometry(null),
      null,
    );

    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    var count = 1.0;
    final sides = <WidgetState, EdgeInsetsGeometry>{};

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final side = EdgeInsets.all(++count);
      sides[state] = side;

      final decoded = ThemeDecoder.decodeWidgetStatePropertyEdgeInsetsGeometry(
        side,
      );

      expect(decoded!.resolve({state}), side);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyEdgeInsetsGeometry(
        decoded,
      );

      expect(encoded![stateKey]['bottom'], side.bottom);
    }

    EdgeInsetsGeometry? func(Set<WidgetState> states) =>
        states.isEmpty ? null : sides[states.first];

    final prop = WidgetStateProperty.resolveWith(func);
    final decoded = ThemeDecoder.decodeWidgetStatePropertyEdgeInsetsGeometry(
      prop,
    );
    for (var entry in states.entries) {
      final side = sides[entry.value];

      expect(decoded!.resolve({entry.value}), side);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyEdgeInsetsGeometry(
        decoded,
      );

      expect(encoded![entry.key]['bottom'], (side as EdgeInsets).bottom);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final side = EdgeInsets.all(++count);
      final encodedSide = ThemeEncoder.encodeEdgeInsetsGeometry(side);

      final decoded = ThemeDecoder.decodeWidgetStatePropertyEdgeInsetsGeometry(
        encodedSide,
      );

      expect(decoded!.resolve({state}), side);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyEdgeInsetsGeometry(
        decoded,
      );

      expect(encoded![stateKey]['bottom'], side.bottom);
    }

    final symmetricDecoded =
        ThemeDecoder.decodeWidgetStatePropertyEdgeInsetsGeometry([1, 2]);
    for (var state in states.values) {
      expect(
        symmetricDecoded!.resolve({state}),
        const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
      );
    }

    final ltrbDecoded =
        ThemeDecoder.decodeWidgetStatePropertyEdgeInsetsGeometry([1, 2, 3, 4]);
    for (var state in states.values) {
      expect(
        ltrbDecoded!.resolve({state}),
        const EdgeInsets.fromLTRB(1, 2, 3, 4),
      );
    }

    final allDecoded = ThemeDecoder.decodeWidgetStatePropertyEdgeInsetsGeometry(
      1,
    );
    for (var state in states.values) {
      expect(allDecoded!.resolve({state}), const EdgeInsets.all(1));
    }
  });

  test('WidgetStatePropertyIconThemeData', () {
    expect(ThemeDecoder.decodeWidgetStatePropertyIconThemeData(null), null);
    expect(ThemeEncoder.encodeWidgetStatePropertyIconThemeData(null), null);

    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    final icons = <WidgetState, IconThemeData>{};

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      const icon = IconThemeData(color: _kColor, opacity: 0.5, size: 12.0);
      icons[state] = icon;

      final decoded = ThemeDecoder.decodeWidgetStatePropertyIconThemeData(icon);

      expect(decoded!.resolve({state}), icon);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyIconThemeData(
        decoded,
      );

      expect(encoded![stateKey]['color'], _kColorStr);
    }

    IconThemeData? func(Set<WidgetState> states) =>
        states.isEmpty ? null : icons[states.first];

    final prop = WidgetStateProperty.resolveWith(func);
    final decoded = ThemeDecoder.decodeWidgetStatePropertyIconThemeData(prop);
    for (var entry in states.entries) {
      final icon = icons[entry.value];

      expect(decoded!.resolve({entry.value}), icon);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyIconThemeData(
        decoded,
      );

      expect(encoded![entry.key]['color'], _kColorStr);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final icon = icons[state];
      final encodedSide = ThemeEncoder.encodeIconThemeData(icon);

      final decoded = ThemeDecoder.decodeWidgetStatePropertyIconThemeData(
        encodedSide,
      );

      expect(decoded!.resolve({state}), icon);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyIconThemeData(
        decoded,
      );

      expect(encoded![stateKey]['color'], _kColorStr);
    }
  });

  test('WidgetStatePropertyMouseCursor', () {
    expect(ThemeDecoder.decodeWidgetStatePropertyColor(null), null);
    expect(ThemeEncoder.encodeWidgetStatePropertyColor(null), null);
    final stateMap = {
      WidgetState.disabled: 'disabled',
      WidgetState.dragged: 'dragged',
      WidgetState.error: 'error',
      WidgetState.focused: 'focused',
      WidgetState.hovered: 'hovered',
      WidgetState.pressed: 'pressed',
      WidgetState.scrolledUnder: 'scrolledUnder',
      WidgetState.selected: 'selected',
    };

    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    final cursors = {
      'disabled': {'type': 'system', 'cursor': 'alias'},
      'dragged': {'type': 'system', 'cursor': 'allScroll'},
      'error': {'type': 'system', 'cursor': 'basic'},
      'focused': {'type': 'system', 'cursor': 'cell'},
      'hovered': {'type': 'system', 'cursor': 'click'},
      'pressed': {'type': 'system', 'cursor': 'contextMenu'},
      'scrolledUnder': {'type': 'system', 'cursor': 'grab'},
      'selected': {'type': 'system', 'cursor': 'copy'},
    };

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final cursorStr = cursors[stateKey];
      final cursor = ThemeDecoder.decodeMouseCursor(cursorStr);

      var decoded = ThemeDecoder.decodeWidgetStatePropertyMouseCursor(cursor);
      expect(decoded!.resolve({state}), cursor);

      decoded = ThemeDecoder.decodeWidgetStatePropertyMouseCursor(cursorStr);
      expect(decoded!.resolve({state}), cursor);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyMouseCursor(
        decoded,
      );
      expect(encoded![stateKey], cursorStr);
    }

    MouseCursor? func(Set<WidgetState> states) =>
        states.isEmpty
            ? null
            : ThemeDecoder.decodeMouseCursor(cursors[stateMap[states.first]]);

    final prop = WidgetStateProperty.resolveWith(func);
    final decoded = ThemeDecoder.decodeWidgetStatePropertyMouseCursor(prop);
    for (var entry in states.entries) {
      final cursorStr = cursors[stateMap[entry.value]];
      final cursor = ThemeDecoder.decodeMouseCursor(cursorStr);

      expect(decoded!.resolve({entry.value}), cursor);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyMouseCursor(
        decoded,
      );

      expect(encoded?[entry.key], cursorStr);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final cursorStr = cursors[stateKey];
      final cursor = ThemeDecoder.decodeMouseCursor(cursorStr);
      final encodedCursor = ThemeEncoder.encodeMouseCursor(cursor);

      final decoded = ThemeDecoder.decodeWidgetStatePropertyMouseCursor(
        encodedCursor,
      );

      expect(decoded!.resolve({state}), cursor);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyMouseCursor(
        decoded,
      );

      expect(encoded![stateKey], cursorStr);
    }
  });

  test('WidgetStatePropertyOutlinedBorder', () {
    expect(ThemeDecoder.decodeWidgetStatePropertyOutlinedBorder(null), null);
    expect(ThemeEncoder.encodeWidgetStatePropertyOutlinedBorder(null), null);

    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    var count = 1.0;
    final sides = <WidgetState, OutlinedBorder>{};

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final side = RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: ++count,
        ),
      );
      sides[state] = side;

      final decoded = ThemeDecoder.decodeWidgetStatePropertyOutlinedBorder(
        side,
      );

      expect(decoded!.resolve({state}), side);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyOutlinedBorder(
        decoded,
      );

      expect(encoded![stateKey]['side']['width'], side.side.width);
    }

    OutlinedBorder? func(Set<WidgetState> states) =>
        states.isEmpty ? null : sides[states.first];

    final prop = WidgetStateProperty.resolveWith(func);
    final decoded = ThemeDecoder.decodeWidgetStatePropertyOutlinedBorder(prop);
    for (var entry in states.entries) {
      final side = sides[entry.value];

      expect(decoded!.resolve({entry.value}), side);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyOutlinedBorder(
        decoded,
      );

      expect(encoded![entry.key]['side']['width'], side!.side.width);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final side = sides[state];
      final encodedSide = ThemeEncoder.encodeOutlinedBorder(side);

      final decoded = ThemeDecoder.decodeWidgetStatePropertyOutlinedBorder(
        encodedSide,
      );

      expect(decoded!.resolve({state}), side);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyOutlinedBorder(
        decoded,
      );

      expect(encoded![stateKey]['side']['width'], side!.side.width);
    }
  });

  test('WidgetStatePropertySize', () {
    expect(ThemeDecoder.decodeWidgetStatePropertySize(null), null);
    expect(ThemeEncoder.encodeWidgetStatePropertySize(null), null);

    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    var count = 1.0;
    final sides = <WidgetState, Size>{};

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final side = Size(++count, ++count);
      sides[state] = side;

      final decoded = ThemeDecoder.decodeWidgetStatePropertySize(side);

      expect(decoded!.resolve({state}), side);

      final encoded = ThemeEncoder.encodeWidgetStatePropertySize(decoded);

      expect(encoded![stateKey]['width'], side.width);
    }

    Size? func(Set<WidgetState> states) =>
        states.isEmpty ? null : sides[states.first];

    final prop = WidgetStateProperty.resolveWith(func);
    final decoded = ThemeDecoder.decodeWidgetStatePropertySize(prop);
    for (var entry in states.entries) {
      final side = sides[entry.value];

      expect(decoded!.resolve({entry.value}), side);

      final encoded = ThemeEncoder.encodeWidgetStatePropertySize(decoded);

      expect(encoded![entry.key]['width'], side!.width);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final side = sides[state];
      final encodedSide = ThemeEncoder.encodeSize(side);

      final decoded = ThemeDecoder.decodeWidgetStatePropertySize(encodedSide);

      expect(decoded!.resolve({state}), side);

      final encoded = ThemeEncoder.encodeWidgetStatePropertySize(decoded);

      expect(encoded![stateKey]['width'], side!.width);
    }
  });

  test('WidgetStatePropertyTextStyle', () {
    expect(ThemeDecoder.decodeWidgetStatePropertyTextStyle(null), null);
    expect(ThemeEncoder.encodeWidgetStatePropertyTextStyle(null), null);

    final states = {
      'disabled': WidgetState.disabled,
      'dragged': WidgetState.dragged,
      'error': WidgetState.error,
      'focused': WidgetState.focused,
      'hovered': WidgetState.hovered,
      'pressed': WidgetState.pressed,
      'scrolledUnder': WidgetState.scrolledUnder,
      'selected': WidgetState.selected,
    };

    var count = 1.0;
    final sides = <WidgetState, TextStyle>{};

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final side = TextStyle(fontSize: ++count);
      sides[state] = side;

      final decoded = ThemeDecoder.decodeWidgetStatePropertyTextStyle(side);

      expect(decoded!.resolve({state}), side);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyTextStyle(decoded);

      expect(encoded![stateKey]['fontSize'], side.fontSize);
    }

    TextStyle? func(Set<WidgetState> states) =>
        states.isEmpty ? null : sides[states.first];

    final prop = WidgetStateProperty.resolveWith(func);
    final decoded = ThemeDecoder.decodeWidgetStatePropertyTextStyle(prop);
    for (var entry in states.entries) {
      final side = sides[entry.value];

      expect(decoded!.resolve({entry.value}), side);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyTextStyle(decoded);

      expect(encoded![entry.key]['fontSize'], side!.fontSize);
    }

    for (var entry in states.entries) {
      final stateKey = entry.key;
      final state = entry.value;

      final side = sides[state];
      final encodedSide = ThemeEncoder.encodeTextStyle(side);

      final decoded = ThemeDecoder.decodeWidgetStatePropertyTextStyle(
        encodedSide,
      );

      expect(decoded!.resolve({state}), side);

      final encoded = ThemeEncoder.encodeWidgetStatePropertyTextStyle(decoded);

      expect(encoded![stateKey]['fontSize'], side!.fontSize);
    }
  });

  test('WrapAlignment', () {
    expect(ThemeDecoder.decodeWrapAlignment(null), null);
    expect(ThemeEncoder.encodeWrapAlignment(null), null);

    expect(
      ThemeDecoder.decodeWrapAlignment(WrapAlignment.start),
      WrapAlignment.start,
    );

    expect(ThemeDecoder.decodeWrapAlignment('center'), WrapAlignment.center);
    expect(ThemeDecoder.decodeWrapAlignment('end'), WrapAlignment.end);
    expect(
      ThemeDecoder.decodeWrapAlignment('spaceAround'),
      WrapAlignment.spaceAround,
    );
    expect(
      ThemeDecoder.decodeWrapAlignment('spaceBetween'),
      WrapAlignment.spaceBetween,
    );
    expect(
      ThemeDecoder.decodeWrapAlignment('spaceEvenly'),
      WrapAlignment.spaceEvenly,
    );
    expect(ThemeDecoder.decodeWrapAlignment('start'), WrapAlignment.start);

    expect(ThemeEncoder.encodeWrapAlignment(WrapAlignment.center), 'center');
    expect(ThemeEncoder.encodeWrapAlignment(WrapAlignment.end), 'end');
    expect(
      ThemeEncoder.encodeWrapAlignment(WrapAlignment.spaceAround),
      'spaceAround',
    );
    expect(
      ThemeEncoder.encodeWrapAlignment(WrapAlignment.spaceBetween),
      'spaceBetween',
    );
    expect(
      ThemeEncoder.encodeWrapAlignment(WrapAlignment.spaceEvenly),
      'spaceEvenly',
    );
    expect(ThemeEncoder.encodeWrapAlignment(WrapAlignment.start), 'start');
  });

  test('WrapCrossAlignment', () {
    expect(ThemeDecoder.decodeWrapCrossAlignment(null), null);
    expect(ThemeEncoder.encodeWrapCrossAlignment(null), null);

    expect(
      ThemeDecoder.decodeWrapAlignment(WrapAlignment.start),
      WrapAlignment.start,
    );

    expect(
      ThemeDecoder.decodeWrapCrossAlignment('center'),
      WrapCrossAlignment.center,
    );
    expect(
      ThemeDecoder.decodeWrapCrossAlignment('end'),
      WrapCrossAlignment.end,
    );
    expect(
      ThemeDecoder.decodeWrapCrossAlignment('start'),
      WrapCrossAlignment.start,
    );

    expect(
      ThemeEncoder.encodeWrapCrossAlignment(WrapCrossAlignment.center),
      'center',
    );
    expect(
      ThemeEncoder.encodeWrapCrossAlignment(WrapCrossAlignment.end),
      'end',
    );
    expect(
      ThemeEncoder.encodeWrapCrossAlignment(WrapCrossAlignment.start),
      'start',
    );
  });
}

bool? _buttonStylesAreEqual(ButtonStyle? first, ButtonStyle? second) {
  bool? result;

  if (first.runtimeType != second.runtimeType) {
    result = false;
  } else if (first is! ButtonStyle) {
    result = false;
  } else if (second is ButtonStyle) {
    result =
        first.alignment == second.alignment &&
        first.animationDuration == second.animationDuration &&
        first.backgroundColor?.resolve({}) ==
            second.backgroundColor?.resolve({}) &&
        first.elevation?.resolve({}) == second.elevation?.resolve({}) &&
        first.enableFeedback == second.enableFeedback &&
        first.foregroundColor?.resolve({}) ==
            second.foregroundColor?.resolve({}) &&
        first.minimumSize?.resolve({}) == second.minimumSize?.resolve({}) &&
        first.mouseCursor?.resolve({}) == second.mouseCursor?.resolve({}) &&
        first.overlayColor?.resolve({}) == second.overlayColor?.resolve({}) &&
        first.padding?.resolve({}) == second.padding?.resolve({}) &&
        first.shadowColor?.resolve({}) == second.shadowColor?.resolve({}) &&
        first.shape?.resolve({}) == second.shape?.resolve({}) &&
        first.side?.resolve({}) == second.side?.resolve({}) &&
        first.tapTargetSize == second.tapTargetSize &&
        first.textStyle?.resolve({}) == second.textStyle?.resolve({}) &&
        first.visualDensity == second.visualDensity;
  }

  return result;
}

Map<String, dynamic> _materializeState(value) => {
  'disabled': value,
  'dragged': value,
  'empty': value,
  'error': value,
  'focused': value,
  'hovered': value,
  'pressed': value,
  'scrolledUnder': value,
  'selected': value,
};
