import 'package:get/get.dart';
import 'package:lettutor/ui/profile/user_profile.dart';
import 'package:lettutor/ui/tutor_gen/tutor_reg.dart';

class SettingCtrl extends GetxController {
  var isLoading = false.obs;

  navigateProfile() {
    Get.to(() => ProfileUI(), preventDuplicates: false);
  }

  navigateRegisterTutor() {
    Get.to(() => TutorRegUI(), preventDuplicates: false);
  }
}
