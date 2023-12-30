import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getit/views/colors.dart';


class VerificationCodeScreen extends StatefulWidget {
  final List<TextEditingController> controllers;
  const VerificationCodeScreen({super.key, required this.controllers});

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState(controllers:controllers);
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final List<TextEditingController> controllers;

  _VerificationCodeScreenState({required this.controllers});

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            6,
            (index) => Expanded(
              child: Container(
                margin: const EdgeInsets.all(4),
                width: 40,
                child: TextField(
                  controller: controllers[index],
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: mainBGColor),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: mainBGColor)
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(227, 138, 50, 10)), // Set border color when not focused
                    ),
                    hintText: "0",
                    hintStyle: const TextStyle(color: Color.fromARGB(255, 61, 115, 130)),
                    
                  ),
                  onChanged: (value) {
                    // Handle onChanged if needed
                    // Limit the length to 1 digit
                    if (value.length > 1) {
                      controllers[index].text = value.substring(0, 1);
                    }
            
                    // Move focus to the next TextField
                    if (index < controllers.length - 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              ),
            ),
          ),
        );
  }
}
