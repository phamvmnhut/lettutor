import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:lettutor/constants/strings.dart';
import 'package:lettutor/controller/user.dart';
import 'package:lettutor/services/models/schedule.dart';
import 'dart:developer' as dev;

import 'model.dart';

class TutorService extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.defaultContentType = "application/json";
    httpClient.baseUrl = Strings.apiUrl;
  }

  final String getListUrl = "/tutor/more";
  final String manageFavoriteTutorUrl = "/user/manageFavoriteTutor";
  final String getTutorInformationByIdUrl = "/tutor";
  final String searchTutorUrl = "/tutor/search";
  final String _getTutorScheduleByIdUrl = "/schedule";

  Future<GetListTutorResponseModel> fetchListTutor() async {
    String tokenAccess = UserCtrl.to.accessToken;
    final response = await get(getListUrl,
        headers: {"Authorization": "Bearer $tokenAccess"});
    if (response.statusCode == HttpStatus.ok) {
      return GetListTutorResponseModel.fromJson(response.body);
    } else {
      return GetListTutorResponseModel.fromError(response.body);
    }
  }

  Future<String> manageFavoriteTutor(
      ManageFavoriteTutorRequestModel data) async {
    String tokenAccess = UserCtrl.to.accessToken;
    final response = await post(manageFavoriteTutorUrl, data.toJson(),
        headers: {"Authorization": "Bearer $tokenAccess"});
    if (response.statusCode == HttpStatus.ok) {
      return "";
    } else {
      var json = response.body as Map<String, dynamic>;
      return json["message"];
    }
  }

  Future<GetTutorInformationByIdResponseModel> getTutorInformationById(
      String tutorId) async {
    String tokenAccess = UserCtrl.to.accessToken;
    String url = "$getTutorInformationByIdUrl/$tutorId";
    final response =
        await get(url, headers: {"Authorization": "Bearer $tokenAccess"});
    if (response.statusCode == HttpStatus.ok && response.body["id"] != null) {
      return GetTutorInformationByIdResponseModel.fromJson(response.body);
    } else {
      return GetTutorInformationByIdResponseModel.fromError(response.body);
    }
  }

  Future<GetListTutorResponseModel> searchListTutor(
      SearchTutorRequestModel data) async {
    String tokenAccess = UserCtrl.to.accessToken;
    final response = await post(searchTutorUrl, data.toJson(),
        headers: {"Authorization": "Bearer $tokenAccess"});
    if (response.statusCode == HttpStatus.ok) {
      return GetListTutorResponseModel.fromSearchJson(response.body);
    } else {
      return GetListTutorResponseModel.fromError(response.body);
    }
  }

  Future<GetTutorScheduleByIdResponseModel> getTutorScheduleById(
      String tutorId) async {
    String tokenAccess = UserCtrl.to.accessToken;
    GetTutorScheduleByIdRequestModel data =
        GetTutorScheduleByIdRequestModel(tutorId: tutorId);
    final response = await post(_getTutorScheduleByIdUrl, data.toJson(),
        headers: {"Authorization": "Bearer $tokenAccess"});
    if (response.statusCode == HttpStatus.ok) {
      return GetTutorScheduleByIdResponseModel.fromJson(response.body);
    } else {
      return GetTutorScheduleByIdResponseModel.fromError(response.body);
    }
  }
}
