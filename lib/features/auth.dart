import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/models/auth.dart';
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

  void login(TokenModel token) async {
    isLogged.value = true;
    //Token is cached
    await saveToken(token);
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token == null) {
      isLogged.value = false;
      return;
    }
    if (token.refreshToken.expires.difference(DateTime.now()).inSeconds > 0){
      if (token.accessToken.expires.difference(DateTime.now()).inSeconds > 0){
        isLogged.value = true;
        return;
      }
      refreshToken(token.refreshToken.token);
      return;
    }
  }

  Future<void> loginUser(String email, String password) async {
    final response = await _loginService
        .fetchLogin(LoginRequestModel(email: email, password: password));

    if (response.error == null) {
      /// Set isLogin to true
      if (response.token != null) {
        this.login(response.token!);
      }
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

  Future<void> registerUser(String email, String password) async {
    final response = await _loginService
        .fetchRegister(RegisterRequestModel(email: email, password: password));

    if (response != null) {
      /// Set isLogin to true
      // this.login(response.token);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'Register Error',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
      return;
    }
  }

  Future<void> refreshToken(String refreshToken) async {
    final response = await _loginService
        .fetchRefreshToken(refreshToken);

    if (response.error == null) {
      /// Set isLogin to true
      if (response.token != null) {
        this.login(response.token!);
      }
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: response.error!,
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
      isLogged.value = false;
    }
  }

  Future<void> loginByGoogle() async {

  }

  Future<void> loginByFacebook() async {

  }
}