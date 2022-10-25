import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tric/HomeScreen.dart';
import 'package:tric/constant.dart';

class BottomNavBar extends StatefulWidget {
  int currentIndex = 0;
  BottomNavBar(this.currentIndex);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _children = [
    emptyScreen("assets/icons/home.png", "Home"),
    HomeScreen(),
    emptyScreen("assets/icons/menu.png", "Menu"),
    emptyScreen("assets/icons/profile.png", "Profile"),

  ];
  
  void onTabTapped(int index){
    setState(() {
      widget.currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kHome,
      body: _children[widget.currentIndex],
      bottomNavigationBar: Container(
        height: 64.0,
        margin: EdgeInsets.all(24.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: BottomNavigationBar(
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            backgroundColor: kBottonNavBar.withOpacity(0.08),
            selectedItemColor: kLight.withOpacity(0.4),
            onTap: onTabTapped,
            currentIndex: widget.currentIndex,
            items: [
              buildBottomNavigationBarItem(
                1,
                "assets/icons/home.png",
                "Home"
              ),
              buildBottomNavigationBarItem(
                2,
                "assets/icons/menu.png",
                "Menu"
              ),
              buildBottomNavigationBarItem(
                3,
                "assets/icons/profile.png",
                "Profile"
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      int index, String icon, String title){
    return BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(icon),
        size: 20.0,
      ),
      label: title,
    );
  }
}

Widget emptyScreen(String image, String title){
  return Center(
          // // ------------------------------
          // child: Image(
          //   height: 150,
          //   image: AssetImage('assets/icons/tric icon1.png'),
          //   ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                color: kLight,
                size: 150,
                AssetImage(image),
              ),
              SizedBox(height: 18.0,),
              Text(
                  title,
                  style: TextStyle(fontSize: 20.0,
                  color: kLight,
                  fontWeight: FontWeight.bold,
                ),
                
              ),
            ],
          ),
  );  
}
