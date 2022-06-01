import 'package:bitfx_application/ui/views/calculator/calculator_view.dart';
import 'package:bitfx_application/ui/views/courses/Video_view.dart';
import 'package:bitfx_application/ui/views/courses/courses_view.dart';
import 'package:bitfx_application/ui/views/profile/profile_view.dart';
import 'package:bitfx_application/ui/views/calendar/econmic_view.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';

import '../../colors/button_color.dart';
import '../Signals/signalView.dart';
import '../login/login_view.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final NavController navController = Get.put(NavController());

  List<Widget> bodyContent = [
    Signals(),
    CoursesView(),
    CalculatorView(),
    EconomicCalendarView(),
    ProfileView(),
  ];
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: bodyContent.elementAt(navController.selectedIndex),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.home_filled, size: 30, color: mainGrey),
          Icon(Icons.book_online_outlined, size: 30, color: mainGrey),
          Icon(Icons.calculate_sharp, size: 30, color: mainGrey),
          Icon(Icons.calendar_today, size: 30, color: mainGrey),
          Icon(Icons.supervised_user_circle_outlined,
              size: 30, color: mainGrey),
        ],
        color: mainCyan,
        buttonBackgroundColor: mainCyan,
        backgroundColor: mainGrey,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          navController.selectedIndex = index;
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}

class NavController extends GetxController {
  var _selectedIndex = 0.obs;

  get selectedIndex => _selectedIndex.value;
  set selectedIndex(index) => _selectedIndex.value = index;
}
