import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:lettutor/constants/strings.dart';

import 'model.dart';

/// LoginService responsible to communicate with web-server
/// via authentication related APIs
class AuthService extends GetConnect {
  final String loginUrl = "${Strings.apiUrl}/sign-in";
  final String registerUrl = "${Strings.apiUrl}/sign-up";

  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    return LoginResponseModel(token: "token");
    // TODO get api login response
    // final response = await post(loginUrl, model.toJson());

    // if (response.statusCode == HttpStatus.ok) {
    //   return LoginResponseModel.fromJson(response.body);
    // } else {
    //   return null;
    // }
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
}
