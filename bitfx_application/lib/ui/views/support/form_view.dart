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

sendMail() async {
    String username = 'bitfxcoachables@gmail.com';
    String password = 'enteryourpassword';

    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username)
      ..recipients.add('bitfxcoachables@gmail.com')

      ..subject = 'Mail using mailer package :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>Write the content here</h1>\n<p>Hey! its easy use html tags for alignments</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      // Toast.show("You have clicked the Button! and email sent", context, duration: 3, gravity:  Toast.CENTER);
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

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
                          sendMail();
                         
                        })
                  ],
                ),
              ))),
    );
  }
}




// void sendEmail() async {
//   final user = await AuthService.SignIn();

//   if (user == null) return;
//   final email = user.email;
//   final auth = await user.authentication;
//   final token = auth.accessToken;

//   print('Authenticated: $email');

//   AuthService.SignOut();
//   final smtpServer = gmailSaslXoauth2(email, token!);

//   // Create our message.
//   final message = Message()
//     ..from = Address(email, 'Rockyy')
//     ..recipients.add('bitfxcoachables@gmail.com')
//     ..ccRecipients.addAll(['bitfxcoachables@gmail.com'])
//     ..subject = 'This is a test email :: 😀 :: ${DateTime.now()}'
//     ..text = 'Hello, Thank you for contacting me.\nWelcome to my course.';

//   try {
//     final sendReport = await send(message, smtpServer);
//     print('Message sent: ' + sendReport.toString());
//   } on MailerException catch (e) {
//     print('Message not sent.');
//     for (var p in e.problems) {
//       print('Problem: ${p.code}: ${p.msg}');
//     }
  // }
// }
