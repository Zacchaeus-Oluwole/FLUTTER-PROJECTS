import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:getit/views/colors.dart';




class GetItButton extends StatelessWidget {
  final VoidCallback onPressedFn;
  final String title;
  const GetItButton({super.key, required this.title, required this.onPressedFn});

  @override
  Widget build(BuildContext context) {
    return LoginAnimation(
      endValue: 400.0,
      childWidget: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 241, 96, 29),
              Color.fromARGB(255, 86, 196, 227),
            ]
          )
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          onPressed: onPressedFn,
          child: Center(
            child: Text(title, style: TextStyle(color: mainBGColor, fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
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
        return SizedBox( width: value, child: childWidget);
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

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size){
    Paint paint = Paint();

    Path mainBGPath = Path();
    mainBGPath.addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height));
    paint.color = mainBGColorP;
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
    paint.color = mainColor;
    canvas.drawPath(cyanPath, paint);

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}