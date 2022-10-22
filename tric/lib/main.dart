import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tric/BottomNavBar.dart';
import 'constant.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    )
  );
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
        primaryColor: kHome,
        fontFamily: "Mulish",
      ),
      home: BottomNavBar(0),
      
      // Container(
      //   color: Colors.pink,
      //   child: Center(
      //     // // ------------------------------
      //     // child: Image(
      //     //   height: 150,
      //     //   image: AssetImage('assets/icons/tric icon1.png'),
      //     //   ),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         ImageIcon(
      //           color: kLight,
      //           size: 150,
      //           AssetImage("assets/icons/home.png"),
      //         ),
      //         SizedBox(height: 18.0,),
      //         Text(
      //           'Home',
      //             style: TextStyle(fontSize: 20.0,
      //             color: kLight,
      //             fontWeight: FontWeight.bold,
      //           ),
                
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
