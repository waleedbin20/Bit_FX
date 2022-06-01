import 'package:bitfx_application/ui/colors/button_color.dart';
import 'package:flutter/material.dart';

class formFields extends StatelessWidget {
  
//  final TextEditingController controller;
  final String fieldName;
  final int characterLength;
  final int forrmLines;
   formFields(
      {Key? key,
      // required this.controller,
      required this.fieldName,
      required this.characterLength,
      required this.forrmLines,
})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: TextFormField(
              // controller: controller,
            style: TextStyle(
                color: mainCyan, fontSize: 25, fontWeight: FontWeight.w300),
            initialValue: '',
            maxLength: characterLength,
            maxLines: forrmLines,
            decoration: InputDecoration(
              labelText: fieldName,
              labelStyle: TextStyle(
                  color: mainCyan, fontSize: 20, fontWeight: FontWeight.w600),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: mainCyan),
              ),
            ),
          )),
    );
  }
}


