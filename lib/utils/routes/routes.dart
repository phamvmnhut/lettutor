import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:lettutor/controller/binding/home_binding.dart';
import 'package:lettutor/controller/binding/loading_binding.dart';
import 'package:lettutor/controller/binding/auth_binding.dart';
import 'package:lettutor/ui/auth/confirm_email.dart';
import 'package:lettutor/ui/auth/loading_auth.dart';
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
// import 'package:lettutor/ui/booking/';
import 'package:lettutor/ui/test/test.dart';
import 'package:lettutor/ui/tutor_detail/tutor_calendar.dart';
import 'package:lettutor/ui/tutor_detail/tutor_detail.dart';
import 'package:lettutor/ui/tutor_gen/tutor_gen.dart';
import 'package:lettutor/ui/profile/tutor_reg.dart';
import 'package:lettutor/ui/tutor_gen/tutor_search.dart';

import 'observers.dart';

class Routes {
  Routes._();

  static final RouteObserver<Route> observer = RouteObservers();

  // static variables
  static const String LOADING_AUTH = '/loading_auth';
  static const String HOME = '/home';
  static const String test = '/test';
  static const String SIGN_UP = '/sign_up';
  static const String SIGN_IN = '/sign_in';
  static const String FORGOT_PW = '/forgot_pw';
  static const String CONFIRM_EMAIL = '/confirm_email';
  static const String TUTOR_GEN = '/tutor_gen';
  static const String tutor_reg = '/tutor_reg';
  static const String tutor_search = '/tutor_search';
  static const String tutor_detail = '/tutor_detail';
  static const String tutor_calendar = '/tutor_calendar';
  static const String USER_PROFILE = '/user_profile';
  static const String BOOKING = '/booking';
  static const String COURSE = '/course';
  static const String SETTING = '/setting';
  static const String waiting_room = '/waiting_room';
  static const String video_learning = '/video_learning';
  static const String MESSAGE_GEN = '/message_gen';
  static const String MESSAGE_CHAT = '/message_chat';

  static final List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeUI(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOADING_AUTH,
      page: () => LoadingAuthUI(),
      binding: LoadingBinding(),
    ),
    GetPage(
      name: Routes.SIGN_IN,
      page: () => SignInUI(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => SignUpUI(),
    ),
    GetPage(
      name: Routes.FORGOT_PW,
      page: () => ForgotPwUI(),
    ),
    GetPage(
      name: Routes.CONFIRM_EMAIL,
      page: () => ConfirmEmailUI(),
    ),
    GetPage(
      name: Routes.SETTING,
      page: () => SettingUI(),
    ),
    GetPage(
      name: Routes.MESSAGE_GEN,
      page: () => MessageGenUI(),
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
