import 'dart:io';
import 'dart:math';

import 'package:ChatZone/main.dart';
import 'package:ChatZone/pages/userdetails.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Editprofile extends StatefulWidget {
  final Future callback;
  Editprofile({required this.callback});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  bool _dataLoaded = false;
  File? _image;
  String _imagePath = '';
  String _username = '';
  String _email = '';
  String _password = '';
  String _address = '';
  String _dob = '';
  int _age = 0;

  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  _loadSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> userDetailsList = prefs.getStringList('userDetailsList') ?? [];
    String currentUser = prefs.getString('currentUser') ?? '';
    setState(() {
      _dataLoaded = true;
      if (userDetailsList.isNotEmpty) {
        List<String> userDetailsSplit = userDetailsList
            .firstWhere(
                (userDetails) => userDetails.split(',')[0] == currentUser)
            .split(',');
        _username = userDetailsSplit[0];
        _email = userDetailsSplit[1];
        _password = userDetailsSplit[2];
        _address = userDetailsSplit[3];
        _dob = userDetailsSplit[4];
        _age = int.parse(userDetailsSplit[5]);
        _imagePath = userDetailsSplit[6];
      }
      else {
    setState(() {
      _dataLoaded = true;
    });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _loadSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.cyan,
        title: Text(
          "Edit Profile",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: _dataLoaded
          ? Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.cyan,
                        radius: 40,
                        child: _image != null
                            ? ClipOval(
                                child: Image.file(
                                  _image!,
                                  fit: BoxFit.cover,
                                  width: 80,
                                  height: 80,
                                ),
                              )
                            : _imagePath != ""
                                ? ClipOval(
                                    child: Image.file(
                                      File(_imagePath),
                                      fit: BoxFit.cover,
                                      width: 80,
                                      height: 80,
                                    ),
                                  )
                                : Icon(
                                    Icons.person,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextButton(
                        onPressed: () async {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25)),
                                  color: Color.fromARGB(203, 255, 255, 255),
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
                                                        255, 31, 212, 235))),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              foregroundColor: Color.fromARGB(
                                                  255, 31, 212, 235),
                                              radius: 30,
                                              child: GestureDetector(
                                                child: Icon(Icons.camera),
                                                onTap: () async {
                                                  final XFile? image =
                                                      await _picker.pickImage(
                                                          source: ImageSource
                                                              .camera);
                                                  if (image != null) {
                                                    setState(() {
                                                      _image = File(image.path);
                                                      _imagePath = image.path;
                                                    });
                                                    SharedPreferences prefs =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    prefs.setString("imagePath",
                                                        image.path);
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Camera",
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 31, 212, 235),
                                                fontWeight: FontWeight.w600),
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
                                                        255, 31, 212, 235))),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              foregroundColor: Color.fromARGB(
                                                  255, 31, 212, 235),
                                              radius: 30,
                                              child: GestureDetector(
                                                child: Icon(Icons.photo),
                                                onTap: () async {
                                                  final XFile? image =
                                                      await _picker.pickImage(
                                                          source: ImageSource
                                                              .gallery);
                                                  if (image != null) {
                                                    setState(() {
                                                      _image = File(image.path);
                                                      _imagePath = image.path;
                                                    });
                                                    SharedPreferences prefs =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    prefs.setString("imagePath",
                                                        image.path);
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Gallery",
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 31, 212, 235),
                                                fontWeight: FontWeight.w600),
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
                        child: Text(
                          "Edit Image",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 78, 224, 243)),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            "Full Name",
                            style: TextStyle(
                                color: Color.fromARGB(255, 78, 224, 243),
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          style: TextStyle(
                              color: Color.fromARGB(255, 78, 224, 243)),
                          initialValue: _username,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 78, 224, 243))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 78, 224, 243))),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                          onSaved: (value) => _username = value!,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            "Email",
                            style: TextStyle(
                                color: Color.fromARGB(255, 78, 224, 243),
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          style: TextStyle(
                              color: Color.fromARGB(255, 78, 224, 243)),
                          initialValue: _email,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 78, 224, 243))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 78, 224, 243))),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          onSaved: (value) => _email = value!,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            "Password",
                            style: TextStyle(
                                color: Color.fromARGB(255, 78, 224, 243),
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          style: TextStyle(
                              color: Color.fromARGB(255, 78, 224, 243)),
                          initialValue: _password,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 78, 224, 243))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 78, 224, 243))),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          onSaved: (value) => _password = value!,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            "Address",
                            style: TextStyle(
                                color: Color.fromARGB(255, 78, 224, 243),
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          style: TextStyle(
                              color: Color.fromARGB(255, 78, 224, 243)),
                          initialValue: _address,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 78, 224, 243))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 78, 224, 243))),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your address';
                            }
                            return null;
                          },
                          onSaved: (value) => _address = value!,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            "DOB",
                            style: TextStyle(
                                color: Color.fromARGB(255, 78, 224, 243),
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          style: TextStyle(
                              color: Color.fromARGB(255, 78, 224, 243)),
                          initialValue: _dob,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 78, 224, 243))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 78, 224, 243))),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                          readOnly: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your DOB';
                            }
                            return null;
                          },
                          onSaved: (value) => _dob = value!,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            "Age",
                            style: TextStyle(
                                color: Color.fromARGB(255, 78, 224, 243),
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          style: TextStyle(
                              color: Color.fromARGB(255, 78, 224, 243)),
                          initialValue: _age.toString(),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 78, 224, 243))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 78, 224, 243))),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                          readOnly: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your age';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            if (value != null) {
                              _age = int.parse(value);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                      child: SizedBox(
                    height: 0,
                  )),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    margin: EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          List<String> userDetailsList = [
                            _username,
                            _email,
                            _password,
                            _address,
                            _dob,
                            _age.toString(),
                            _imagePath,
                          ];
                          //prefs.setStringList(
                          //    'userDetailsList', userDetailsList);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                  'Changes saved successfully',
                                  style: TextStyle(color: Colors.white),
                                )),
                          );
                          await widget.callback;
                        }
                      },
                      child: Text(
                        "Save Changes",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
