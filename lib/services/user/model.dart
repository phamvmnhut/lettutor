import 'package:lettutor/models/tutor.dart';
import 'dart:developer' as dev;

import 'package:lettutor/models/user.dart';

class UserMeResponseModel {
  int count = 0;
  UserModel? user;
  String? error;

  UserMeResponseModel.fromJson(Map<String, dynamic> json) {
    user = UserModel.fromJson(json);
  }
  UserMeResponseModel.fromError(Map<String, dynamic> json){
    this.error = json['message'];
  }
}
