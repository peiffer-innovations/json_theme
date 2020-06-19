# json_theme

Library to encode and decode `ThemeData` and associated objects to / from JSON.  This is currently an early release of the library.

This provides two main classes.
* `ThemeDecoder` -- Provides functionality to decode theme related objects from JSON maps.
* `ThemeEncoder` -- Provides functionality to encode theme related objects into JSON maps.

**Note**: Encoding and decoding is _mostly_ bi-directionally compatible, but it is not fully bi-directionally compatible.  That's because there are some properties in theme objects that exist on the constructors, but are not re-exposed as properties and only exposed as dynamic calculated values.  Likewise, there are some dynamic classes (specifically custom `Shape`, `Slider`, and `Decoration` classes) that have no meaningful way of being encoded to JSON nor decoded from JSON.

The decoders will throw `assert` errors when unsupported properties are encountered.  The encoders will typically follow a "fail silently" policy and omit unsupported properties that the decoders cannot handle.  This means it's safe to pass an encoded JSON map to the decoders, but hand crafted JSON may encounter issues.


# Class Selection

As close as possible, the names used in the Dart APIs are replicated.  However, there are instances where the class is different for things like `Shape` objects, or there's an enum like `VerticalDirection`.  Those are all documented in this section.


**Alignment**

Plain string that must be one of:
* `bottomCenter` => `Alignment.bottomCenter`
* `bottomLeft` => `Alignment.bottomLeft`
* `bottomRight` => `Alignment.bottomRight`
* `center` => `Alignment.center`
* `centerLeft` => `Alignment.centerLeft`
* `centerRight` => `Alignment.centerRight`
* `topCenter` => `Alignment.topCenter`
* `topLeft` => `Alignment.topLeft`
* `topRight` => `Alignment.topRight`


**Axis**

Plain string that must be one of:
* `horizontal` => `Axis.horizontal`
* `vertical` => `Axis.vertical`


**BlendMode**

Plain string that must be one of:
* `clear` => `BlendMode.clear`
* `color` => `BlendMode.color`
* `colorBurn` => `BlendMode.colorBurn`
* `colorDodge` => `BlendMode.colorDodge`
* `darken` => `BlendMode.darken`
* `difference` => `BlendMode.difference`
* `dst` => `BlendMode.dst`
* `dstATop` => `BlendMode.dstATop`
* `dstIn` => `BlendMode.dstIn`
* `dstOut` => `BlendMode.dstOut`
* `dstOver` => `BlendMode.dstOver`
* `exclusion` => `BlendMode.exclusion`
* `hardLight` => `BlendMode.hardLight`
* `hue` => `BlendMode.hue`
* `lighten` => `BlendMode.lighten`
* `luminosity` => `BlendMode.luminosity`
* `modulate` => `BlendMode.modulate`
* `multiply` => `BlendMode.multiply`
* `overlay` => `BlendMode.overlay`
* `plus` => `BlendMode.plus`
* `saturation` => `BlendMode.saturation`
* `screen` => `BlendMode.screen`
* `softLight` => `BlendMode.softLight`
* `src` => `BlendMode.src`
* `srcATop` => `BlendMode.srcATop`
* `srcIn` => `BlendMode.srcIn`
* `srcOut` => `BlendMode.srcOut`
* `srcOver` => `BlendMode.srcOver`
* `xor` => `BlendMode.xor`


**BorderRadius**

Requires a `type` value that must be one of:
* `all` ==> `BorderRadius.all`
* `circular` ==> `BorderRadius.circular`
* `horizontal` ==> `BorderRadius.horizontal`
* `only` ==> `BorderRadius.only`
* `vertical` ==> `BorderRadius.vertical`


**BorderStyle**

Plain string that must be one of:
* `none` ==> `BorderStyle.none`
* `solid` ==> `BorderStyle.solid`


**BottomNavigationBarType**

Plain string that must be one of:
* `fixed` ==> BottomNavigationBarType.fixed
* `shifting` ==> BottomNavigationBarType.shifting


**BoxFit**

Plain string that must be one of:
* `contain` ==> `BoxFit.contain`
* `cover` ==> `BoxFit.cover`
* `fill` ==> `BoxFit.fill`
* `fitHeight` ==> `BoxFit.fitHeight`
* `fitWidth` ==> `BoxFit.fitWidth`
* `none` ==> `BoxFit.none`
* `scaleDown` ==> `BoxFit.scaleDown`


**ButtonBarLayoutBehavior**

Plain string that must be one of:
* `constrained` ==> `ButtonBarLayoutBehavior.constrained`
* `padded` ==> `ButtonBarLayoutBehavior.padded`


**ButtonTextTheme**

Plain string that must be one of:
* `accent` ==> `ButtonTextTheme.accent`
* `normal` ==> `ButtonTextTheme.normal`
* `primary` ==> `ButtonTextTheme.primary`


**Clip**

Plain string that must be one of:
* `antiAlias` ==> `Clip.antiAlias`
* `antiAliasWithSaveLayer` ==> `Clip.antiAliasWithSaveLayer`
* `hardEdge` ==> `Clip.hardEdge`
* `none` ==> `Clip.none`


**CrossAxisAlignment**

Plain string that must be one of:
* `baseline` ==> `CrossAxisAlignment.baseline`
* `center` ==> `CrossAxisAlignment.center`
* `end` ==> `CrossAxisAlignment.end`
* `start` ==> `CrossAxisAlignment.start`
* `stretch` ==> `CrossAxisAlignment.stretch`


**DragStartBehavior**

Plain string that must be one of:
* `down` ==> `DragStartBehavior.down`
* `start` ==> `DragStartBehavior.start`


**FlexFit**

Plain string that must be one of:
* `loose` ==> `FlexFit.loose`
* `tight` ==> `FlexFit.tight`


**FloatingLabelBehavior**

Plain string that must be one of:
* `always` ==> `FloatingLabelBehavior.always`
* `auto` ==> `FloatingLabelBehavior.auto`
* `never` ==> `FloatingLabelBehavior.never`


**FontWeight**

Plain string that must be one of:
* `bold` ==> `FontWeight.bold`
* `normal` ==> `FontWeight.normal`
* `w100` ==> `FontWeight.w100`
* `w200` ==> `FontWeight.w200`
* `w300` ==> `FontWeight.w300`
* `w400` ==> `FontWeight.w400`
* `w500` ==> `FontWeight.w500`
* `w600` ==> `FontWeight.w600`
* `w700` ==> `FontWeight.w700`
* `w800` ==> `FontWeight.w800`
* `w900` ==> `FontWeight.w900`


**FontStyle**

Plain string that must be one of:
* `italic` ==> `FontStyle.italic`
* `normal` ==> `FontStyle.normal`


**Gradient**

Requires a `type` value that must be one of:
* `linear` ==> `LinearGradient`
* `radial` ==> `RadialGradient`
* `sweep` ==> `SweepGradient`


**InputBorder**

Requires a `type` value that must be one of:
* `outline` ==> `OutlineInputBorder`
* `underline` ==> `UnderlineInputBorder`


**InteractiveInkFeatureFactory**

Plain string that must be one of:
* `splash` ==> `InkSplash.splashFactory`
* `ripple` ==> `InkRipple.splashFactory`


**MainAxisAlignment**

Plain string that must be one of:
* `center` ==> `MainAxisAlignment.center`
* `end` ==> `MainAxisAlignment.end`
* `spaceAround` ==> `MainAxisAlignment.spaceAround`
* `spaceBetween` ==> `MainAxisAlignment.spaceBetween`
* `spaceEvenly` ==> `MainAxisAlignment.spaceEvenly`
* `start` ==> `MainAxisAlignment.start`


**MainAxisSize**

Plain string that must be one of:
* `min` ==> `MainAxisSize.min`
* `max` ==> `MainAxisSize.max`


**MaterialTapTargetSize**

Plain string that must be one of:
* `padded` ==> `MaterialTapTargetSize.padded`
* `shrinkWrap` ==> `MaterialTapTargetSize.shrinkWrap`


**MaterialType**

Plain string that must be one of:
* `button` ==> `MaterialType.button`
* `canvas` ==> `MaterialType.canvas`
* `card` ==> `MaterialType.card`
* `circle` ==>`MaterialType.circle`
* `transparency` ==> `MaterialType.transparency`


**NavigationRailLabelType**

Plain string that must be one of:
* `all` ==> `NavigationRailLabelType.all`
* `none` ==> `NavigationRailLabelType.none`
* `selected` ==> `NavigationRailLabelType.selected`


**NotchedShape**

Plain string that must be one of:
* `circular` ==> `CircularNotchedRectangle`


**Overflow**

Plain string that must be one of:
* `clip` ==> `Overflow.clip`
* `visible` ==> `Overflow.visible`


**Radius**

Requires a `type` value that must be one of:
* `circular` ==> `Radius.circular`
* `elliptical` ==> `Radius.elliptical`
* `zero` ==> `Radius.zero`


**RangeSliderThumbShape**

Requires a `type` value that must be one of:
* `round` ==> `RoundRangeSliderThumbShape`


**RangeSliderTickMarkShape**

Plain string that must be one of:
Requires a `type` value that must be one of:
* `round` ==> `RoundRangeSliderTickMarkShape`


**RangeSliderTrackShape**

Plain string that must be one of:
* `rectangular` ==> `RectangularRangeSliderTrackShape`
* `rounded` ==> `RoundedRectRangeSliderTrackShape`


**RangeSliderValueIndicatorShape**

Requires a `type` value that must be one of:
* `paddle` ==> `PaddleRangeSliderValueIndicatorShape`


**ScrollPhysics**

Requires a `type` value that must be one of:
* `always` ==> `AlwaysScrollableScrollPhysics`
* `bouncing` ==> `BouncingScrollPhysics`
* `clamping` ==> `ClampingScrollPhysics`
* `fixedExtent` ==> `FixedExtentScrollPhysics`
* `never` ==> `NeverScrollableScrollPhysics`
* `page` ==> `PageScrollPhysics`


**ShapeBorder**

Requires a `type` value that must be one of:
* `circle` ==> `CircleBorder`
* `rectangle` ==> `ContinuousRectangleBorder`
* `rounded` ==> `RoundedRectangleBorder`


**ShowValueIndicator**

Plain string that must be one of:
* `always` ==> `ShowValueIndicator.always`
* `never` ==> `ShowValueIndicator.never`
* `onlyForContinuous` ==> `ShowValueIndicator.onlyForContinuous`
* `onlyForDiscrete` ==> `ShowValueIndicator.onlyForDiscrete`


**SliderComponentShape**

Plain string that must be one of:
* `noOverlay` ==> `SliderComponentShape.noOverlay`
* `noOverlay` ==> `SliderComponentShape.noOverlay`


**SliderTrackShape**

Plain string that must be one of:
* `rectangular` ==> `RectangularSliderTrackShape`
* `rounded` ==> `RoundedRectSliderTrackShape`


**SnackBarBehavior**

Plain string that must be one of:
* `fixed` ==> `SnackBarBehavior.fixed`
* `floating` ==> `SnackBarBehavior.floating`


**StackFit**

Plain string that must be one of:
* `expand` ==> `StackFit.expand`
* `loose` ==> `StackFit.loose`
* `passthrough` ==> `StackFit.passthrough`


**TabBarIndicatorSize**

Plain string that must be one of:
* `label` ==> `ButtonTextTheme.label`
* `tab` ==> `ButtonTextTheme.tab`


**TargetPlatform**

Plain string that must be one of:
* `android` ==> `TargetPlatform.android`
* `fuchsia` ==> `TargetPlatform.fuchsia`
* `iOS` ==> `TargetPlatform.iOS`
* `linux` ==> `TargetPlatform.linux`
* `macOS` ==> `TargetPlatform.macOS`
* `windows` ==> `TargetPlatform.windows`


**TextAlign**

Plain string that must be one of:
* `center` ==> `TextAlign.center`
* `end` ==> `TextAlign.end`
* `justify` ==> `TextAlign.justify`
* `left` ==> `TextAlign.left`
* `right` ==> `TextAlign.right`
* `start` ==> `TextAlign.start`


**TextBaseline**

Plain string that must be one of:
* `alphabetic` ==> `TextBaseline.alphabetic`
* `ideographic` ==> `TextBaseline.ideographic`


**TextDecoration**

Plain string that must be one of:
* `lineThrough` ==> `TextDecoration.lineThrough`
* `none` ==> `TextDecoration.none`
* `overline` ==> `TextDecoration.overline`
* `underline` ==> `TextDecoration.underline`


**TextDecorationStyle**

Plain string that must be one of:
* `dashed` ==> `TextDecorationStyle.dashed`
* `dotted` ==> `TextDecorationStyle.dotted`
* `double` ==> `TextDecorationStyle.double`
* `solid` ==> `TextDecorationStyle.solid`
* `wavy` ==> `TextDecorationStyle.wavy`


**TextDirection**

Plain string that must be one of:
* `ltr` ==> `TextDirection.ltr`
* `rtl` ==> `TextDirection.rtl`


**TextOverflow**

Plain string that must be one of:
* `clip` ==> `TextOverflow.clip`
* `ellipsis` ==> `TextOverflow.ellipsis`
* `fade` ==> `TextOverflow.fade`
* `visible` ==> `TextOverflow.visible`


**TextWidthBasis**

Plain string that must be one of:
* `longestLine` ==> `TextWidthBasis.longestLine`
* `parent` ==> `TextWidthBasis.parent`


**TileMode**

Plain string that must be one of:
* `clamp` ==> `TileMode.clamp`
* `mirror` ==> `TileMode.mirror`
* `repeated` ==> `TileMode.repeated`


**VerticalDirection**

Plain string that must be one of:
* `down` ==> `VerticalDirection.down`
* `up` ==> `VerticalDirection.up`


**VisualDensity**

Plain string that must be one of:
* `adaptivePlatformDensity` ==> `VisualDensity.adaptivePlatformDensity`
* `comfortable` ==> `VisualDensity.comfortable`
* `compact` ==> `VisualDensity.compact`
* `standard` ==> `VisualDensity.standard`

