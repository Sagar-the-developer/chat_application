import 'dart:io';

import 'package:ChatZone/pages/yourdetails.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboardButton.dart';
import 'dashboardCircleAvatar.dart';

class DashboardTopContainer extends StatefulWidget {
  String? username;
  String? email;
  File? pic;

  DashboardTopContainer({this.username, this.email, this.pic});

  @override
  State<DashboardTopContainer> createState() => _DashboardTopContainerState();
}

class _DashboardTopContainerState extends State<DashboardTopContainer> {
  String _email = '';
  String _username = '';
  String _password = '';
  String _address = '';
  int _age = 0;
  String _imagePath = '';
  String _dob ="";
  bool _dataLoaded = false;
  @override
  void initState() {
    super.initState();
    _loadSharedPreferences();
  }

  _loadSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> userDetailsList = prefs.getStringList('userDetailsList') ?? [];
    String currentUser = prefs.getString('currentUser') ?? ''; 
    setState(() {
      _dataLoaded = true;
      if (userDetailsList.isNotEmpty) {
        List<String> userDetailsSplit = userDetailsList.firstWhere((userDetails) => userDetails.split(',')[0] == currentUser).split(',');
        _username = userDetailsSplit[0];
        _email = userDetailsSplit[1];
        _password = userDetailsSplit[2];
        _address = userDetailsSplit[3];
        _dob = userDetailsSplit[4];
        _age = int.parse(userDetailsSplit[5]);
        _imagePath = userDetailsSplit[6];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 70,
          decoration: BoxDecoration(
            color: Color(0xff02689b),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
        ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.92,
            height: MediaQuery.of(context).size.height * 0.16,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(11),
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyan.withOpacity(0.4),
                    blurRadius: 10,
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                          text: TextSpan(
                            text: "Hello\n",
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 18),
                        children: [
                          TextSpan(
                              text: "${_username}",
                              style: TextStyle(
                                  color: Colors.cyan,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold))
                        ],
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          DashboardButtonWedgit(
                            buttonText: "TODO LIST",
                            buttonTextColor: Colors.white,
                            buttonBgColor: Colors.cyan,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: EdgeInsets.all(10)),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Editprofile(callback:_loadSharedPreferences()))),
                              child: Text(
                                "Edit Profile",
                                style: TextStyle(color: Colors.black),
                              ))
                        ],
                      )
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.cyan,
                    radius: 40,
                    child: _imagePath == ""
                        ? Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.white,
                          )
                        : ClipOval(
                            child: Image.file(
                              File(_imagePath),
                              fit: BoxFit.cover,
                              width: 80,
                              height: 80,
                            ),
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
