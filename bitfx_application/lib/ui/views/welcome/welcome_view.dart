
import 'package:bitfx_application/viewmodels/welcome/welcome_view_model.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../../colors/button_color.dart';
import '../../widgets/button.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

// Button button = new Button(
//   textValue: "Sign Up",
//   onPressed: () {},
// );

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeViewModel>.reactive(
      viewModelBuilder: () => WelcomeViewModel(),
      builder: (context, viewModel, child) => SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 5),
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Expanded(
                  child: DropShadowImage(
                      image: Image.asset('assets/bit_icon.png',),
                    borderRadius: 10,
                    blurRadius: 4,
                    offset: Offset(1, 1),
                    scale: 1,
                  ),
                ),
              ),
              Text(
                "Taking you with us to the stairway to success",
                style: GoogleFonts.antic(
                  textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: mainCyan,
                      decoration: TextDecoration.none),
                ),
              ),
              SizedBox(
                height: 50,
              ),

              Button(
                textValue: viewModel.login,
                onPressed: () {
                  viewModel.onLoginPress(context);
                },
              ),
              SizedBox(
                height: 30,
              ),
              //button

              Button(
                textValue: viewModel.signup,
                onPressed: () {
                  viewModel.onSignUpPress(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
