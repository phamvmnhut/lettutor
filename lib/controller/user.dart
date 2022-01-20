import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor/models/auth.dart';
import 'package:lettutor/models/user.dart';
import 'package:lettutor/services/user/model.dart';

import 'package:lettutor/services/user/user.dart';
import 'package:lettutor/ui/profile/tutor_reg.dart';
import 'package:lettutor/ui/profile/user_profile.dart';
import 'package:lettutor/utils/routes/routes.dart';

import 'cache_manager.dart';

class UserCtrl extends GetxController with CacheManager {
  static UserCtrl get to => Get.find();

  late final UserService _userService;
  var user = Rxn<UserModel>();
  late var token = Rx<TokenModel>(getToken()!);
  var loading = false.obs;

  get accessToken => token.value.accessToken.token;

  get refreshToken => token.value.refreshToken.token;

  @override
  void onInit() {
    super.onInit();
    _userService = Get.put(UserService(token: accessToken));
  }

  @override
  void onReady() {
    super.onReady();
    getMe();
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

  Future<void> getMe() async {
    final response = await _userService.getMe();

    if (response.error == null) {
      // Set UserModel
      user(response.user!);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: response.error!,
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
      return;
    }
  }

  Future<void> updateMe({
    String? name,
    String? country,
    String? phone,
    DateTime? birthday,
    String? level,
  }) async {
    final response = await _userService.updateMe(
      UserUpdateRequestModel(
          name: name,
          country: country,
          phone: phone,
          birthday: birthday,
          level: level),
    );
    print(phone);

    if (response.error == null) {
      // Set UserModel
      print(response.user!.phone);
      user(response.user!);
      Get.defaultDialog(
          middleText: "Update Success",
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: response.error!,
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
      return;
    }
  }

  void navigateUserProfile() {
    if (user.value != null) {
      Get.to(() => ProfileUI(user: user.value!));
    } else {
      Get.defaultDialog(
          middleText: "User not found",
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
      return;
    }
  }

  void navigateTutorProfile() {
    if (user.value != null) {
      Get.to(() => TutorRegUI());
    } else {
      Get.defaultDialog(
          middleText: "User not found",
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
      return;
    }
  }

  void signOut() async {
    await removeToken();
    Get.offAndToNamed(Routes.SIGN_IN);
  }
}
