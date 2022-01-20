import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor/services/auth/auth.dart';
import 'package:lettutor/services/auth/model.dart';
import 'package:lettutor/utils/routes/routes.dart';
import './cache_manager.dart';

import 'dart:developer' as dev;

class AuthCtrl extends GetxController with CacheManager {
  static AuthCtrl get to => Get.find();
  var loading = false.obs;

  late final AuthService _authService;

  @override
  void onInit() async {
    super.onInit();
    _authService = Get.put(AuthService());
  }

  @override
  void onReady() {
    super.onReady();
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

  Future<void> loginUser(String email, String password) async {
    loading.value = true;
    final response = await _authService
        .fetchLogin(LoginRequestModel(email: email, password: password));
    loading.value = false;
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
    return Get.defaultDialog(
        middleText: errMess,
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
        });
  }

  Future<void> registerUser(String email, String password) async {
    loading.value = true;
    final response = await _authService.fetchRegister(RegisterRequestModel(email: email, password: password));
    loading.value = false;
    if (response == "") {
      return navigateSignIn();
    }

    /// Show user a dialog about the error response
    return Get.defaultDialog(
        middleText: response,
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
        });
  }

  Future<void> forgotPassword(String email) async {
    loading.value = true;
    final response = await _authService.fetchForgotPW(email);
    loading.value = false;
    if (response == "") {
      return navigateSignIn();
    }

    /// Show user a dialog about the error response
    return Get.defaultDialog(
        middleText: response,
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
        });
  }

  navigateSignIn() {
    Get.toNamed(Routes.SIGN_IN);
  }
  navigateForgotPassword() {
    Get.toNamed(Routes.FORGOT_PW);
  }
  navigateSignUp() {
    Get.toNamed(Routes.SIGN_UP);
  }
}
