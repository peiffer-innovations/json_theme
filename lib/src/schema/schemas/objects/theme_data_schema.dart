import 'package:json_theme/json_theme_schemas.dart';

class ThemeDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/theme_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/ThemeData-class.html',
    'title': 'ThemeData',
    'type': 'object',
    'properties': {
      'accentColor': SchemaHelper.objectSchema(ColorSchema.id),
      'accentColorBrightness': SchemaHelper.objectSchema(BrightnessSchema.id),
      'accentIconTheme': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'accentTextTheme': SchemaHelper.objectSchema(TextThemeSchema.id),
      'appBarTheme': SchemaHelper.objectSchema(AppBarThemeSchema.id),
      'applyElevationOverlayColor': SchemaHelper.boolSchema,
      'bannerTheme':
          SchemaHelper.objectSchema(MaterialBannerThemeDataSchema.id),
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'bottomAppBarColor': SchemaHelper.objectSchema(ColorSchema.id),
      'bottomAppBarTheme':
          SchemaHelper.objectSchema(BottomAppBarThemeScheme.id),
      'brightness': SchemaHelper.objectSchema(BrightnessSchema.id),
      'bottomNavigationBarTheme':
          SchemaHelper.objectSchema(BottomNavigationBarThemeDataSchema.id),
      'bottomSheetTheme':
          SchemaHelper.objectSchema(BottomSheetThemeDataSchema.id),
      'buttonBarTheme': SchemaHelper.objectSchema(ButtonBarThemeDataSchema.id),
      'buttonColor': SchemaHelper.objectSchema(ColorSchema.id),
      'buttonTheme': SchemaHelper.objectSchema(ButtonThemeDataSchema.id),
      'canvasColor': SchemaHelper.objectSchema(ColorSchema.id),
      'cardColor': SchemaHelper.objectSchema(ColorSchema.id),
      'cardTheme': SchemaHelper.objectSchema(CardThemeSchema.id),
      'chipTheme': SchemaHelper.objectSchema(ChipThemeDataSchema.id),
      'colorScheme': SchemaHelper.objectSchema(ColorSchemeSchema.id),
      'cupertinoOverrideTheme':
          SchemaHelper.objectSchema(CupertinoThemeDataSchema.id),
      'dataTableTheme': SchemaHelper.objectSchema(DataTableThemeDataSchema.id),
      'dialogBackgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'dialogTheme': SchemaHelper.objectSchema(DialogThemeSchema.id),
      'disabledColor': SchemaHelper.objectSchema(ColorSchema.id),
      'dividerColor': SchemaHelper.objectSchema(ColorSchema.id),
      'dividerTheme': SchemaHelper.objectSchema(DividerThemeDataSchema.id),
      'elevatedButtonTheme':
          SchemaHelper.objectSchema(ElevatedButtonThemeDataSchema.id),
      'errorColor': SchemaHelper.objectSchema(ColorSchema.id),
      'fixTextFieldOutlineLabel': SchemaHelper.boolSchema,
      'floatingActionButtonTheme':
          SchemaHelper.objectSchema(FloatingActionButtonThemeDataSchema.id),
      'focusColor': SchemaHelper.objectSchema(ColorSchema.id),
      'fontFamily': SchemaHelper.stringSchema,
      'highlightColor': SchemaHelper.objectSchema(ColorSchema.id),
      'hintColor': SchemaHelper.objectSchema(ColorSchema.id),
      'hoverColor': SchemaHelper.objectSchema(ColorSchema.id),
      'iconTheme': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'indicatorColor': SchemaHelper.objectSchema(ColorSchema.id),
      'inputDecorationTheme':
          SchemaHelper.objectSchema(InputDecorationThemeSchema.id),
      'materialTapTargetSize':
          SchemaHelper.objectSchema(MaterialTapTargetSizeSchema.id),
      'navigationRailTheme':
          SchemaHelper.objectSchema(NavigationRailThemeDataSchema.id),
      'outlinedButtonTheme':
          SchemaHelper.objectSchema(OutlinedButtonThemeDataSchema.id),
      'pageTransitionsTheme':
          SchemaHelper.objectSchema(PageTransitionsThemeSchema.id),
      'platform': SchemaHelper.objectSchema(TargetPlatformSchema.id),
      'popupMenuTheme': SchemaHelper.objectSchema(PopupMenuThemeDataSchema.id),
      'primaryColor': SchemaHelper.objectSchema(ColorSchema.id),
      'primaryColorBrightness': SchemaHelper.objectSchema(BrightnessSchema.id),
      'primaryColorDark': SchemaHelper.objectSchema(ColorSchema.id),
      'primaryColorLight': SchemaHelper.objectSchema(ColorSchema.id),
      'primaryIconTheme': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'primarySwatch': SchemaHelper.objectSchema(MaterialColorSchema.id),
      'primaryTextTheme': SchemaHelper.objectSchema(TextThemeSchema.id),
      'scaffoldBackgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'secondaryHeaderColor': SchemaHelper.objectSchema(ColorSchema.id),
      'selectedRowColor': SchemaHelper.objectSchema(ColorSchema.id),
      'shadowColor': SchemaHelper.objectSchema(ColorSchema.id),
      'sliderTheme': SchemaHelper.objectSchema(SliderThemeDataSchema.id),
      'snackBarTheme': SchemaHelper.objectSchema(SnackBarThemeDataSchema.id),
      'splashColor': SchemaHelper.objectSchema(ColorSchema.id),
      'splashFactory':
          SchemaHelper.objectSchema(InteractiveInkFeatureFactorySchema.id),
      'tabBarTheme': SchemaHelper.objectSchema(TabBarThemeSchema.id),
      'textButtonTheme':
          SchemaHelper.objectSchema(TextButtonThemeDataSchema.id),
      'textSelectionTheme':
          SchemaHelper.objectSchema(TextSelectionThemeDataSchema.id),
      'textTheme': SchemaHelper.objectSchema(TextThemeSchema.id),
      'timePickerTheme':
          SchemaHelper.objectSchema(TimePickerThemeDataSchema.id),
      'toggleButtonsTheme':
          SchemaHelper.objectSchema(ToggleButtonsThemeDataSchema.id),
      'toggleableActiveColor': SchemaHelper.objectSchema(ColorSchema.id),
      'tooltipTheme': SchemaHelper.objectSchema(TooltipThemeDataSchema.id),
      'typography': SchemaHelper.objectSchema(TypographySchema.id),
      'unselectedWidgetColor': SchemaHelper.objectSchema(ColorSchema.id),
      'visualDensity': SchemaHelper.objectSchema(VisualDensitySchema.id),
    },
  };
}
