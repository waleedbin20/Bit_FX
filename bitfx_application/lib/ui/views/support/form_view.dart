 import 'package:bitfx_application/core/services/auth_service.dart';
import 'package:bitfx_application/ui/colors/button_color.dart';
import 'package:bitfx_application/ui/widgets/button.dart';
import 'package:bitfx_application/ui/widgets/form_field.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';

class FormView extends StatefulWidget {
  FormView({Key? key}) : super(key: key);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {

  TextEditingController name = TextEditingController();
  TextEditingController email1 = TextEditingController();
  TextEditingController subject1= TextEditingController(text: 'initial value');
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
                        fieldName: "Name",
                        // controller: name,
                         characterLength: 20, forrmLines: 1),
                    formFields(
                        fieldName: "Email",
                        // controller: email1,
                         characterLength: 20, forrmLines: 1),
                    formFields(
                      // controller: subject1,
                        fieldName: "Message",
                        characterLength: 100,
                        forrmLines: 1),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Button(
                        textValue: "Submit",
                        onPressed: () {
                          sendemail();
                        })
                  ],
                ),
              ))),
    );
  }

//   Future sendemail() async {
// final email = 'bitfxcoachables@gmail.com';
// final password = 'password';

// // ignore: deprecated_member_use
// final smtpServer = gmail(email, password);
    
//     final message =  Message()
//     ..from = Address(email, 'name')
//     ..recipients = ['bitfxcoachables@gmail.com']
//     ..subject = 'this is the subject'
//     ..text = 'this is the message';

//     try {
//       await send(message, smtpServer);
//  var snackBar = SnackBar(
//                                 content: Text(
//                                     'Email sent successfully'));
//                             ScaffoldMessenger.of(context)
//                                 .showSnackBar(snackBar);

//     } on MailerException catch(e){
//       print(e);
//     }
//       {

//       }
//     }
Future sendemail() async {
String username = 'username@gmail.com';
  String password = 'password';

  final smtpServer = gmail(username, password);
  // Create our message.
  final message = Message()
    ..from = Address(username, 'Your name')
    ..recipients.add('bitfxcoachables@gmail.com')
    ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
  // DONE
  }
}
