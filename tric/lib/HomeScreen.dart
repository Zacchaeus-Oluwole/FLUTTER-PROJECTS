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
    Size size = MediaQuery.of(context).size;
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
            ),
            SizedBox(height: 10.0,),
            Text(
              'News',
              style: TextStyle(
                  fontSize: 16.0,
                  color: kLight.withOpacity(0.75),
                  fontFamily: 'Mulish-SemiBold'
                ),
            ),
            SizedBox( height: 10.0,),
            Stack(
              children: [
                Container(
                  height: 250.0,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: kLight,
                    borderRadius: BorderRadius.circular(24.0),
                    image: DecorationImage(image: AssetImage('assets/images/arduino.jpg'),
                    fit: BoxFit.cover,
                    
                  )
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: 
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Learn embedded system wiith arduino',
                            style: TextStyle(
                              fontSize: 17.0,
                              color: kLight,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  '25 Oct, 2022',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: kLight.withOpacity(0.8),
                                    fontFamily: 'Mulish-SemiBold',
                                  ),
                                ),
                                Column(
                                  children: [
                                     Positioned(
                                        bottom: 24.0,
                                        right: 24.0,
                                        child: Container(
                                          height: 34.0,
                                          width: 68.0,
                                          decoration: BoxDecoration(
                                            color: kBox.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(50.0),
                                          ),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                'assets/icons/heart.png',
                                                height: 30.0,
                                                width: 30.0,
                                                ),
                                                SizedBox(width: 2.0,),
                                                Text(
                                                  "100k",
                                                  style: TextStyle(
                                                    fontSize: 13.0,
                                                    color: kLight.withOpacity(0.75),
                                                    fontFamily: 'Mulish-SemiBold'
                                                  ),
                                                )
                                            ],
                                          ),
                                        )
                                      ),
                                  ],
                                )
                              ],
                            ),
                          ],
                      ),
                    ),
                )
              ],
            ),
            SizedBox(height: 10.0,),
            Text(
              'Members',
              style: TextStyle(
                  fontSize: 16.0,
                  color: kLight.withOpacity(0.75),
                  fontFamily: 'Mulish-SemiBold'
                ),
            ),
            Container(
              height: 162.0,
              width: 130.0,
              decoration: BoxDecoration(
                color: kCat.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16.0)
                ),
                child: Positioned(
                  left: 0.0,
                  child: Column(
                    children: [
                      CircleAvatar(
                            radius: 20.0,
                            backgroundColor: kHome,
                            backgroundImage: AssetImage('assets/images/profile.jpg'),
                          ),
                          Text('Zacchaeus Oluwole')
                    ],
                  ),
                ),
            )
          ],
        ),
      ),
      
    );
  }
}

// Container(
//               height: 120.0,
//               width: 120.0,
//               decoration: BoxDecoration(
//                 color: kCat.withOpacity(0.05),
//                 borderRadius: BorderRadius.circular(16.0)
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 120.0,
//                       width: size.width,
//                       decoration: BoxDecoration(
//                         color: kLight,
//                         borderRadius: BorderRadius.circular(24.0),
//                         image: DecorationImage(image: AssetImage('assets/images/profile.jpg'),
//                         fit: BoxFit.cover,
                        
//                       )
//                       ),
//                     ),
//                   ],
//                 ),
//             )



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