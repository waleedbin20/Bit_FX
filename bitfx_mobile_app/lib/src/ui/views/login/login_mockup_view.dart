// import 'package:bitfx_mobile_app/src/ui/colors/button_color.dart';
// import 'package:bitfx_mobile_app/src/ui/widgets/button.dart';
// import 'package:flutter/material.dart';

// import '../../widgets/textBox.dart';



// class MyHome extends StatefulWidget {
//   @override
//   _MyHomeState createState() => _MyHomeState();
// }

// class _MyHomeState extends State<MyHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(resizeToAvoidBottomInset: false,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.fromLTRB(30, 56, 30, 10),
//             child: Image(
//               image: AssetImage('assets/bit_icon.png'),
//               height: 200,
//               width: 200,
//               color: mainCyan,
//             ),
//           ),
//           Padding(padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
//             child: TextBoxWidget(text: "Email", iconDesign: Icon(Icons.email, color: mainCyan,),)
//           ),
//           Padding(padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
//             child: TextBoxWidget(text: "Password", iconDesign: Icon(Icons.vpn_key, color: mainCyan,),)
//           ),
//           SizedBox(height: 20,),
//           Padding(padding: EdgeInsets.fromLTRB(30, 5, 30, 10),
//             child: Button(textValue: "Login", onPressed: (){})
//           ),
//           SizedBox(height: 20,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Padding(padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
//                 child: Text('Forgot password',
//                   style: TextStyle(
//                     color: mainCyan
//                   ),
//                 ),
//               ),
//               Padding(padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
//                 child: Text('New user? SIGN UP',
//                   style: TextStyle(
//                       color: mainCyan
//                   ),
//                 ),
//               )
//             ],
//           ),
//           Column(
//             children: <Widget>[
//               Padding(padding: EdgeInsets.fromLTRB(30, 50, 30, 10),
//                 child: Text('or login with',
//                   style: TextStyle(
//                       color: mainCyan
//                   ),
//                 ),
//               ),
//               Padding(padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Icon(Icons.facebook,
//                       size: 40,
//                       color: mainCyan,
//                     ),
//                     Icon(Icons.fingerprint,
//                       size: 40,
//                       color: mainCyan,
//                     )
//                   ],
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//       backgroundColor: Colors.black,
//     );
//   }
// }