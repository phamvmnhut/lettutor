import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor/ui/profile/config_interface.dart';
import 'package:lettutor/services/localization.dart';

import 'cache_manager.dart';

import 'dart:developer' as dev;

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

  void switchLanguage() {
    String local = getLanguage();
    String changeStr = local == "vi" ? "en" : "vi";
    saveLanguage(changeStr);
    LocalizationService.changeLocale(changeStr);
  }
}
