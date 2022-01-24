import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor/models/booking.dart';
import 'package:lettutor/services/booking/booking.dart';
import 'package:lettutor/services/booking/model.dart';

import 'dart:developer' as dev;

import 'package:lettutor/ui/learn/wating_room.dart';

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
    final response = await _service.fetchListBooking(
      query: GetListBookingQueryModel(dateTimeGte: DateTime.now(), sortBy: true),
    );
    if (response.error != null) {
      bookings = <BookingModel>[].obs;
    } else {
      if (response.bookings != null) {
        bookings.assignAll(response.bookings!);
      }
    }
    isLoading.value = false;
  }

  Future<void> getListHistory() async {
    isLoading.value = true;
    final response = await _service.fetchListBooking(
      query: GetListBookingQueryModel(dateTimeLte: DateTime.now()),
    );
    if (response.error != null) {
      bookings = <BookingModel>[].obs;
    } else {
      if (response.bookings != null) {
        bookings.assignAll(response.bookings!);
      }
    }
    isLoading.value = false;
  }

  navigateLearn({required BookingModel booking}) {
    Get.to(() => WaitingRoomUI(booking: booking), preventDuplicates: true);
  }

  Future<bool> bookClass(
      {required ScheduleTutorModel schedule, required String note}) async {
    isLoading.value = true;
    List<String> scheduleDetailIds =
        schedule.scheduleDetails!.map((e) => e.id!).toList();
    final response = await _service.bookClass(
      BookClassRequestModel(scheduleDetailIds: scheduleDetailIds, note: note),
    );
    isLoading.value = false;
    if (response != "") {
      Get.defaultDialog(
          middleText: response,
          textConfirm: 'OK',
          confirmTextColor: Colors.red,
          onConfirm: () {
            Get.back();
          });
      return false;
    } else {
      return true;
    }
  }

  editBooking({required BookingModel booking, required String note}) async {
    isLoading.value = true;
    final response =
        await _service.editBookedClass(note: note, bookedId: booking.id ?? "");
    isLoading.value = false;
    if (response != "") {
      Get.defaultDialog(
        middleText: response,
        textConfirm: 'OK',
        confirmTextColor: Colors.red,
        onConfirm: () {
          Get.back();
        },
      );
    } else {
      Get.back();
      getListBooking();
    }
  }

  cancelBooking({required BookingModel booking}) {
    Get.defaultDialog(
      title: "Are you sure to cancel this session ?",
      content: SizedBox(),
      confirmTextColor: Colors.red,
      onConfirm: () async {
        isLoading.value = true;
        final response = await _service.cancelBookedClass(
            CancelBookedClassRequestModel(
                scheduleDetailIds: booking.scheduleDetailId ?? ""));
        isLoading.value = false;
        if (response != "") {
          Get.defaultDialog(
            middleText: "Cancel this booked fail",
            textConfirm: 'OK',
            confirmTextColor: Colors.red,
            onConfirm: () {
              Get.back();
            },
          );
        } else {
          Get.back();
          getListBooking();
        }
      },
      onCancel: () {
        Get.back();
      },
    );
  }
}
