import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User extends StatefulWidget {

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  List<UserDetails> _userDetailsList = [];

  @override
  void initState() {
    super.initState();
    _loadSharedPreferences();
  }

  _loadSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  List<String> userDetailsList = prefs.getStringList('userDetailsList') ?? [];
  setState(() {
    _userDetailsList = userDetailsList.map((userDetails) {
      List<String> userDetailsSplit = userDetails.split(',');
      return UserDetails(
        username: userDetailsSplit[0],
        email: userDetailsSplit[1],
        password: userDetailsSplit[2],
        address: userDetailsSplit[3],
        dob: userDetailsSplit[4],
        age: userDetailsSplit[5],
        imagePath: userDetailsSplit[6],
        isExpanded: false,
      );
    }).toList();
  });
}

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color(0xff02689b),
      title: Center(
        child: Text(
          'User Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      leading: BackButton(onPressed: () => null, color: Colors.white),
    ),
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/bk.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
                Color.fromARGB(125, 28, 171, 190).withOpacity(0.2),
                BlendMode.dstATop)),
        ),
      
      child: ListView(
        children: [
          ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _userDetailsList[index].isExpanded =!_userDetailsList[index].isExpanded;
              });
            },
            children: _userDetailsList.map((userDetails) {
              return ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text('${userDetails.username}'),
                    leading: userDetails.imagePath!= null
                       ? CircleAvatar(
                            backgroundColor: Colors.cyan,
                            radius: 20,
                            child: userDetails.imagePath == ""
                               ? Icon(
                                    Icons.person,
                                    size: 40,
                                    color: Colors.white,
                                  )
                                : ClipOval(
                                    child: Image.file(
                                      File(userDetails.imagePath),
                                      fit: BoxFit.cover,
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                          )
                        : null,
                  );
                },
                body: ListTile(
                  title: Text('Username: ${userDetails.username}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email: ${userDetails.email}'),
                      Text('Password: ${userDetails.password}'),
                      Text('Age: ${userDetails.age}'),
                      Text('DOB: ${userDetails.dob}'),
                    ],
                  ),
                ),
                isExpanded: userDetails.isExpanded,
              );
            }).toList(),
          ),
        ],
      ),
    ),
    );
}
}

class UserDetails {
  String username;
  String email;
  String password;
  String address;
  String dob;
  String age;
  String imagePath;
  bool isExpanded;

  UserDetails({
    required this.username,
    required this.email,
    required this.password,
    required this.address,
    required this.dob,
    required this.age,
    required this.imagePath,
    this.isExpanded = false,
  });
}