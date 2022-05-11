import 'package:bitfx_application/ui/colors/button_color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Signals extends StatefulWidget {
  Signals({Key? key}) : super(key: key);

  @override
  State<Signals> createState() => _SignalsState();
}

class _SignalsState extends State<Signals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainCyan,
        title: Center(
            child: Text(
          "Signals",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        )),
        automaticallyImplyLeading: false,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: Image.asset(
            "assets/images/U3AN.gif",
            height: 250.0,
            width: 225.0,
          )),
    );
  }
}
