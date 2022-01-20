import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/services/auth/auth.dart';
import 'package:lettutor/services/auth/model.dart';
import 'package:lettutor/utils/routes/routes.dart';
import './cache_manager.dart';
import 'dart:developer' as dev;

class LoadingCtrl extends GetxController with CacheManager {
  static LoadingCtrl get to => Get.find();

  late final AuthService _authService;

  @override
  void onInit() async {
    super.onInit();
    _authService = Get.put(AuthService());
  }

  @override
  void onReady() {
    super.onReady();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    dev.log("checkLoginStatus", name: "CheckLoginStatus");
    final token = getToken();
    if (token == null) {
      return Get.offAndToNamed(Routes.SIGN_IN);
    }
    if (token.refreshToken.expires.difference(DateTime.now()).inSeconds > 0) {
      if (token.accessToken.expires.difference(DateTime.now()).inSeconds > 0) {
        return Get.offAndToNamed(Routes.HOME);
      }
      return await fetchRefreshToken(token.refreshToken.token);
    }
  }

  Future<void> fetchRefreshToken(String refreshToken) async {
    final response = await _authService.fetchRefreshToken(refreshToken);

    String errMess = "";
    if (response.error == null) {
      if (response.token != null) {
        await saveToken(response.token!);
        return Get.offAndToNamed(Routes.HOME);
      } else {
        errMess = "token null";
      }
    } else {
      errMess = response.error!;
    }
    /// Show user a dialog about the error response
    Get.defaultDialog(
        middleText: errMess,
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
        });
    return Get.offAndToNamed(Routes.SIGN_IN);
  }
}
