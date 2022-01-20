import 'package:lettutor/models/auth.dart';
import 'package:lettutor/models/user.dart';

class LoginRequestModel {
  String? email;
  String? password;

  LoginRequestModel({this.email, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

class LoginResponseModel {
  String? error;
  UserModel? user;
  TokenModel? token;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    error = null;
    user = UserModel.fromJson(json['user']);
    token = TokenModel.fromJson(json['tokens']);
  }
  LoginResponseModel.fromError(Map<String, dynamic> json){
    this.error = json['message'];
  }
}

class RegisterRequestModel {
  String? email;
  String? password;

  RegisterRequestModel({this.email, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

class RegisterResponseModel {
  String? token;
  String? id;

  RegisterResponseModel({this.token, this.id});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
  }
}

class RefreshTokenRequestModel {
  String refreshToken;
  int timezone = 7;

  RefreshTokenRequestModel({required this.refreshToken});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refreshToken'] = this.refreshToken;
    data['timezone'] = this.timezone;
    return data;
  }
}

class ForgotPWRequestModel {
  String email;

  ForgotPWRequestModel({required this.email});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    return data;
  }
}