import 'package:flutter/material.dart';
import 'colors.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController passwordController;
  const PasswordTextField({super.key, required this.passwordController});

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _PasswordTextFieldState createState() => _PasswordTextFieldState(passwordController: passwordController);
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final TextEditingController passwordController;
  bool _obscureText = true;

  _PasswordTextFieldState({required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,
      style: TextStyle(color: mainBGColor),
      obscureText: _obscureText,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Password",
        hintStyle: TextStyle(color: Color.fromARGB(255, 154, 92, 175)),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Color.fromARGB(255, 154, 92, 175),
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }
}
