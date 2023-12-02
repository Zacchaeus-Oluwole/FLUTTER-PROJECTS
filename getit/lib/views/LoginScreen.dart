import 'package:flutter/material.dart';
import 'package:getit/views/HomeScreen.dart';
import 'package:getit/views/animation.dart';
import 'package:getit/views/SignupScreen.dart';
import 'package:getit/views/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomPainApp(),
    );
  }
}


class CustomPainApp extends StatefulWidget {
  const CustomPainApp({super.key});

  @override
  State<CustomPainApp> createState() => _CustomPainAppState();
}

class _CustomPainAppState extends State<CustomPainApp> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: mainColor,
        body: Column(
          children: [
            Stack(
              children: [
                CustomPaint(
                  painter: MyPainter(),
                  child: Container(
                    height: 400.0,
                  ),
                ),
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
                    child: const Center(
                      child: TextAnimation(
                        widgetEnd: 1.0,
                        widgetChild: Text(
                          "Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
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
                            child: const TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email address",
                                hintStyle: TextStyle(color: Color.fromARGB(255, 154, 92, 175),)
                              ),
                            ),
                          ),
                          const Divider(thickness: 2,),
                  
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: const TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Color.fromARGB(255, 154, 92, 175),)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50,),
                  GetItButton(title: "LOGIN", onPressedFn: (){ Pass(context); },),
                  const SizedBox(height: 10,),
                  TextAnimation(widgetEnd: 1, widgetChild: Text("Don't have an account? ", style: TextStyle(color: mainBGColor),)),
                  const SizedBox(height: 10,),
                  GetItButton(title: "SIGN UP", onPressedFn: (){PassFn(context);},)
                ]
              ),
            )
                 
          ],
        ),
    );
  }

  // ignore: non_constant_identifier_names
  void Pass(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
  }
  // ignore: non_constant_identifier_names
  void PassFn(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
  }

}
