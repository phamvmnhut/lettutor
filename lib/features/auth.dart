import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/services/auth/auth.dart';
import 'package:lettutor/services/auth/model.dart';
import './cache_manager.dart';

class AuthCtrl extends GetxController with CacheManager{
  final isLogged = false.obs;

  late final AuthService _loginService;

  @override
  void onInit() {
    super.onInit();
    _loginService = Get.put(AuthService());
  }

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(String? token) async {
    isLogged.value = true;
    //Token is cached
    await saveToken(token);
  }

  void checkLoginStatus() {
    // TODO getToken
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }

  Future<void> loginUser(String email, String password) async {
    final response = await _loginService
        .fetchLogin(LoginRequestModel(email: email, password: password));

    if (response != null) {
      /// Set isLogin to true
      this.login(response.token);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'User not found!',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }

  Future<void> registerUser(String email, String password) async {
    final response = await _loginService
        .fetchRegister(RegisterRequestModel(email: email, password: password));

    if (response != null) {
      /// Set isLogin to true
      this.login(response.token);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'Register Error',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }

  Future<void> loginByGoogle() async {

  }

  Future<void> loginByFacebook() async {

  }
}