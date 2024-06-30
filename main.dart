import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ChatZone/pages/dashboard.dart';
import 'package:ChatZone/pages/navigator.dart';
import 'package:ChatZone/pages/singup.dart';
import 'package:ChatZone/pages/splash.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
