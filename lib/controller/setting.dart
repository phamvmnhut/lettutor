import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/ui/profile/config_interface.dart';
import 'package:lettutor/ui/profile/user_profile.dart';
import 'package:lettutor/ui/tutor_gen/tutor_reg.dart';

import 'cache_manager.dart';

class SettingCtrl extends GetxController with CacheManager{
  var isLoading = false.obs;

  navigateProfile() {
    Get.to(() => ProfileUI(), preventDuplicates: false);
  }

  navigateRegisterTutor() {
    Get.to(() => TutorRegUI(), preventDuplicates: false);
  }

  navigateConfigUI() {
    Get.to(() => ConfigInterfaceUI(), preventDuplicates: false);
  }

  void switchTheme() {
    bool isDarkMode = !getDarkMode();
    saveDarkMode(isDarkMode);
    Get.changeThemeMode( isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }

}
