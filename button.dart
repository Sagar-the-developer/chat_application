import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  String? buttonText;
  final VoidCallback? callback;
  VoidCallback? callback1;
  CommonButton({this.buttonText, this.callback, this.callback1});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          callback!();
        },
        onLongPress: () {
          callback1!();
        },
        child: Text(buttonText ?? "Submit", style: TextStyle(fontSize: 15)),
        style: ElevatedButton.styleFrom(
          elevation: 20,
          shadowColor: const Color.fromARGB(255, 39, 220, 244),
          foregroundColor: Colors.white,
          backgroundColor: Colors.cyan,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
