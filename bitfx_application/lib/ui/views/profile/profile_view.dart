import 'package:bitfx_application/ui/colors/button_color.dart';
import 'package:bitfx_application/ui/widgets/button.dart';
import 'package:bitfx_application/ui/widgets/profile_menu.dart';
import 'package:bitfx_application/ui/widgets/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),

              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              circleimage(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),

              ProfileMenu(
                text: "My Account",
                icon: "bitfx.png",
                press: () => {},
              ),
              ProfileMenu(
                text: "Follow US",
                icon: "assets/bitfx.png",
                press: () => {},
              ),
              ProfileMenu(
                text: "Support",
                icon: "assets/bitfx.png",
                press: () => {},
              ),
              ProfileMenu(
                text: "Privacy",
                icon: "assets/bitfx.png",
                press: () => {},
              ),

              // supportIcon(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Button(
                  textValue: "Log Out",
                  onPressed: () {
                    Navigator.pushNamed(context, RoutePaths.login);
                    
                  }),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ],
          ),
        ),
      )),
    );
  }
}

Widget circleimage(context) {
  return SizedBox(
    height: MediaQuery.of(context).size.width * 0.4,
    width: MediaQuery.of(context).size.height * 0.4,
    // height: 300,
    // width: 200,
    child: Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        CircleAvatar(
          backgroundColor: mainCyan,
        ),
        Positioned(
            bottom: MediaQuery.of(context).size.width * 0,
            right: MediaQuery.of(context).size.height * 0.1,
            // bottom: 0,
            // right: -25,
            child: RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Color(0xFFF5F6F9),
              child: Icon(
                Icons.camera_alt_outlined,
                color: Colors.blue,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            )),
      ],
    ),
  );
}
