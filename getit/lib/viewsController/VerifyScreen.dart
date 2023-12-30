import 'package:flutter/material.dart';
import 'package:getit/views/animation.dart';
import 'package:getit/viewsController/LoginScreen.dart';
import 'package:getit/views/colors.dart';
import '../views/VerifyCodeInpute.dart';

import 'dart:convert';
import 'package:getit/model/models.dart';
import 'package:http/http.dart' as http;

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final List<TextEditingController> controllers = List.generate(6, (index) => TextEditingController());
  final TextEditingController verificationCodeController = TextEditingController();

  Future<void> verifyEmail() async {
    final String apiUrl = 'https://rust-shopping-api.shuttleapp.rs/api/auth/verify_email';

    // Assuming you want to concatenate the first 6 characters from each controller
    String result = '';
    for (TextEditingController controller in controllers) {
      String text = controller.text;
      if (text.length >= 6) {
        result += text.substring(0, 6);
      } else {
        // Handle the case when the text is less than 6 characters
        result += text.padRight(6, ' '); // You can adjust the padding strategy as needed
      }
    }

    final VerifyEmailSchema requestData = VerifyEmailSchema(
      verificationCode: result,
    );

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode(requestData.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Verification successful
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        // Handle success, e.g., show a success message
        PassLoginPage(context);
        print(responseData['message']);
      } else {
        // Verification failed
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
                          "Verify", style: TextStyle(color: mainBGColor, fontSize: 40, fontWeight: FontWeight.bold),
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
                  const SizedBox(height: 50,),
                  TextAnimation(widgetEnd: 1, widgetChild: Text("We sent an email with verification code to", style: TextStyle(color: mainBGColor),)),
                  const SizedBox(height: 50,),
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
                              child: VerificationCodeScreen(controllers: controllers,),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50,),
                  GetItButton(
                    title: "SUBMIT", 
                    onPressedFn: () {
                      verifyEmail();
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
  void PassLoginPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

}
