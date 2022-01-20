import 'dart:convert';
import 'package:lettutor/models/user.dart';

import 'dart:developer' as dev;

class UserMeResponseModel {
  UserModel? user;
  String? error;

  UserMeResponseModel.fromJson(Map<String, dynamic> json) {
    user = UserModel.fromJson(json["user"]);
  }
  UserMeResponseModel.fromError(Map<String, dynamic> json){
    error = json['message'];
  }
}

class UserUpdateRequestModel {
  UserUpdateRequestModel({
    this.name,
    this.country,
    this.phone,
    this.birthday,
    this.level,
    // this.learnTopics,
    // this.testPreparations,
  });

  String? name;
  String? country;
  String? phone;
  DateTime? birthday;
  String? level;
  // List<String>? learnTopics;
  // List<dynamic> testPreparations;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "country": country == null ? null : country,
    "phone": phone == null ? null : phone,
    "birthday": birthday == null ? null : "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
    "level": level == null ? null : level,
    // "learnTopics": learnTopics == null ? null : List<dynamic>.from(learnTopics!.map((x) => x)),
    // "testPreparations": testPreparations == null ? null : List<dynamic>.from(testPreparations.map((x) => x)),
  };
}
