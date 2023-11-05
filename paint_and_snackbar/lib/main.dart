import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

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
        backgroundColor: cyanColor,
        body: Column(
          children: [
            CustomPaint(
              painter: MyPainter(),
              child: Container(
                height: 500.0,
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: mainBGColor),
              onPressed: (){
                Flushbar(
                  margin: const EdgeInsets.all(8),
                  borderRadius: BorderRadius.circular(8),
                  titleText: const Text("Hello Zacch", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Color.fromRGBO(233, 122, 77, 1), fontFamily:"ShadowsIntoLightTwo"),),
                  messageText: const Text("You killed that giant monster in the city with a Rusted Dart. Congratulations!", style: TextStyle(fontSize: 16.0, color: Color.fromRGBO(222, 60, 16, 1), fontFamily: "ShadowsIntoLightTwo"),),
                ).show(context);
              },
              child: const Text("Press here", style: TextStyle(color: Colors.black),),
            ), 
            
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

    Path purplePath = Path();
    purplePath.lineTo(size.width * .45, 0);
    purplePath.quadraticBezierTo(size.width * .25, size.height * .3, 0, size.height * .55);
    purplePath.close();
    paint.color = purpleColor;
    canvas.drawPath(purplePath, paint);

    Path redPath = Path();
    redPath.moveTo(size.width - (size.width * 0.1), 0.0);
    redPath.quadraticBezierTo(size.width * .5, size.height * .1, 0, size.height - (size.height * 0.15));
    redPath.lineTo(0, size.height);
    redPath.lineTo(size.width * 0.25, size.height);
    redPath.quadraticBezierTo(size.width * .5, size.height * .7, size.width, size.height * 0.6);
    redPath.lineTo(size.width, 0.0);
    redPath.close();
    paint.color = redColor;
    canvas.drawPath(redPath, paint);

    Path orangePath = Path();
    orangePath.moveTo(0, size.height * 0.75);
    orangePath.quadraticBezierTo(size.width * .25, size.height * 0.85, size.width * .40, size.height);
    orangePath.lineTo(0, size.height);
    orangePath.close();
    paint.color = orangeColor;
    canvas.drawPath(orangePath, paint);

    Path trianglePath =  Path();
    trianglePath.lineTo(size.width *.25, 0);
    trianglePath.lineTo(0, size.height *.25);
    trianglePath.close();
    paint.color = cyanColor;
    canvas.drawPath(trianglePath, paint);


  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

