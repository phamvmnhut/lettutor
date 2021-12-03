import 'package:flutter/material.dart';
import 'package:lettutor/ui/course/course_gen.dart';
import 'package:lettutor/ui/message/message_gen.dart';
import 'package:lettutor/ui/profile/setting.dart';
import 'package:lettutor/ui/schedule/schedule.dart';
import 'package:lettutor/ui/tutor_gen/tutor_gen.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _selectedIndex = 0;

  static List<Widget>_widgetOptions= <Widget>[
    TutorGenUI(),
    MessageGenUI(),
    ScheduleUI(),
    CourseGenUI(),
    SettingUI(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:_widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.source_outlined),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
