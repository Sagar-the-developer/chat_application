// Box Decoration for LinearGradient

import 'package:flutter/material.dart';

class Asset extends StatelessWidget {
  @override
  BoxDecoration boxDecoration(Gradient linearGradient) {
    return BoxDecoration(
      gradient: linearGradient,
    );
  }

  LinearGradient linearGradient(Color color1, Color color2,
      AlignmentGeometry begin, AlignmentGeometry end) {
    return LinearGradient(
      colors: [color1, color2],
      begin: begin,
      end: end,
    );
  }
//End of LinearGradient

// Text for container
  Text text(String str, TextStyle style) {
    return Text(
      str,
      style: style,
    );
  }

  TextStyle style(FontWeight weigth, double fontsize, Color color) {
    return TextStyle(
      fontSize: fontsize,
      fontWeight: weigth,
      color: color,
    );
  }
//end of text

//Text feild design
  TextFormField textField(
      /* TextEditingController controller,*/ InputDecoration input) {
    return TextFormField(
      // controller: controller,
      decoration: input,
      style: TextStyle(color: Colors.white),
    );
  }

  InputDecoration input(String label, String hint) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white, width: 4),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white, width: 4),
      ),
      labelText: label,
      labelStyle: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      hintText: hint,
      hintStyle: TextStyle(fontSize: 15, color: Colors.white),
    );
  }
//end of textformfeild

//ElevatedButton design
  ElevatedButton elevatedButton(Function() pressed, text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        //primary: Colors.white.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Add border radius
        ),
      ),
      onPressed: pressed,
      child: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
