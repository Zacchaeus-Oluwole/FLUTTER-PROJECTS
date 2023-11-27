import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

Color mainBGColor = const Color(0xFF652A78);
Color redColor = const Color(0xFFDE3C10);
Color purpleColor = const Color(0x0ff812ad);
Color cyanColor = const Color(0xFF99D5E5);
Color orangeColor = const Color(0xffe97a4d);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        backgroundColor: cyanColor,
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
                    widgetChild: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.teal,
                      backgroundImage: AssetImage("assets/zach.jpg"),
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
                        color: cyanColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .5),
                            blurRadius: 20.0,
                            offset: Offset(0, 10)
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
                                hintText: "Email or Phone number",
                                hintStyle: TextStyle(color: Color.fromARGB(255, 154, 92, 175),)
                              ),
                            ),
                          ),
                  
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
                  // PlayAnimationBuilder<double>(
                  //   tween: Tween(begin: 100.0, end: 400.0),
                  //   duration: const Duration(seconds: 2),
                  //   delay: const Duration(seconds: 1),
                  //   curve: Curves.easeOut,
                  //   builder: (context, value, child) {
                  //     return Container(
                  //       width: value,
                  //       height: 50,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10.0),
                  //         gradient: LinearGradient(
                  //           colors: [
                  //             const Color.fromARGB(255, 154, 92, 175),
                  //             const Color.fromARGB(255, 154, 92, 175),
                  //             mainBGColor,
                  //             mainBGColor,
                  //             mainBGColor,
                  //             const Color.fromARGB(255, 154, 92, 175),
                  //             const Color.fromARGB(255, 154, 92, 175)
                  //           ]
                  //         )
                  //       ),
                  //       child: const Center(
                  //         child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  //       ),
                  //     );
                  //   },
                  // ),
                  LoginAnimation(
                    endValue: 400.0,
                    childWidget: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 154, 92, 175),
                            const Color.fromARGB(255, 154, 92, 175),
                            mainBGColor,
                            mainBGColor,
                            mainBGColor,
                            const Color.fromARGB(255, 154, 92, 175),
                            // mainBGColor,
                            const Color.fromARGB(255, 154, 92, 175)
                          ]
                        )
                      ),
                      child: const Center(
                        child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 70,),
                  TextAnimation(widgetEnd: 1, widgetChild: Text("Forgot Password", style: TextStyle(color: mainBGColor),))
                ]
              ),
            )
                 
          ],
        ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size){
    Paint paint = Paint();

    Path mainBGPath = Path();
    mainBGPath.addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height));
    paint.color = mainBGColor;
    canvas.drawPath(mainBGPath, paint);

    Path cyanPath = Path();
    cyanPath.moveTo(size.width/2, size.height * 0.75);
    cyanPath.quadraticBezierTo(size.width, size.height * 0.75, size.width, size.height * 0.50);
    cyanPath.quadraticBezierTo(size.width, size.height * 0.75, size.width, size.height*1.0);
    cyanPath.lineTo(size.width/2, size.height*1.0);
    cyanPath.moveTo(0, size.height*1.0);
    cyanPath.quadraticBezierTo(0, size.height* 0.75, size.width/2, size.height* 0.75);
    cyanPath.lineTo(size.width/2, size.height *1.0);

    cyanPath.close();
    paint.color = cyanColor;
    canvas.drawPath(cyanPath, paint);

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}


class LoginAnimation extends StatelessWidget {
  final double endValue;
  final Widget childWidget;
  const LoginAnimation({super.key, required this.endValue, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return PlayAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: endValue),
      duration: const Duration(seconds: 2),
      delay: const Duration(seconds: 1),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Container( width: value, child: childWidget);
      },
    );
  }
}

class TextAnimation extends StatelessWidget {
  final Widget widgetChild;
  final double widgetEnd;
  const TextAnimation({Key? key, required this.widgetChild, required this.widgetEnd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlayAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: widgetEnd),
      duration: const Duration(seconds: 2),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: widgetChild,
    );
  }
}