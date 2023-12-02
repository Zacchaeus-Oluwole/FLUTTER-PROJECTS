import 'package:flutter/material.dart';

Color mainBGColor = const Color(0xFF99D5E5);
Color mainBGColorP = const Color.fromARGB(255, 53, 130, 152); 
Color redColor = const Color(0xFFDE3C10);
Color purpleColor = const Color(0x0ff812ad);
Color mainColor = const Color(0xFF652A78);
Color orangeColor = const Color(0xffe97a4d);

class ShaderColor extends StatelessWidget {
  final Text passText;
  const ShaderColor({super.key, required this.passText});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [
            Color.fromARGB(255, 241, 96, 29),
            Color.fromARGB(255, 86, 196, 227),
          ], 
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).createShader(bounds);
      },
      child: passText,
    );
  }
}