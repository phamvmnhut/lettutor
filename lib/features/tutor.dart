import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/services/tutor/model.dart';
import 'package:lettutor/services/tutor/tutor.dart';
import 'package:lettutor/ui/tutor_detail/tutor_detail.dart';
import 'package:lettutor/ui/tutor_gen/tutor_search.dart';
import 'dart:developer' as dev;

class TutorCtrl extends GetxController {
  late final TutorService _service;
  var loading = false.obs;
  var tutors = <TutorModel>[].obs;

  var _tutorSelected = Rx<TutorModel?>(null);
  set tutorSelected(value) => _tutorSelected.value = value;
  get tutorSelected => _tutorSelected.value;

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
    } else {
      if (response.tutors != null) {
        tutors.assignAll(response.tutors!);
      }
    }
    loading.value = false;
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
      if (tutorSelected != null) {
        if (tutorSelected.userId == tutorId) {
          var updateValue = tutorSelected;
          updateValue.isFav.value = !updateValue.isFav.value;
          tutorSelected = updateValue;
          // update();
          dev.log(tutorSelected.isFav.toString(), name: "updateValue");
        }
      }
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

  filterBySpecify(String s) {
    // loading.value = true;
    // // final res = await _service.search(q);
    // setTutors
    // // tutors.addAll(res);
    // loading.value = false;
  }

  searchTutor(String q) async {
    // isLoading.value = true;
    // // final res = await _service.search(q);
    // // DEMO Local
    // var filtered = await Future.delayed(Duration(seconds: 2),
    //         () => LocalData.TutorListExample.where((element) => element.name.indexOf(q) != -1).toList()
    // );
    // tutors.clear();
    // tutors.addAll(filtered);
    // isLoading.value = false;
  }

  navigateDetail(String id) {
    // selected
    tutorSelected = TutorModel.fromAnother(tutors.firstWhere((element) => element.id == id));
    Get.to(() => TutorDetailUI(), preventDuplicates: false);
  }

  navigateSearch(String s) {
    Get.to(() => TutorSearchUI(), preventDuplicates: false);
  }
}
