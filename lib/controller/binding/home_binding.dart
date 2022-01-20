import 'package:get/get.dart';

import 'package:lettutor/controller/home.dart';
import 'package:lettutor/controller/user.dart';
import 'package:lettutor/controller/tutor.dart';
import 'package:lettutor/controller/message.dart';
import 'package:lettutor/controller/course.dart';
import 'package:lettutor/controller/setting.dart';

import 'dart:developer' as dev;

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    dev.log("check", name: "Home Binding");

    Get.put<HomeCtrl>(HomeCtrl());
    Get.put<UserCtrl>(UserCtrl());
    Get.put<TutorCtrl>(TutorCtrl());
    Get.put<MessageCtrl>(MessageCtrl());
    Get.put<CourseCtrl>(CourseCtrl());
    Get.put<SettingCtrl>(SettingCtrl());
  }
}
