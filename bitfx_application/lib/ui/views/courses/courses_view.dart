import 'package:bitfx_application/ui/widgets/button.dart';
import 'package:flutter/material.dart';

import '../../colors/button_color.dart';
import '../../widgets/route_paths.dart';

class CoursesView extends StatefulWidget {
  CoursesView({Key? key}) : super(key: key);

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
        //automaticallyImplyLeading: false,
        backgroundColor: mainCyan,
        title: Text(
          "Courses",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Button(textValue: 'Video Lectures', onPressed: (){
                      Navigator.pushNamed(
                                  context, RoutePaths.videoScreen);
                    }),
 SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Button(textValue: 'Pdf View', onPressed: (){
                      Navigator.pushNamed(
                                  context, RoutePaths.pdfScreen);
                    })
        ]),
      ),
    );

  
  }
}
