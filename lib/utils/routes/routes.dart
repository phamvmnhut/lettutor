import 'package:flutter/material.dart';
import 'package:lettutor/ui/course/course_gen.dart';
import 'package:lettutor/ui/home/home.dart';
import 'package:lettutor/ui/auth/sign_in.dart';
import 'package:lettutor/ui/auth/sign_up.dart';
import 'package:lettutor/ui/auth/forgot_pw.dart';
import 'package:lettutor/ui/learn/video_learning.dart';
import 'package:lettutor/ui/learn/wating_room.dart';
import 'package:lettutor/ui/message/message_chat.dart';
import 'package:lettutor/ui/message/message_gen.dart';
import 'package:lettutor/ui/profile/setting.dart';
import 'package:lettutor/ui/profile/user_profile.dart';
import 'package:lettutor/ui/schedule/schedule.dart';
import 'package:lettutor/ui/test/test.dart';
import 'package:lettutor/ui/tutor_detail/tutor_calendar.dart';
import 'package:lettutor/ui/tutor_detail/tutor_detail.dart';
import 'package:lettutor/ui/tutor_gen/tutor_gen.dart';
import 'package:lettutor/ui/tutor_gen/tutor_reg.dart';
import 'package:lettutor/ui/tutor_gen/tutor_search.dart';

class Routes {
  Routes._();

  //static variables
  static const String home = '/home';
  static const String test = '/test';
  static const String sign_up = '/sign_up';
  static const String sign_in = '/sign_in';
  static const String forgot_pw = '/forgot_pw';
  static const String tutor_gen = '/tutor_gen';
  static const String tutor_reg = '/tutor_reg';
  static const String tutor_search = '/tutor_search';
  static const String tutor_detail = '/tutor_detail';
  static const String tutor_calendar = '/tutor_calendar';
  static const String user_profile = '/user_profile';
  static const String schedule = '/schedule';
  static const String course = '/course';
  static const String setting = '/setting';
  static const String waiting_room = '/waiting_room';
  static const String video_learning = '/video_learning';
  static const String message_gen = '/message_gen';
  static const String message_chat = '/message_chat';

  static final routes = <String, WidgetBuilder>{
    sign_in: (BuildContext context) => SignInUI(),
    home: (BuildContext context) => HomeUI(),
    test: (BuildContext context) => TestUI(),
    sign_up: (BuildContext context) => SignUpUI(),
    forgot_pw: (BuildContext context) => ForgotPwUI(),
    tutor_gen: (BuildContext context) => TutorGenUI(),
    tutor_reg: (BuildContext context) => TutorRegUI(),
    tutor_search: (BuildContext context) => TutorSearchUI(),
    tutor_detail: (BuildContext context) => TutorDetailUI(),
    tutor_calendar: (BuildContext context) => TutorCalendarUI(),
    user_profile: (BuildContext context) => ProfileUI(),
    schedule: (BuildContext context) => ScheduleUI(),
    course: (BuildContext context) => CourseGenUI(),
    setting: (BuildContext context) => SettingUI(),
    waiting_room: (BuildContext context) => WaitingRoomUI(),
    video_learning: (BuildContext context) => VideoLearingUI(),
    message_gen: (BuildContext context) => MessageGenUI(),
    message_chat: (BuildContext context) => MessageChatUI(),
  };
}
