import 'dart:developer';

import 'package:bitfx_application/core/services/auth_service.dart';
import 'package:bitfx_application/core/services/firebase_storage.dart';
import 'package:bitfx_application/ui/colors/button_color.dart';
import 'package:bitfx_application/ui/colors/cyan.dart';
import 'package:bitfx_application/ui/widgets/button.dart';
import 'package:bitfx_application/ui/widgets/profile_menu.dart';
import 'package:bitfx_application/ui/widgets/route_paths.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

StorageProviderr _storageProviderr = StorageProviderr();

  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  final user = FirebaseAuth.instance.currentUser!;

  ImagePreview() {
    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Image.file(
          File(_imageFile?.path ?? ""),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

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
              imageProfile(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                user.email!,
                style: TextStyle(fontSize: 17, color: cyan),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),

              // ProfileMenu(
              //   text: "My Account",
              //   icon: "assets/icon/icon.png",
              //   press: () => {},
              // ),
              ProfileMenu(
                text: "Follow US",
                icon: "assets/icon/icon.png",
                press: () =>
                    {Navigator.pushNamed(context, RoutePaths.followUs)},
              ),
              ProfileMenu(
                text: "Support",
                icon: "assets/icon/icon.png",
                press: () =>
                    {Navigator.pushNamed(context, RoutePaths.formPage)},
              ),
              ProfileMenu(
                text: "Privacy",
                icon: "assets/icon/icon.png",
                press: () =>
                  
                    // ignore: deprecated_member_use
                    {launch('https://bitfxcoachables.com/privacy-policy/')},
              ),

              // supportIcon(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),

              Button(
                textValue: "Log Out",
                onPressed: () {
                  AuthenticationService().signOut();
                  Navigator.pushNamed(context, RoutePaths.login);
                  var snackBar = SnackBar(
                      content: Text('You have successfully logged out'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  print('not working');
                },
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ],
          ),
        ),
      )),
    );
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

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        InkWell(
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 80.0,
            child: CircleAvatar(
              radius: 100.0,
              child: ClipOval(
                child: (_imageFile != null)
                    ? ImagePreview()
                    : Image.asset('assets/icon/icon.png'),
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              
              },
              label: Text("Camera"),
            ),
            TextButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
