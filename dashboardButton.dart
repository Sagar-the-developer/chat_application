import 'package:flutter/material.dart';

class DashboardButtonWedgit extends StatelessWidget {
  String? buttonText;
  var buttonBgColor = Colors.white;
  var buttonTextColor = Colors.white;
  var onPressed;
  DashboardButtonWedgit(
      {this.buttonText,
      required this.buttonBgColor,
      required this.buttonTextColor,});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:(){},
      child: Text(buttonText!),
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10),
          backgroundColor: buttonBgColor,
          foregroundColor: buttonTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }
}
