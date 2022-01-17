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
  final tutorSelected = Rxn<TutorModel>();

  @override
  void onInit() async {
    super.onInit();
    _service = Get.put(TutorService());
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

  Future<void> getListTutor() async {
    loading.value = true;
    final response = await _service.fetchListTutor();
    if (response.error != null) {
      this.tutors = <TutorModel>[].obs;
    } else {
      if (response.tutors != null) {
        this.tutors.assignAll(response.tutors!);
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
          e.isFav = !e.isFav;
        }
        return e;
      }).toList();
      this.tutors.assignAll(resp);

      if (tutorSelected.value != null) {
        if (tutorSelected.value!.userId == tutorId) {
          TutorModel updated = tutorSelected.value!;
          updated.isFav = !updated.isFav;
          tutorSelected.value = updated;
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
    loading.value = true;
    // final res = await _service.search(q);
    tutors.clear();
    // tutors.addAll(res);
    loading.value = false;
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
    tutorSelected.value = tutors.firstWhere((element) => element.id == id);
    Get.to(() => TutorDetailUI(), preventDuplicates: false);
  }

  navigateSearch(String s) {
    Get.to(() => TutorSearchUI(), preventDuplicates: false);
  }
}
