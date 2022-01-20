import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor/models/auth.dart';
import 'package:lettutor/models/user.dart';

import 'package:lettutor/services/user/user.dart';
import 'package:lettutor/utils/routes/routes.dart';

import 'cache_manager.dart';

class UserCtrl extends GetxController with CacheManager {
  static UserCtrl get to => Get.find();

  late final UserService _userService;
  var user = Rxn<UserModel>();
  late var token = Rx<TokenModel>(getToken()!);

  get accessToken => token.value.accessToken.token;
  get refreshToken => token.value.refreshToken.token;

  @override
  void onInit() {
    super.onInit();
    _userService = Get.put(UserService(token: accessToken));
  }

  Future<void> getMe() async {
    final response = await _userService.getMe();

    if (response.error == null) {
      // Set UserModel
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

  void signOut() async {
    await removeToken();
    Get.offAndToNamed(Routes.SIGN_IN);
  }
}