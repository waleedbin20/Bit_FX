import 'package:bitfx_application/main.dart';
import 'package:bitfx_application/ui/colors/button_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FollowUs extends StatelessWidget {
  const FollowUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Follow Us',
                style: TextStyle(color: mainCyan, fontSize: 40),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(FontAwesomeIcons.facebook, size: 30.0),
                      onPressed: () {
                        print('facebook');
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(FontAwesomeIcons.instagram, size: 30.0),
                      onPressed: () {
                        launch('https://www.instagram.com/b.i.tfx/');
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(FontAwesomeIcons.youtube, size: 30.0),
                      onPressed: () {
                        launch(
                            'https://youtube.com/channel/UCnXVr1Emmb4x_yhsFeRatjw');
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(FontAwesomeIcons.telegram, size: 30.0),
                      onPressed: () {
                        launch('https://t.me/FOREXBASICIT');
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
