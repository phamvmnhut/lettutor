import 'package:get/get.dart';

class UserModel extends GetxController {
  String id;
  String email;
  String name;
  String avatar;
  String phone;

  DateTime? birthday;
  String? country;
  String? lever;
  String? wantToLearn;
  List<String>? roles;
  String? language;
  List<String>? courses;
  String? requireNote;
  String? level;
  List<String>? learnTopics;
  List<String>? testPreparations;
  bool isPhoneActivated = false;
  int timezone = 7;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.phone,
    this.birthday,
    this.country,
    this.lever,
    this.wantToLearn,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      avatar: json['avatar'],
      phone: json['phone'],
    );
  }

  updateUser({required String name, required String avatar}) {
    this.name = name;
    this.avatar = avatar;
  }
}
