
import 'package:bitfx_application/core/services/auth_service.dart';
import 'package:bitfx_application/ui/colors/button_color.dart';
import 'package:bitfx_application/ui/widgets/button.dart';
import 'package:bitfx_application/ui/widgets/route_paths.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/textBox.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(40, 130, 30, 10),
            child: DropShadowImage(
              image: Image.asset(
                'assets/icon/icon.png',
                width: 120,
                height: 120,
                color: mainCyan,
              ),
              borderRadius: 0,
              blurRadius: 0,
              offset: Offset(1, 1),
              scale: 0,
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextBoxWidget(
                controller: email,
                text: "Email",
                iconDesign: Icon(
                  Icons.email,
                  color: mainCyan,
                ),
                errorMessage: 'Enter your email',
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(30, 5, 30, 10),
              child: TextBoxWidget(
                controller: password,
                text: "Password",
                iconDesign: Icon(
                  Icons.vpn_key,
                  color: mainCyan,
                ),
                errorMessage: 'Enter your password',
              )),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(30, 5, 30, 10),
              child: Button(
                  textValue: "Login",
                  onPressed: () {

                    AuthenticationService()
                  .signIn(
                email: email.text.trim(),
                password: password.text.trim(),
              )
                  .then((value) {
                if (value) {
                 Navigator.pushNamed(context, RoutePaths.bottomNavBar);
                } else {
                  var snackBar =
                      SnackBar(content: Text('Credentials Not Matched'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              });
                   
                  })),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
             
              Padding(
                padding: EdgeInsets.fromLTRB(95, 15, 30, 10),
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ' ,
                    style: GoogleFonts.antic(
                          textStyle:TextStyle(color: mainCyan, fontSize: 15)),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'SIGNUP',
                        style: GoogleFonts.antic(
                          textStyle: TextStyle(                        
                            fontWeight: FontWeight.bold, color: mainCyan),
                        ),               
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () =>
                              Navigator.pushNamed(context, RoutePaths.signup),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
