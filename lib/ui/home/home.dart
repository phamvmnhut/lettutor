import 'package:flutter/material.dart';
import 'package:lettutor/controller/home.dart';
import 'package:lettutor/ui/booking/booking.dart';
import 'package:lettutor/ui/course/course_gen.dart';
import 'package:lettutor/ui/message/message_gen.dart';
import 'package:lettutor/ui/profile/setting.dart';
import 'package:lettutor/ui/tutor_gen/tutor_gen.dart';
import 'package:get/get.dart';

class HomeUI extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeCtrl>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                TutorGenUI(),
                MessageGenUI(),
                BookingUI(),
                CourseGenUI(),
                SettingUI(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.redAccent,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(
                icon: Icons.home,
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                icon: Icons.chat,
                label: 'Message',
              ),
              _bottomNavigationBarItem(
                icon: Icons.school,
                label: 'Schedule',
              ),
              _bottomNavigationBarItem(
                icon: Icons.source_outlined,
                label: 'Course',
              ),
              _bottomNavigationBarItem(
                icon: Icons.settings,
                label: 'Setting',
              ),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   Color disabledColor = Theme.of(context).disabledColor;
  //   Color primaryColor = Theme.of(context).primaryColor;
  //   return Scaffold(
  //     body: Center(
  //       child:_widgetOptions.elementAt(_selectedIndex),
  //     ),
  //     bottomNavigationBar: BottomNavigationBar(
  //       items: <BottomNavigationBarItem>[
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.home),
  //           label: 'Home',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.chat),
  //           label: 'Message',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.school),
  //           label: 'Schedule',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.source_outlined),
  //           label: 'Course',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.settings),
  //           label: 'Setting',
  //         ),
  //       ],
  //       currentIndex: _selectedIndex,
  //       unselectedItemColor: disabledColor,
  //       selectedItemColor: primaryColor,
  //       onTap: _onItemTapped,
  //     ),
  //   );
  // }
}
