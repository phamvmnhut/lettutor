import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/models/tutor_detail.dart';
import 'package:lettutor/services/tutor/model.dart';
import 'package:lettutor/services/tutor/tutor.dart';
import 'package:lettutor/ui/tutor_detail/tutor_detail.dart';
import 'package:lettutor/ui/tutor_gen/tutor_search.dart';
import 'dart:developer' as dev;

class TutorCtrl extends GetxController {
  late final TutorService _service;
  var loading = false.obs;
  var tutors = <TutorModel>[].obs;
  var listSpec = <String>[].obs;
  var _listTutorsTempt = <TutorModel>[];

  @override
  void onInit() async {
    super.onInit();
    _service = Get.put(TutorService());
  }

  @override
  void onReady() {
    super.onReady();
    getListTutor();
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

  Future<void> getListTutor() async {
    loading.value = true;
    final response = await _service.fetchListTutor();
    if (response.error != null) {
      tutors = <TutorModel>[].obs;
      listSpec = <String>[].obs;
    } else {
      if (response.tutors != null) {
        List<TutorModel> tutorList = response.tutors!;
        String tempCap = '';
        tutorList.forEach((item) {
          if (item.specialties != null) {
            tempCap = tempCap + item.specialties! + ",";
          }
        });
        tempCap = tempCap.substring(0, tempCap.length - 1);
        listSpec.assignAll(tempCap.split(",").toSet().toList());
        tutors.assignAll(tutorList);
        _listTutorsTempt.assignAll(tutorList);
      }
    }
    loading.value = false;
  }

  Future<GetTutorInformationByIdResponseModel> getTutorDetail(
      String tutorId) async {
    loading.value = true;
    final response = await _service.getTutorInformationById(tutorId);
    loading.value = false;

    return response;
  }

  Future<void> toggleFav(String tutorId) async {
    loading.value = true;
    final response = await _service
        .manageFavoriteTutor(ManageFavoriteTutorRequestModel(tutorId: tutorId));
    if (response == "") {
      List<TutorModel> resp = this.tutors.map((e) {
        if (e.userId == tutorId) {
          e.isFav.value = !e.isFav.value;
        }
        return e;
      }).toList();
      tutors.assignAll(resp);
    } else {
      Get.defaultDialog(
          middleText: response,
          textConfirm: 'OK',
          confirmTextColor: Colors.red,
          onConfirm: () {
            Get.back();
          });
    }
    loading.value = false;
  }

  searchTutor(String q) async {
    loading.value = true;
    final response =
        await _service.searchListTutor(SearchTutorRequestModel(search: q));
    if (response.error != null) {
      tutors = <TutorModel>[].obs;
      listSpec = <String>[].obs;
    } else {
      if (response.tutors != null) {
        List<TutorModel> tutorList = response.tutors!;
        String tempCap = '';
        tutorList.forEach((item) {
          if (item.specialties != null) {
            tempCap = tempCap + item.specialties! + ",";
          }
        });
        tempCap = tempCap.substring(0, tempCap.length - 1);
        listSpec.assignAll(tempCap.split(",").toSet().toList());
        tutors.assignAll(tutorList);
        _listTutorsTempt.assignAll(tutorList);
      }
    }
    loading.value = false;
  }

  filterBySpecify(String s) async {
    loading.value = true;
    var temp = _listTutorsTempt.where((e) {
      var listSpec = (e.specialties ?? "").split(",");
      if (listSpec.indexWhere(
              (element) => element.toLowerCase() == s.toLowerCase()) !=
          -1) {
        return true;
      }
      return false;
    }).toList();
    tutors.assignAll(temp);
    loading.value = false;
  }

  navigateDetail(String tutorId) async {
    // selected
    var data = await getTutorDetail(tutorId);
    if (data.error != null) {
      Get.defaultDialog(
          middleText: "Fetch data fail",
          textConfirm: 'OK',
          confirmTextColor: Colors.red,
          onConfirm: () {
            Get.back();
          });
    } else {
      Get.to(
          () => TutorDetailUI(
                data: data.tutorDetail!,
              ),
          preventDuplicates: false);
    }
  }

  navigateSearch(String s) {
    Get.to(() => TutorSearchUI(), preventDuplicates: false);
    getListTutor();
  }
}
