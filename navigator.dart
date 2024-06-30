import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ChatZone/pages/dashboard.dart';
import 'package:ChatZone/pages/logout.dart';
import 'package:ChatZone/pages/setting.dart';

class MainNavigation extends StatefulWidget {  
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  PageController pageController = PageController();
  int currentstate = 0;
  void ontapped(int index) {
    setState(() {
      currentstate = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: pageController,
          children: [
            DashboardScreen(
            ),
            SettingsScreen(),
            User()
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                activeIcon: CircleAvatar(
                  backgroundColor:
                      Color(0xff1db7cb), // change icon color when selected
                  child: Icon(
                    Icons.home,
                    color: Color(0xff8af2ff), // icon color
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                activeIcon: CircleAvatar(
                  backgroundColor:
                      Color(0xff1db7cb), // change icon color when selected
                  child: Icon(
                    Icons.settings,
                    color: Color(0xff8af2ff), // icon color
                  ),
                ),
                label: 'Setting',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.verified_user,
                  color: Colors.white,
                ),
                activeIcon: CircleAvatar(
                  backgroundColor:
                      Color(0xff1db7cb), // change icon color when selected
                  child: Icon(
                    Icons.verified_user,
                    color: Color(0xff8af2ff), // icon color
                  ),
                ),
                label: 'User data',
              ),
            ],
            currentIndex: currentstate,
            unselectedItemColor: Colors.white,
            selectedItemColor: Color(0xff45def2),
            backgroundColor: Color(0xff02689b),
            onTap: ontapped,
          ),
        )
      ],
    );
  }
}
