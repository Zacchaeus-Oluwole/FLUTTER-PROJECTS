import 'package:flutter/material.dart';

Color mainBGColor = Color(0xFF652A78);
Color redColor = Color(0xFFDE3C10);
Color purpleColor = Color(0xFF812AD);
Color cyanColor = Color(0xFF99D5E5);
Color orangeColor = Color(0xffe97a4d);

void main() {
  runApp(const CustomPainApp());
}

class CustomPainApp extends StatelessWidget {
  const CustomPainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomPaint(
          painter: MyPainter(),
          child: Container(
            height: 500.0,
          ),
        ),
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
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }
}