import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:lettutor/constants/strings.dart';
import 'dart:developer' as dev;

import 'model.dart';

class UserService extends GetConnect{
  final String token;

  UserService({required this.token});
  @override
  void onInit() {
    super.onInit();
    httpClient.defaultContentType = "application/json";
    httpClient.baseUrl = Strings.apiUrl;
  }
  final String getMeUrl = "/user/info";
  final String manageFavoriteTutorUrl = "/user/manageFavoriteTutor";
  final String getTutorInformationByIdUrl = "/tutor";
  final String searchTutorUrl = "/tutor/search";

  Future<dynamic> getMe() async {
    final response = await get(getMeUrl, headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == HttpStatus.ok) {
      return UserMeResponseModel.fromJson(response.body);
    } else {
      return UserMeResponseModel.fromError(response.body);
    }
  }
}
