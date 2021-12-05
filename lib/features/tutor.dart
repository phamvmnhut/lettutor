import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/datas/local.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/services/tutor/tutor.dart';
import 'package:lettutor/ui/tutor_detail/tutor_detail.dart';

class TutorCtrl extends GetxController {

  late final TutorService _service;
  var tutors = <TutorModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _service = Get.put(TutorService());
    // for offline
    tutors.addAll(LocalData.TutorListExample);

    isLoading.listen((loading) {
      if (loading) {
        Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false);
      } else {
        Get.back();
      }
    });
  }

  toggleFav(int tutorIndex){
    var changed = tutors[tutorIndex];
    changed.isFav = !changed.isFav;
    tutors[tutorIndex] = changed;
  }

  filterBySpecify(String s) {
    isLoading.value = true;
    // final res = await _service.search(q);
    tutors.clear();
    // tutors.addAll(res);
    isLoading.value = false;
  }

  searchTutor(String q) async {
    isLoading.value = true;
    // final res = await _service.search(q);
    // tutors.clear();
    // tutors.addAll(res);
    isLoading.value = false;
  }

  navigateDetail(int tutorIndex) {
    Get.to(
        ()=> TutorDetailUI(tutorIndex: tutorIndex,),
        preventDuplicates: false);
  }
}
