import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/models/course.dart';

import 'package:lettutor/services/course/course.dart';
import 'package:lettutor/services/tutor/model.dart';

import 'dart:developer' as dev;

class CourseCtrl extends GetxController {
  static CourseCtrl get to => Get.find();

  late final CourseService _service;
  var loading = false.obs;
  var courses = <CourseModel>[].obs;
  
  @override
  void onInit() async {
    super.onInit();
    _service = Get.put(CourseService());
  }

  @override
  void onReady() {
    super.onReady();
    getListCourse();
    loading.listen((loadingState) {
      if (loadingState) {
        Get.dialog(
            Center(
              child: CircularProgressIndicator(),
            ),
            barrierDismissible: false);
      } else {
        Get.back();
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getListCourse() async {
    loading.value = true;
    final response = await _service.fetchListCourse();
    loading.value = false;
    if (response.error != null) {
      courses = <CourseModel>[].obs;
    } else {
      if (response.tutors != null) {
        courses.assignAll(response.tutors!);
      }
    }
  }

}
