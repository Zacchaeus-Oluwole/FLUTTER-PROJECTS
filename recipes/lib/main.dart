import 'package:flutter/material.dart';

void main() {
  runApp(const RecipeApp());
}

const whiteColor = Colors.white;
const blackColor = Colors.black;

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Calculator',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: whiteColor,
        foregroundColor: blackColor,
      ),
      body: SafeArea(
        child: Text('Hello'),),
    );
  }
}
