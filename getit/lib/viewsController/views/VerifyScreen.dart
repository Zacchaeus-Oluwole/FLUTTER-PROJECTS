import 'package:flutter/material.dart';
import 'package:getit/viewsController/views/animation.dart';
import 'package:getit/viewsController/views/LoginScreen.dart';
import 'package:getit/views_controller/views/colors.dart';
import 'VerifyCodeInpute.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {

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
                              child: VerificationCodeScreen(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50,),
                  GetItButton(title: "SUBMIT", onPressedFn: () { PassFn(context); },),
                ]
              ),
            )
                 
          ],
        ),
    );
  }

  // ignore: non_constant_identifier_names
  void PassFn(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

}
