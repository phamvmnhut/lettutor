import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:lettutor/constants/strings.dart';
import 'dart:developer' as dev;

import 'model.dart';

class AuthService extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.defaultContentType = "application/json";
    httpClient.baseUrl = Strings.apiUrl;
  }
  
  final String _loginUrl = "/auth/login";
  final String _refreshTokenUrl = "/auth/refresh-token";
  final String _forgotPWUrl = "/user/forgotPassword";
  final String _registerUrl = "/auth/register";
  final String _confirm_email = "/auth/verifyAccount?token=";

  Future<LoginResponseModel> fetchLogin(LoginRequestModel model) async {
    final response = await post(_loginUrl, model.toJson());
    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.body);
    } else {
      return LoginResponseModel.fromError(response.body);
    }
  }

  Future<String> fetchRegister(RegisterRequestModel model) async {
    final response = await post(_registerUrl, model.toJson());
    if (response.statusCode == HttpStatus.created) {
      return "";
    } else {
      try {
        var json = response.body as Map<String, dynamic>;
        return json["message"];
      } catch (e) {
        return "some thing went wrong";
      }
    }
  }

  Future<LoginResponseModel> fetchRefreshToken(String refreshToken) async {
    final model = RefreshTokenRequestModel(refreshToken: refreshToken);
    final response = await post(_refreshTokenUrl, model.toJson());
    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.body);
    } else {
      return LoginResponseModel.fromError(response.body);
    }
  }

  Future<String> fetchForgotPW(String email) async {
    final model = ForgotPWRequestModel(email: email);
    final response = await post(_forgotPWUrl, model.toJson());
    if (response.statusCode == HttpStatus.ok) {
      return "";
    } else {
      var json = response.body as Map<String, dynamic>;
      return json["message"];
    }
  }

  Future<String> confirmEmail(String token) async {
    String url = "$_confirm_email$token";
    final response = await get(url);
    if (response.statusCode == HttpStatus.ok) {
      return "";
    } else {
      var json = response.body as Map<String, dynamic>;
      return json["message"];
    }
  }
}
