import 'package:example/src/example_form.dart';
import 'package:flutter/material.dart';

class ThemePage extends StatelessWidget {
  ThemePage({
    super.key,
    ThemeData? theme,
  }) : theme = theme ?? ThemeData();

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme,
      child: Builder(
        builder: (BuildContext context) => Scaffold(
          appBar: AppBar(
            title: const Text('Themed Page'),
          ),
          body: const SingleChildScrollView(
            child: ExampleForm(),
          ),
        ),
      ),
    );
  }
}
