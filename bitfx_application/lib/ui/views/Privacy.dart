import 'package:bitfx_application/main.dart';
import 'package:bitfx_application/ui/colors/button_color.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: mainCyan,
      title: Text(''),
      ),

      body: WebView(
     
         initialUrl:  'https://bitfxcoachables.com/privacy-policy/',
      ),
    );
  }
}
