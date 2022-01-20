import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import 'package:lettutor/constants/strings.dart';
import 'package:lettutor/controller/user.dart';
import 'dart:developer' as dev;

import 'model.dart';

class CourseService extends GetConnect {

  @override
  void onInit() {
    super.onInit();
    httpClient.defaultContentType = "application/json";
    httpClient.baseUrl = Strings.apiUrl;
  }
  final String getListUrl = "/course";

  Future<GetListCourseResponseModel> fetchListCourse() async {
    String tokenAccess = UserCtrl.to.accessToken;
    final response = await get(getListUrl, headers: {"Authorization": "Bearer $tokenAccess"});
    if (response.statusCode == HttpStatus.ok) {
      return GetListCourseResponseModel.fromJson(response.body);
    } else {
      return GetListCourseResponseModel.fromError(response.body);
    }
  }

}
