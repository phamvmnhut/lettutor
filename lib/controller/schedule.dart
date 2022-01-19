import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/datas/local.dart';
import 'package:lettutor/models/schedule.dart';
import 'package:lettutor/ui/learn/video_learning.dart';
import 'package:lettutor/ui/learn/wating_room.dart';

class ScheduleCtrl extends GetxController {
  // late final ScheduleService _service;
  var schedules = <ScheduleModel>[].obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // add server
  }

  @override
  void onReady() {
    super.onReady();
    schedules.addAll(LocalData.scheduleList);
    isLoading.listen((loadingState) {
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

  maskHistory(int scheduleIndex) {
    var changed = schedules[scheduleIndex];
    changed.isHistory = !changed.isHistory;
    schedules[scheduleIndex] = changed;
  }

  navigateLearn(String scheduleId) {
    DateTime current = DateTime.now();
    // TODO
    // demo is using id = index
    int index = int.parse(scheduleId);
    if (schedules[index].startTime.isAfter(current)) {
      Get.to(() => WaitingRoomUI(), preventDuplicates: true);
    } else {
      Get.to(() => VideoLearingUI(), preventDuplicates: true);
    }
  }

}
