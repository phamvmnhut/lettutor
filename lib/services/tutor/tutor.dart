import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:lettutor/constants/strings.dart';
import 'package:lettutor/features/auth.dart';
import 'package:lettutor/features/cache_manager.dart';
import 'package:lettutor/models/auth.dart';
import 'dart:developer' as dev;

import 'model.dart';

class TutorService extends GetConnect with CacheManager{
  late final AuthCtrl authCtrl;

  @override
  void onInit() {
    super.onInit();
    authCtrl = Get.find();
    httpClient.defaultContentType = "application/json";
    httpClient.baseUrl = Strings.apiUrl;
  }
  final String getListUrl = "/tutor/more";
  final String manageFavoriteTutorUrl = "/user/manageFavoriteTutor";

  Future<GetListTutorResponseModel> fetchListTutor() async {
    String tokenAccess = authCtrl.token.value!.accessToken.token;
    final response = await get(getListUrl, headers: {"Authorization": "Bearer $tokenAccess"});
    if (response.statusCode == HttpStatus.ok) {
      return GetListTutorResponseModel.fromJson(response.body);
    } else {
      return GetListTutorResponseModel.fromError(response.body);
    }
  }

  Future<String> manageFavoriteTutor(ManageFavoriteTutorRequestModel data) async {
    String tokenAccess = authCtrl.token.value!.accessToken.token;
    final response = await post(manageFavoriteTutorUrl, data.toJson() ,headers: {"Authorization": "Bearer $tokenAccess"});
    if (response.statusCode == HttpStatus.ok) {
      return "";
    } else {
      dev.log(response.toString(), name: "manageFavoriteTutor::services");
      var json = response.body as Map<String, dynamic>;
      return json["message"];
    }
  }
}
