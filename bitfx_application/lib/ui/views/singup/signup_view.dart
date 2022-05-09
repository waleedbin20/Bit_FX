import 'package:bitfx_application/core/services/auth_service.dart';
import 'package:bitfx_application/ui/colors/button_color.dart';
import 'package:bitfx_application/ui/widgets/button.dart';
import 'package:bitfx_application/viewmodels/login/login_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../widgets/route_paths.dart';
import '../../widgets/textBox.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpass = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(40, 130, 30, 10),
                child: Image(
                  image: AssetImage('assets/icon/icon.png'),
                  height: 120,
                  width: 120,
                  color: mainCyan,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 30, 10),
                child: TextBoxWidget(
                  controller: name,
                  text: "Name",
                  iconDesign: Icon(
                    Icons.verified_user,
                    color: mainCyan,
                  ),
                  errorMessage: 'Enter your name',
                  obsureText: false,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Enter your name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 30, 10),
                child: TextBoxWidget(
                  controller: email,
                  text: "Email",
                  iconDesign: Icon(
                    Icons.email,
                    color: mainCyan,
                  ),
                  errorMessage: 'Enter your email',
                  obsureText: false,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 30, 10),
                  child: TextBoxWidget(
                    controller: password,
                    text: "Password",
                    iconDesign: Icon(
                      Icons.vpn_key,
                      color: mainCyan,
                    ),
                    errorMessage: 'Enter your password',
                    obsureText: true,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Enter your password';
                      }
                      return null;
                    },
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 30, 10),
                child: TextBoxWidget(
                  controller: confirmpass,
                  text: "Confirm Password",
                  iconDesign: Icon(
                    Icons.vpn_key,
                    color: mainCyan,
                  ),
                  errorMessage: '',
                  obsureText: true,
                  validator: (val) {
                    if (val!.isEmpty) return 'Enter your password';
                    if (val != password.text)
                      return 'The password do not match';
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 19,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 30, 10),
                child: Button(
                  textValue: "Signup",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Validated form");
                      AuthenticationService()
                          .signUp(
                        name: name.text.trim(),
                        email: email.text.trim(),
                        password: password.text.trim(),
                        confirmPass: confirmpass.text.trim(),
                      )
                          .then(
                        (value) {
                          if (value) {
                            print('value is true');
                            Navigator.pushNamed(
                                context, RoutePaths.bottomNavBar);
                            AuthenticationService().sendEmailVerification();
                          } else {
                            print('value is false');
                            var snackBar = SnackBar(
                                content: Text(
                                    'The email already exists. Please try again with a different account.'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(43, 15, 30, 10),
                child: RichText(
                  text: TextSpan(
                    text: 'Have have an account? ',
                    style: TextStyle(color: mainCyan),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: mainCyan),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () =>
                              Navigator.pushNamed(context, RoutePaths.login),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
