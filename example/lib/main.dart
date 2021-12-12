import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';

import 'src/theme_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RootPage(),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
  }) : super(key: key);

  static const _themes = [
    'default',
    'big_red',
    'calm_blue',
  ];

  Future<void> _onThemeSelected(BuildContext context, String themeId) async {
    var themeStr = await rootBundle.loadString('assets/themes/$themeId.json');
    var themeJson = json.decode(themeStr);

    var theme = ThemeDecoder.decodeThemeData(themeJson) ?? ThemeData();

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => ThemePage(
          theme: theme,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Theme'),
      ),
      body: ListView.builder(
        itemCount: _themes.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(_themes[index]),
          onTap: () => _onThemeSelected(context, _themes[index]),
        ),
      ),
    );
  }
}
