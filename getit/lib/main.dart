import 'package:flutter/material.dart';
import 'package:getit/viewsController/LoginScreen.dart';

void main() {
  runApp(const GetIt());
}

class GetIt extends StatelessWidget {
  const GetIt({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}