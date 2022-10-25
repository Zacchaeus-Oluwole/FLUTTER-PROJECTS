import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tric/constant.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kHome,
      body: Container(
        padding: EdgeInsets.only(top: 15.0,bottom: 0.0,left: 24.0,right: 24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/tric icon1.png', height: 80.0, width: 80.0,),
              ],
            ),
            // SizedBox(height: 5,),
            Text(
              'Tech Research, Innovation & Creativity',
              style: TextStyle(
                fontSize: 18.0,
                color: iconLight,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Harnessing innovative solutions with great minds',
              style: TextStyle(
                fontSize: 10.0,
                color: iconLight,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      
    );
  }
}





// Image.asset('assets/images/profile.jpg', height: 70.0, width: 70.0,),
                // Column(
                //   children: [
                //     Text(
                //       "", 
                //       // style: TextStyle(fontSize: 15.0, color: kLight, fontFamily: 'Mulish-SemiBold'),
                //     ),
                //   ],
                // ),
                // Text(
                //   "Hi, ZTech", 
                //   style: TextStyle(fontSize: 15.0, color: kLight, fontFamily: 'Mulish-SemiBold'),
                // ),
              
                // Column(
                //   children: [
                //     CircleAvatar(
                //           radius: 20.0,
                //           backgroundColor: kHome,
                //           backgroundImage: AssetImage('assets/images/profile.jpg'),
                //         ),
                //   ],
                // ),