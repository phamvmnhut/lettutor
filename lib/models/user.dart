import 'package:get/get.dart';

class UserModel extends GetxController {
  String name;
  String email;
  String? avatar;
  DateTime dayOfBirth;
  String? phoneNumber;
  String? country;
  String? lever;
  String? wantToLearn;

  UserModel({
    required this.name,
    required this.email,
    this.avatar,
    required this.dayOfBirth,
    this.phoneNumber,
    this.country,
    this.lever,
    this.wantToLearn,
  });

  updateUser( {required String name, required String avatar}){
    this.name = name;
    this.avatar = avatar;
  }
}
