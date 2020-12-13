## [1.5.0+1] - December 13th, 2020

* Updated `meta` dependency


## [1.5.0] - December 13th, 2020

* Removed deprecated "disabledThumbGapWidth"
* Swapped out the no longer maintained `json_schema` for the forked `json_schema2`.


## [1.4.3+1] - November 26th, 2020

* Added a `$comment` to all schemas linking to the respective dartdoc page.


## [1.4.3] - November 26th, 2020

* Updated all schema URLs to point to a live repo.


## [1.4.2] - November 22nd, 2020

* Fix for [Issue #18](https://github.com/peiffer-innovations/json_theme/issues/18)


## [1.4.1] - October 20th, 2020

* Added back `Overflow` because so did Flutter.


## [1.4.0] - October 20th, 2020

* Added Flutter 1.22 support for:
  * `AutovalidateMode`
  * `ButtonStyle`
  * `DataTableThemeData`
  * `ElevatedButtonThemeData`
  * `OutlinedBorder`
  * `OutlinedButtonThemeData`
  * `PageTransitionsBuilder`
  * `PageTransitionsTheme`
  * `Size`
  * `TextButtonThemeData`
  * `TextSelectionThemeData`
* Added a bunch of new `SystemMouseCursor` options made available in Flutter 1.22.


## [1.3.5] - September 22nd, 2020

* Removed `Overflow` because that was straight-up removed in Flutter 1.23, so keeping it breaks future compatibility


## [1.3.4] - September 11th, 2020

* Added `linux` example


## [1.3.3+1] - September 3rd, 2020

* README.md update to point to the live Flutter Web example for the app


## [1.3.3] - September 3rd, 2020

* Added `CrossFadeState` support
* Removed `horizontalDoubleArrow` and `verticalDoubleArrow` support from the Mouse Cursors because those are removed in 1.21 and keeping them will become an upgrade blocker in the not-too-distant future.
* Added `web` example
* Added `macos` example


## [1.3.2] - September 1st, 2020

* Swapped "oneOf" for "anyOf" because that's really more accurate for the schema validation.


## [1.3.1] - Auguest 30th, 2020

* Updated to support dynamic expressions for enums using `{{foo}}` and `##foo(bar)##` syntax.


## [1.3.0] - Auguest 29th, 2020

* Updated to support the built-in actual widgets as part of the decode functions in addition to the JSON-like models.
* Minor validation fix for empty objects


## [1.2.3] - Auguest 22nd, 2020

* Added `DecorationPosition` support


## [1.2.2] - Auguest 22nd, 2020

* Dependency updates


## [1.2.1] - Auguest 6th, 2020

* Added `MouseCursor` support
* Minor other bug fixes and enhancements


## [1.2.0] - Auguest 5th, 2020

* Updated with new theme elements from Flutter `1.20.0`


## [1.1.2+1] - July 18h, 2020

* Fixed HTTP link to GitHub to be a secure HTTPS link


## [1.1.2] - July 14th, 2020

* Fixed a recursive bug in `SchemaCache.addSchema`


## [1.1.1] - July 13th, 2020

* Exported the JSON Schemas for other tools to also be able to perform validation.


## [1.1.0] - July 11th, 2020

* Added JSON Schema validators for all objects


## [1.0.8] - July 2nd, 2020

* Added decoders for...
  * `SmartDashesType`
  * `SmartQuotesType`
  * `TextAlignVertical`
  * `TextCapitalization`
  * `TextInputAction`
  * `TextInputType`


## [1.0.7] - June 24th, 2020

* Fixed more default values in `ThemeDecoder`


## [1.0.6] - June 23rd, 2020

* Fix for `IconData`
* Added secondary decoding option for `BoxBorder`


## [1.0.5] - June 22nd, 2020

* Added encoder / decoder for `FilterQuality`
* Added encoder / decoder for `ImageRepeat`
* Added encoder / decoder for `HitTestBehavior`
* Added encoder / decoder for `Rect`


## [1.0.4] - June 21st, 2020

* Added more value option to `ThemeDecoder.decodeEdgeInsetsGeometry`
* Completed DartDocs for all public functions.


## [1.0.3] - June 20th, 2020

* Added encoder / decoder for: `FloatingActionButtonAnimator`
* Added encoder / decoder for: `FloatingActionButtonLocation`


## [1.0.2] - June 19th, 2020

* Added several new encoders and decoders
* Started adding DartDocs


## [1.0.1] - June 15th, 2020

* Added encoder / decoder for `CrossAxisAlignment`


## [1.0.0] - June 13th, 2020

* Added [example](https://github.com/peiffer-innovations/json_theme/example)
* Added documentation
* Added Unit Tests


## [0.1.2] - June 11th, 2020

* Updated to use [json_class](https://pub.dev/packages/json_class) vs `rest_client` to reduce footprint


## [0.1.1] - June 2nd, 2020

* Fix to work in `stable` / `1.17` rather than `beta` / `1.18`


## [0.1.0] - June 2nd, 2020

* Initial release
* ~~**TODO**: Documentation~~
* ~~**TODO**: Example App~~
* ~~**TODO**: Unit Tests~~