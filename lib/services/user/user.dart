import 'dart:io';

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
  final String _getMeUrl = "/user/info";
  final String _manageFavoriteTutorUrl = "/user/manageFavoriteTutor";
  final String _getTutorInformationByIdUrl = "/tutor";
  final String _searchTutorUrl = "/tutor/search";
  final String _uploadAvatar = "/user/uploadAvatar"; 

  Future<UserMeResponseModel> getMe() async {
    final response = await get(_getMeUrl, headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == HttpStatus.ok) {
      return UserMeResponseModel.fromJson(response.body);
    } else {
      return UserMeResponseModel.fromError(response.body);
    }
  }

  Future<UserMeResponseModel> updateMe(UserUpdateRequestModel model) async {
    final response = await put(_getMeUrl, model.toJson(), headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == HttpStatus.ok) {
      return UserMeResponseModel.fromJson(response.body);
    } else {
      return UserMeResponseModel.fromError(response.body);
    }
  }

  Future<UploadAvatarResponseModel> uploadAvatar(File image) async {
    final form = FormData({
      'avatar': MultipartFile(image, filename: 'avatar.png'),
    });
    final response = await post(_uploadAvatar, form, headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == HttpStatus.ok) {
      return UploadAvatarResponseModel.fromJson(response.body);
    } else {
      if (response.body == null) {
        return UploadAvatarResponseModel.fromError({"message": "unknown error"});
      }
      return UploadAvatarResponseModel.fromError(response.body);
    }
  }
}
