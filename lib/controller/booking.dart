import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor/models/booking.dart';
import 'package:lettutor/services/booking/booking.dart';

class BookingCtrl extends GetxController {
  static BookingCtrl get to => Get.find();

  var bookings = <BookingModel>[].obs;
  late final BookingService _service;

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _service = Get.put<BookingService>(BookingService());
  }

  @override
  void onReady() {
    super.onReady();
    getListBooking();
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

  Future<void> getListBooking() async {
    isLoading.value = true;
    final response = await _service.fetchListBooking();
    if (response.error != null) {
      bookings = <BookingModel>[].obs;
    } else {
      if (response.bookings != null) {
        bookings.assignAll(response.bookings!);
      }
    }
    isLoading.value = false;
  }

  maskHistory(int scheduleIndex) {
    var changed = bookings[scheduleIndex];
    // changed.isHistory = !changed.isHistory;
    bookings[scheduleIndex] = changed;
  }

  navigateLearn(String scheduleId) {
    //   DateTime current = DateTime.now();
    //   // TODO
    //   // demo is using id = index
    //   int index = int.parse(scheduleId);
    //   if (schedules[index].startTime.isAfter(current)) {
    //     Get.to(() => WaitingRoomUI(), preventDuplicates: true);
    //   } else {
    //     Get.to(() => VideoLearingUI(), preventDuplicates: true);
    //   }
  }
}
