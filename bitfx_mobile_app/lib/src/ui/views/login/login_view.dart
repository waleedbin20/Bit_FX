import 'package:bitfx_mobile_app/src/ui/colors/button_color.dart';
import 'package:bitfx_mobile_app/src/ui/widgets/button.dart';
import 'package:bitfx_mobile_app/src/ui/widgets/route_paths.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../../widgets/textBox.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

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
                'assets/bit_icon.png',
                width: 200,
                height: 200,
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
                    Navigator.pushNamed(context, RoutePaths.bottomNavBar);
                  })),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Text(
                  'Forgot password',
                  style: TextStyle(color: mainCyan),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: RichText(
                  text: TextSpan(
                    text: 'New User? ',
                    style: TextStyle(color: mainCyan),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'SIGNUP',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: mainCyan),
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
