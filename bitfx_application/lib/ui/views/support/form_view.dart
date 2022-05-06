import 'package:bitfx_application/core/services/auth_service.dart';
import 'package:bitfx_application/ui/colors/button_color.dart';
import 'package:bitfx_application/ui/widgets/button.dart';
import 'package:bitfx_application/ui/widgets/form_field.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class FormView extends StatefulWidget {
  FormView({Key? key}) : super(key: key);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  mainCyan,
                ],
              )),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.2,
                    ),
                    formFields(
                        fieldName: "Name", characterLength: 20, forrmLines: 1),
                    formFields(
                        fieldName: "Email", characterLength: 20, forrmLines: 1),
                    formFields(
                        fieldName: "Message",
                        characterLength: 100,
                        forrmLines: 1),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Button(
                        textValue: "Submit",
                        onPressed: () {
                          //TO-DO
                        })
                  ],
                ),
              ))),
    );
  }
}
