import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor/models/tutor.dart';

import 'package:lettutor/ui/message/message_chat.dart';

import 'dart:developer' as dev;

class MessageCtrl extends GetxController {
  static MessageCtrl get to => Get.find();

  // late final TutorService _service;
  var loading = false.obs;
  var tutors = <TutorModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    // _service = Get.put(TutorService());
  }

  @override
  void onReady() {
    super.onReady();
    getListMessage();
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

  Future<void> getListMessage() async {
    loading.value = true;
    tutors.assignAll([
      TutorModel(
          id: "id",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          email: "email",
          avatar: "https://images.unsplash.com/photo-1642567213587-a443dad5508d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80",
          video: "video",
          name: "name",
          country: "vn",
          bio: "bio",
          education: "education",
          experience: "experience",
          profession: "profession",
          targetStudent: "targetStudent",
          interests: "interests",
          price: 10,
          userId: "userId",
          rating: 5,
          feedbacks: [])
    ]);
    loading.value = false;
  }

  // Future<GetTutorInformationByIdResponseModel> getTutorMessage(
  //     String tutorId) async {
  //   loading.value = true;
  //   loading.value = false;
  //
  //   return response;
  // }

  searchMessage(String q) async {
    loading.value = true;

    loading.value = false;
  }

  navigateDetail(String tutorId) async {
    // selected
    // var data = await getTutorDetail(tutorId);
    // if (data.error != null) {
    //   Get.defaultDialog(
    //       middleText: "Fetch data fail",
    //       textConfirm: 'OK',
    //       confirmTextColor: Colors.red,
    //       onConfirm: () {
    //         Get.back();
    //       });
    // } else {
    //   Get.to(
    //           () => TutorDetailUI(
    //         data: data.tutorDetail!,
    //       ),
    //       preventDuplicates: false);
    // }
    Get.to(MessageChatUI());
  }
}
