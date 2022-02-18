
import 'package:bitfx_application/ui/colors/button_color.dart';
import 'package:bitfx_application/ui/widgets/button.dart';
import 'package:bitfx_application/viewmodels/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/textBox.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(40, 50, 30, 10),
              child: Image(
                image: AssetImage('assets/bit_icon.png'),
                height: 200,
                width: 200,
                color: mainCyan,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(50, 10, 30, 10),
              child: TextBoxWidget(
                text: "Name",
                iconDesign: Icon(
                  Icons.verified_user,
                  color: mainCyan,
                ),
                errorMessage: 'Enter your name',
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(50, 3, 30, 10),
              child: TextBoxWidget(
                text: "Email",
                iconDesign: Icon(
                  Icons.email,
                  color: mainCyan,
                ),
                errorMessage: 'Enter your email',
              ),
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(50, 3, 30, 10),
                child: TextBoxWidget(
                  text: "Password",
                  iconDesign: Icon(
                    Icons.vpn_key,
                    color: mainCyan,
                  ),
                  errorMessage: 'Enter your password',
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(50, 3, 30, 10),
                child: TextBoxWidget(
                  text: "Confirm Password",
                  iconDesign: Icon(
                    Icons.vpn_key,
                    color: mainCyan,
                  ),
                  errorMessage: '',
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(50, 3, 30, 10),
                child: Button(textValue: "Signup", onPressed: () {})),

            SizedBox(
              height: 20,
            ),
           
            Padding(
                padding: EdgeInsets.fromLTRB(50, 5, 30, 10),
                child: Button(
                    textValue: "Login",
                    onPressed: () {
                      viewModel.login(context);
                    })),
          ],
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
