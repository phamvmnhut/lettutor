import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:lettutor/constants/strings.dart';
import 'dart:developer' as developer;

import 'model.dart';

/// LoginService responsible to communicate with web-server
/// via authentication related APIs
class AuthService extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.defaultContentType = "application/json";
    httpClient.baseUrl = Strings.apiUrl;
  }
  final String loginUrl = "/auth/login";
  final String refreshTokenUrl = "/auth/refresh-token";
  final String registerUrl = "${Strings.apiUrl}/sign-up";

  Future<LoginResponseModel> fetchLogin(LoginRequestModel model) async {
    final response = await post(loginUrl, model.toJson());
    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.body);
    } else {
      return LoginResponseModel.fromError(response.body);
    }
  }

  Future<RegisterResponseModel?> fetchRegister(
      RegisterRequestModel model) async {
    return RegisterResponseModel(token: "token", id: "id_123");
    // TODO get api register response
    // final response = await post(registerUrl, model.toJson());

    // if (response.statusCode == HttpStatus.ok) {
    //   return RegisterResponseModel.fromJson(response.body);
    // } else {
    //   return null;
    // }
  }

  Future<LoginResponseModel> fetchRefreshToken(String refreshToken) async {
    final model = RefreshTokenRequestModel(refreshToken: refreshToken);
    final response = await post(refreshTokenUrl, model.toJson());
    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.body);
    } else {
      return LoginResponseModel.fromError(response.body);
    }
  }

}
