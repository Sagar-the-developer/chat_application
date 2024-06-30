import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/button.dart';
import '../widgets/logintext.dart';
import 'login.dart';
import 'package:ChatZone/widgets/dashboardTopContainer.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dob = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();
  //TextEditingController age = TextEditingController();
  TextEditingController address = TextEditingController();
  XFile? file;
  ImagePicker picker = ImagePicker();
  File? img;

  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 90),
                    child: Icon(
                      Icons.cloud,
                      size: 70,
                      color: Colors.white,
                    )),
                Text(
                  "See You At ChatZone",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: 37),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.73,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(224, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    margin: EdgeInsets.only(right: 140),
                                    child: Text(
                                      "Welcome",
                                      style: TextStyle(
                                          color: Colors.cyan,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(right: 80),
                                    child: Text(
                                      "Please Fill Your Details Wisely",
                                      style: TextStyle(
                                          color: Colors.cyan, fontSize: 13),
                                    )),
                              ],
                            ),
                            GestureDetector(
                              onTap: () async {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25)),
                                        color: Color.fromARGB(255, 11, 73, 81),
                                      ),
                                      height: 150,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          width: 2,
                                                          color: Color.fromARGB(
                                                              255,
                                                              31,
                                                              212,
                                                              235))),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    foregroundColor:
                                                        Color.fromARGB(
                                                            255, 31, 212, 235),
                                                    radius: 30,
                                                    child: GestureDetector(
                                                      child: Icon(Icons.camera),
                                                      onTap: () async {
                                                        final XFile? photo =
                                                            await picker.pickImage(
                                                                source:
                                                                    ImageSource
                                                                        .camera);
                                                        setState(() {
                                                          if (photo != null) {
                                                            img = File(
                                                                photo.path);
                                                            file = photo;
                                                          } else {
                                                            img = null;
                                                          }
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "Camera",
                                                  style: TextStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              31,
                                                              212,
                                                              235),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          width: 2,
                                                          color: Color.fromARGB(
                                                              255,
                                                              31,
                                                              212,
                                                              235))),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    foregroundColor:
                                                        Color.fromARGB(
                                                            255, 31, 212, 235),
                                                    radius: 30,
                                                    child: GestureDetector(
                                                      child: Icon(Icons.photo),
                                                      onTap: () async {
                                                        final XFile? photo =
                                                            await picker.pickImage(
                                                                source:
                                                                    ImageSource
                                                                        .gallery);
                                                        setState(() {
                                                          if (photo != null) {
                                                            img = File(
                                                                photo.path);
                                                            file = photo;
                                                          } else {
                                                            img = null;
                                                          }
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "Gallery",
                                                  style: TextStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              31,
                                                              212,
                                                              235),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(90, 18, 201, 238),
                                    radius: 40,
                                    child: img == null
                                        ? Icon(Icons.camera_alt,
                                            size: 40, color: Colors.cyan)
                                        : ClipOval(
                                            child: Image.file(
                                              img!,
                                              fit: BoxFit.cover,
                                              width: 80,
                                              height: 80,
                                            ),
                                          ),
                                  ),
                                  Container(
                                      child: Text(
                                    "Profile",
                                    style: TextStyle(
                                        color: Colors.cyan,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 300,
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.cyan),
                                    controller: email,
                                    decoration: InputDecoration(
                                      labelText: "Email",
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.cyan),
                                      hintText: "Enter Valid Email",
                                      hintStyle: TextStyle(
                                          fontSize: 10,
                                          color: const Color.fromARGB(
                                              188, 0, 187, 212)),
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
                                        return "Please enter an email";
                                      } else if (!RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value)) {
                                        return "Please enter an valid email";
                                      }
                                    },
                                    cursorColor: Colors.cyan,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Container(
                                  width: 300,
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.cyan),
                                    controller: username,
                                    decoration: InputDecoration(
                                      labelText: "Username",
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.cyan),
                                      hintText: "Enter Valid Username",
                                      hintStyle: TextStyle(
                                          fontSize: 10,
                                          color:
                                              Color.fromARGB(188, 0, 187, 212)),
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
                                      } else if (value.length <= 4) {
                                        return "username contains atleast 5 letters";
                                      }
                                    },
                                    cursorColor: Colors.cyan,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Container(
                                  width: 300,
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.cyan),
                                    controller: password,
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.cyan),
                                      hintText: "Enter Valid Password",
                                      hintStyle: TextStyle(
                                          fontSize: 10,
                                          color:
                                              Color.fromARGB(188, 0, 187, 212)),
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
                                        return "Please enter an password";
                                      } else if (!RegExp(
                                              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
                                          .hasMatch(value)) {
                                        return "Please enter an valid password";
                                      }
                                    },
                                    cursorColor: Colors.cyan,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Container(
                                  width: 300,
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.cyan),
                                    controller: address,
                                    decoration: InputDecoration(
                                      labelText: "Address",
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.cyan),
                                      hintText: "Enter Your Address",
                                      hintStyle: TextStyle(
                                          fontSize: 10,
                                          color:
                                              Color.fromARGB(188, 0, 187, 212)),
                                      contentPadding: EdgeInsets.all(15),
                                      border: InputBorder.none,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.cyan, width: 3),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.cyan, width: 3),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter your address";
                                      }
                                    },
                                    cursorColor: Colors.cyan,
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  width: 300,
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.cyan),
                                    controller: dob,
                                    decoration: InputDecoration(
                                      labelText: "Date of Birth",
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.cyan),
                                      contentPadding: EdgeInsets.all(15),
                                      border: InputBorder.none,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.cyan, width: 3),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.cyan, width: 3),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now(),
                                      );
                                      if (pickedDate != null) {
                                        setState(() {
                                          dob.text = DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                          DateTime currentDate = DateTime.now();
                                          int difference = currentDate.year -
                                              pickedDate.year;
                                          int month1 = currentDate.month;
                                          int month2 = pickedDate.month;
                                          int day1 = currentDate.day;
                                          int day2 = pickedDate.day;
                                          if (month2 > month1) {
                                            difference--;
                                          } else if (month1 == month2) {
                                            if (day2 > day1) {
                                              difference--;
                                            }
                                          }
                                          age.text = difference.toString();
                                        });
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(height: 12),
                                Container(
                                  width: 300,
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.cyan),
                                    controller: age,
                                    decoration: InputDecoration(
                                      labelText: "Age",
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.cyan),
                                      contentPadding: EdgeInsets.all(15),
                                      border: InputBorder.none,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.cyan, width: 3),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.cyan, width: 3),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    readOnly: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter your address";
                                      } else {
                                        int? age = int.tryParse(value);
                                        if (age == null) {
                                          return "Please enter a valid age";
                                        } else if (age < 18) {
                                          return "You are not an adult.";
                                        }
                                      }
                                    },
                                    cursorColor: Colors.cyan,
                                  ),
                                ),
                                SizedBox(height: 12),
                                CommonButton(
                                    buttonText: "CREATE ACCOUNT",
                                    callback: () {
                                      Future saveData() async {
                                        var prefs = await SharedPreferences
                                            .getInstance();
                                        List<String> userDetailsList =
                                            prefs.getStringList(
                                                    'userDetailsList') ??
                                                [];
                                        String imagePath = file != null ? file!.path : "";
                                        userDetailsList.add(
                                            '${username.text},${email.text},${password.text},${address.text},${dob.text},${age.text},${imagePath}');
                                        prefs.setStringList(
                                            'userDetailsList', userDetailsList);
                                        prefs.setString('currentUser', username.text);
                                      }
                                      if (_formKey.currentState!.validate()) {
                                        saveData();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen(
                                                      email: email.text,
                                                      username: username.text,
                                                      password: password.text,
                                                      pic: img,
                                                    )));
                                      }
                                    }),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
