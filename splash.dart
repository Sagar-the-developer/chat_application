import 'dart:async';
import 'package:ChatZone/pages/dashboard.dart';
import 'package:ChatZone/pages/navigator.dart';
import 'package:flutter/material.dart';
import 'package:ChatZone/pages/login.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  SplashScreen createState() => SplashScreen();
}

class SplashScreen extends State<Splash> with TickerProviderStateMixin {
  late AnimationController _controller;
  Animation _animation = Tween(begin: 0.0, end: 0.0).animate(AlwaysStoppedAnimation(0.0));
  static const String keylogin="login";
  var islogin;

  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 43, 222, 246),
          image : DecorationImage(
            image: AssetImage("assets/image/bk.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(205, 255, 255, 255),
                  radius: _animation.value,
                  child: Image.asset('assets/image/chetu.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  void whereToGo()async{
    var sharedpref = await SharedPreferences.getInstance();
    islogin = sharedpref.getBool(keylogin);
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 120.0).animate(_controller);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward().then((_) {
      if(islogin!=null){
        if(islogin){
          Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainNavigation()),
        );
        }
        else{
          Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),);
        }
      }
      else{
         Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),);
      }
      
    });
  }
}
