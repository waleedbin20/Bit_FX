
import 'package:bitfx_application/ui/colors/button_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String textValue;
  //final VoidCallback onPressed;
  final Function onPressed;
  const Button({Key? key, required this.textValue, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(20),
      elevation: 25,
      shadowColor: mainCyan,
      child: ElevatedButton(
        onPressed: () {
           onPressed();
        },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: Ink(
          decoration: BoxDecoration(
              color:mainCyan,
              borderRadius: BorderRadius.circular(20)),
          child: Container(
            height: 1.1 * (MediaQuery.of(context).size.height / 20),
            width: 4 * (MediaQuery.of(context).size.width / 10),
            alignment: Alignment.center,
            child: Text(
              '$textValue',
              style: GoogleFonts.antic(
                          textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
            ),
          ),
        ),
      ),
    );
  }
}
