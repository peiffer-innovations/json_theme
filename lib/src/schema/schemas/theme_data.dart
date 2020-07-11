class ThemeDataSchema {
  static const id =
      'https://peifferinnovations.com/json_theme/schemas/theme_data';

  static const schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'ThemeData',
    'type': 'object',
    'properties': {
      'accentColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'accentColorBrightness': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/brightness',
      },
      'accentIconTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/icon_theme_data',
      },
      'accentTextTheme': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_theme',
      },
      'appBarTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/app_bar_theme',
      },
      'applyElevationOverlayColor': {
        'type': 'boolean',
      },
      'bannerTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/material_banner_theme_data',
      },
      'backgroundColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'bottomAppBarColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'bottomAppBarTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/bottom_app_bar_theme',
      },
      'brightness': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/brightness',
      },
      'bottomSheetTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/bottom_sheet_theme_data',
      },
      'buttonBarTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/button_bar_theme_data',
      },
      'buttonColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'buttonTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/button_theme_data',
      },
      'canvasColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'cardColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'cardTheme': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/card_theme',
      },
      'chipTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/chip_theme_data',
      },
      'colorScheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/color_scheme',
      },
      'cupertinoOverrideTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/cupertino_theme_data',
      },
      'cursorColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'dialogBackgroundColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'dialogTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/dialog_theme',
      },
      'disabledColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'dividerColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'dividerTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/divider_theme_data',
      },
      'errorColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'floatingActionButtonTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/floating_action_button_theme_data',
      },
      'focusColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'fontFamily': {
        'type': 'string',
      },
      'highlightColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'hintColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'hoverColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'iconTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/icon_theme_data',
      },
      'indicatorColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'inputDecorationTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/input_decoration_theme',
      },
      'materialTapTargetSize': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/material_tap_target_size',
      },
      'navigationRailTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/navigation_rail_theme_data',
      },
      'platform': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/target_platform',
      },
      'popupMenuTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/popup_menu_theme_data',
      },
      'primaryColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'primaryColorBrightness': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/brightness',
      },
      'primaryColorDark': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'primaryColorLight': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'primaryIconTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/icon_theme_data',
      },
      'primarySwatch': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/material_color',
      },
      'primaryTextTheme': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_theme',
      },
      'scaffoldBackgroundColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'secondaryHeaderColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'selectedRowColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'sliderTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/slider_theme_data',
      },
      'snackBarTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/snack_bar_theme_data',
      },
      'splashColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'splashFactory': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/interactive_ink_feature_factory',
      },
      'tabBarTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/tab_bar_theme',
      },
      'textSelectionColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'textSelectionHandleColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'textTheme': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/text_theme',
      },
      'toggleButtonsTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/toggle_buttons_theme_data',
      },
      'toggleableActiveColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'tooltipTheme': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/tooltip_theme_data',
      },
      'typography': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/typography',
      },
      'unselectedWidgetColor': {
        r'$ref': 'https://peifferinnovations.com/json_theme/schemas/color',
      },
      'visualDensity': {
        r'$ref':
            'https://peifferinnovations.com/json_theme/schemas/visual_density',
      },
    },
  };
}
