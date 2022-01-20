import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor/ui/profile/config_interface.dart';
import 'package:lettutor/ui/profile/user_profile.dart';
import 'package:lettutor/ui/profile/tutor_reg.dart';

import 'cache_manager.dart';

class SettingCtrl extends GetxController with CacheManager{
  static SettingCtrl get to => Get.find();

  var isLoading = false.obs;

  navigateConfigUI() {
    Get.to(() => ConfigInterfaceUI(), preventDuplicates: false);
  }

  void switchTheme() {
    bool isDarkMode = !getDarkMode();
    saveDarkMode(isDarkMode);
    Get.changeThemeMode( isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }
}
