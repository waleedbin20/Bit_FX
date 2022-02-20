import 'package:bitfx_application/ui/colors/button_color.dart';
import 'package:flutter/material.dart';

class CalculatorTextBox extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const CalculatorTextBox(
      {Key? key, required this.text, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      child: FittedBox(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: mainCyan,
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.attach_money_outlined,
                  size: 30,
                ),
                Text(text,
                    style: TextStyle(
                        fontSize: 20.0,
                        height: 1.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
                SizedBox(width: 40),
                Row(
                  children: [
                    Container(
                        width: 70.0,
                        height: 10,
                        child: TextField(
                            controller: controller,
                            cursorColor: Colors.black,
                            style: TextStyle(
                                fontSize: 20.0,
                                height: 1.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                                )))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


