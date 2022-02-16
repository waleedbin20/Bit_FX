import 'package:bitfx_mobile_app/src/ui/colors/button_color.dart';
import 'package:flutter/material.dart';

class TextBoxWidget extends StatelessWidget {
  final String text;
  final String errorMessage;
  final Widget iconDesign;

  const TextBoxWidget(
      {Key? key,
      required this.text,
      required this.errorMessage,
      required this.iconDesign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border:
              Border.all(width: 1, color: mainCyan, style: BorderStyle.solid),
          boxShadow: [
            BoxShadow(
              color: mainCyan,
              spreadRadius: 1,
              blurRadius: 3,

            ),
          ],
        ),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return '$errorMessage';
            }
            return null;
          },
          cursorColor: mainCyan,
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: black,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
            prefixIcon: iconDesign,
            hintText: '$text',
            hintStyle: TextStyle(color: mainCyan)
          ),
        ),
      ),
    );
  }
}
