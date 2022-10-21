import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tric/constant.dart';

class BottomNavBar extends StatefulWidget {
  int currentIndex = 0;
  BottomNavBar(this.currentIndex);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  void onTabTapped(int index){
    setState(() {
      widget.currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kHome,
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
                0,
                "assets/icons/home.png",
                "Home"
              ),
              buildBottomNavigationBarItem(
                0,
                "assets/icons/menu.png",
                "Menu"
              ),
              buildBottomNavigationBarItem(
                0,
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
