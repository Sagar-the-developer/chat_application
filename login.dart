import 'dart:io';

import 'package:ChatZone/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:ChatZone/pages/navigator.dart';
import 'package:ChatZone/pages/singup.dart';
import 'package:ChatZone/widgets/button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/logintext.dart';
import 'dashboard.dart';
import 'package:ChatZone/pages/logout.dart';
import 'package:ChatZone/authentication.dart';
import 'package:ChatZone/pages/userdetails.dart';

class LoginScreen extends StatefulWidget {
  File? pic;
  String? email;
  String? username;
  String? password;
  LoginScreen({this.email, this.username, this.password, this.pic});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  bool flag = false;
  String status = "";
  bool checktext = true;
  bool rememberme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(168, 7, 149, 168),
          image: DecorationImage(
              image: AssetImage("assets/image/bk.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(255, 26, 168, 186).withOpacity(0.2),
                  BlendMode.dstATop)),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 90),
                    child: Icon(
                      Icons.chat,
                      size: 70,
                      color: Colors.white,
                    )),
                Text(
                  "Let's Chat",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(234, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 105, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.cyan),
                                ),
                                Text(
                                  "Please login with your information",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.cyan),
                                )
                              ],
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          width: 300,
                          child: TextFormField(
                            style: TextStyle(color: Colors.cyan),
                            controller: usernameController,
                            decoration: InputDecoration(
                              labelText: "Username",
                              labelStyle:
                                  TextStyle(fontSize: 15, color: Colors.cyan),
                              hintText: "Enter Valid Username",
                              hintStyle: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(188, 0, 187, 212)),
                              contentPadding: EdgeInsets.all(15),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.cyan,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.cyan,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter an username";
                              } else if (value != widget.username) {
                                return "Enter correct username";
                              }
                            },
                            cursorColor: Colors.cyan,
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          width: 300,
                          child: TextFormField(
                            obscureText: checktext,
                            style: TextStyle(color: Colors.cyan),
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle:
                                  TextStyle(fontSize: 15, color: Colors.cyan),
                              hintText: "Enter Password",
                              hintStyle: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(188, 0, 187, 212)),
                              contentPadding: EdgeInsets.all(15),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.cyan,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.cyan,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    checktext = !checktext;
                                  });
                                },
                                child: Icon(
                                  size: 20,
                                  checktext
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.cyan,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter an password";
                              } else if (value != widget.password) {
                                return "Enter correct password";
                              }
                            },
                            cursorColor: Colors.cyan,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              CheckboxTheme(
                                data: CheckboxThemeData(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                      color: Colors.cyan,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Checkbox(
                                  activeColor: Colors.cyan,
                                  value: rememberme,
                                  onChanged: (value) {
                                    setState(() {
                                      rememberme = value!;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                "Remember me",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.cyan),
                              ),
                            ],
                          ),
                        ),
                        CommonButton(
                          buttonText: "LOGIN",
                          callback: () async {
                            var sharedPref =
                                await SharedPreferences.getInstance();
                            if (_key.currentState!.validate()) {
                              sharedPref.setBool(SplashScreen.keylogin, true);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainNavigation(
                                          )));
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Or Login with",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Tab(
                                      icon: Image.asset(
                                    "assets/image/facebook.png",
                                    width: 40,
                                  )),
                                  Tab(
                                      icon: Image.asset(
                                          "assets/image/twitter.png")),
                                  Tab(
                                      icon: Image.asset(
                                          "assets/image/github.png"))
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            },
                            child: Text(
                              "CREATE ACCOUNT",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.cyan),
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
