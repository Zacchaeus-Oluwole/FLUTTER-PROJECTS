import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';
import 'home.dart';

void main() {
  runApp(Fooderlich());
}

class Fooderlich extends StatelessWidget {
  Fooderlich({super.key});
  final theme = FooderlichTheme.light();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fooderlich',
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const Home()
    );
  }
}
