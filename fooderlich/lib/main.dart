import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';

void main() {
  runApp(Fooderlich());
}

class Fooderlich extends StatelessWidget {
  Fooderlich({super.key});
  final theme = FooderlichTheme.dark();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fooderlich',
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Fooderlich page',
            style: theme.textTheme.headline6,
            ),
        ),
        body: Center( child: Text(
          'Let\'s get cooking',
          style: theme.textTheme.headline1,
          ),
        ),
    ),
    );
  }
}
