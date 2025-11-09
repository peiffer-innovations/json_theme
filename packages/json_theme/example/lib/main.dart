import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';

import 'src/theme_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: RootPage());
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  static const _themes = ['default', 'big_red', 'calm_blue'];

  Future<void> _onThemeSelected(BuildContext context, String themeId) async {
    final navigator = Navigator.of(context);
    final themeStr = await rootBundle.loadString('assets/themes/$themeId.json');
    final themeJson = json.decode(themeStr);

    final theme =
        ThemeDecoder().decodeThemeData(themeJson, validate: true) ??
        ThemeData();

    if (mounted) {
      await navigator.push(
        MaterialPageRoute(
          builder: (BuildContext context) => ThemePage(theme: theme),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Theme')),
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
