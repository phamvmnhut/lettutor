import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:lettutor/features/binding/home_binding.dart';
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

import 'observers.dart';

class Routes {
  Routes._();
  static final RouteObserver<Route> observer = RouteObservers();

  //static variables
  static const String HOME = '/';
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

  static final List<GetPage> routes = [
    // 免登陆
    GetPage(
      name: Routes.HOME,
      page: () => HomeUI(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.SIGN_IN,
    //   page: () => SignInPage(),
    //   binding: SignInBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.SIGN_UP,
    //   page: () => SignUpPage(),
    //   binding: SignUpBinding(),
    // ),
    //
    // // 需要登录
    // GetPage(
    //   name: AppRoutes.Application,
    //   page: () => ApplicationPage(),
    //   binding: ApplicationBinding(),
    //   middlewares: [
    //     RouteAuthMiddleware(priority: 1),
    //   ],
    // ),
    //
    // // 分类列表
    // GetPage(
    //   name: AppRoutes.Category,
    //   page: () => CategoryPage(),
    //   binding: CategoryBinding(),
    // ),
  ];
}
