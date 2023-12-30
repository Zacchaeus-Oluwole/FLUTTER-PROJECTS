import 'package:flutter/material.dart';
import 'package:getit/views/animation.dart';
import 'package:getit/viewsController/VerifyScreen.dart';
import 'package:getit/views/colors.dart';
import 'package:getit/views/PasswordTextField.dart';

import 'dart:convert';
import 'package:getit/model/models.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> registerUser() async {
    final String apiUrl = 'https://rust-shopping-api.shuttleapp.rs/api/auth/register';

    final RegisterUserSchema requestData = RegisterUserSchema(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode(requestData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Registration successful
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        // Handle success message as needed
        // ignore: use_build_context_synchronously
        PassVerifyPage(context);
        print(responseData['message']);
      } else {
        // Registration failed
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        // Handle error message as needed
        print(errorData['message']);
      }
    } catch (e) {
      // Handle network or unexpected errors
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: mainColor,
        body: Column(
          children: [
            Stack(
              children: [
                const Positioned(
                  top: 50,
                  right: 50,
                  child: TextAnimation(
                    widgetEnd: 1,
                    widgetChild: Icon(
                      Icons.rocket_launch,
                      color: Color.fromARGB(255, 241, 96, 29),
                      size: 70,

                    ),
                  ),
                ),

                Positioned(
                  child: Container(
                    margin: const EdgeInsets.only(top: 150),
                    child: Center(
                      child: TextAnimation(
                        widgetEnd: 1.0,
                        widgetChild: Text(
                          "Sign Up", style: TextStyle(color: mainBGColor, fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      )
                    )
                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  LoginAnimation(
                    endValue: 400.0,
                    childWidget: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .5),
                            blurRadius: 20.0,
                            offset: Offset(0, 0),
                          )
                        ]
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: nameController,
                              style: TextStyle(color: mainBGColor),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Name",
                                hintStyle: TextStyle(color: Color.fromARGB(255, 154, 92, 175),)
                              ),
                            ),
                          ),
                          const Divider(thickness: 2,color: Color.fromARGB(255, 154, 92, 175),),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: emailController,
                              style: TextStyle(color: mainBGColor),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email address",
                                hintStyle: TextStyle(color: Color.fromARGB(255, 154, 92, 175),)
                              ),
                            ),
                          ),
                          const Divider(thickness: 2,color: Color.fromARGB(255, 154, 92, 175),),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: PasswordTextField(passwordController: passwordController,)
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50,),
                  GetItButton(
                    title: "SUBMIT",
                    onPressedFn: () {
                      registerUser();
                    },
                  ),
                ]
              ),
            )
                 
          ],
        ),
    );
  }

  // ignore: non_constant_identifier_names
  void PassVerifyPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const VerificationPage()));
  }

}
