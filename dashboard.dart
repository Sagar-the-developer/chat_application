import 'dart:io';

import 'package:ChatZone/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:ChatZone/pages/login.dart';
import 'package:ChatZone/pages/logout.dart';
import 'package:ChatZone/pages/setting.dart';
import 'package:ChatZone/widgets/dashboardTopContainer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/dashboardRow.dart';
import 'package:ChatZone/pages/navigator.dart';

class DashboardScreen extends StatefulWidget {

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Container(
          padding: EdgeInsets.all(20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Dashboard",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            GestureDetector(
              onTap: () async {
                var sharedPref = await SharedPreferences.getInstance();
                // Future clearSharedPreferences() async {
                //   var prefs = await SharedPreferences.getInstance();
                //   await prefs.clear();
                // }
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                sharedPref.setBool(SplashScreen.keylogin, false);
                //clearSharedPreferences();
              },
              child: Icon(
                Icons.logout,
                color: Colors.white,
                size: 30,
              ),
            ),
          ]),
        ),
        backgroundColor: Color(0xff02689b),
      ),
      body: Column(
        children: [
          DashboardTopContainer(
            
          ),
          SizedBox(
            height: 25,
          ),
          Column(
            children: [
              DashboardRowWidget(
                box1Text: "CONTRIBUTE",
                icon1: Icons.add,
                box2Text: "PRACTICE",
                icon2: Icons.note,
              ),
              SizedBox(
                height: 20,
              ),
              DashboardRowWidget(
                box1Text: "LEARN",
                icon1: Icons.leaderboard_rounded,
                box2Text: "INTERESTS",
                icon2: Icons.interests,
              ),
              SizedBox(
                height: 20,
              ),
              DashboardRowWidget(
                box1Text: "HELP",
                icon1: Icons.help,
                box2Text: "SETTINGS",
                icon2: Icons.settings,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
