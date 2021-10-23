import 'package:flutter/material.dart';
import 'package:lettutor/constants/app_theme.dart';
import 'package:lettutor/constants/strings.dart';
import 'package:lettutor/ui/auth/sign_in.dart';
import 'package:lettutor/ui/course/course_gen.dart';
import 'package:lettutor/ui/home/home.dart';
import 'package:lettutor/ui/auth/sign_up.dart';
import 'package:lettutor/ui/learn/wating_room.dart';
import 'package:lettutor/ui/profile/setting.dart';
import 'package:lettutor/ui/profile/user_profile.dart';
import 'package:lettutor/ui/schedule/schedule.dart';
import 'package:lettutor/ui/test/test.dart';
import 'package:lettutor/ui/tutor_detail/tutor_detail.dart';
import 'package:lettutor/ui/tutor_gen/tutor_gen.dart';
import 'package:lettutor/ui/tutor_gen/tutor_reg.dart';
import 'package:lettutor/ui/tutor_gen/tutor_search.dart';
import 'package:lettutor/utils/routes/routes.dart';

class MyApp extends StatelessWidget {
  final bool isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: themeData,
      darkTheme: themeDataDark,
      themeMode: ThemeMode.light,
      routes: Routes.routes,
      home: TutorDetailUI(),
    );
  }
}
