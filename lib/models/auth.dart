import 'package:get/get.dart';
import 'dart:convert';

class TokenInfo {
  String token;
  DateTime expires;

  TokenInfo({
    required this.token,
    required this.expires,
  });

  factory TokenInfo.fromJson(Map<String, dynamic> json) {
    return TokenInfo(token: json["token"], expires: DateTime.parse(json['expires']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['expires'] = this.expires;
    return data;
  }
}

class TokenModel {
  TokenInfo accessToken;
  TokenInfo refreshToken;

  TokenModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: TokenInfo.fromJson(json['access']),
      refreshToken: TokenInfo.fromJson(json['refresh']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken.toJson().toString();
    data['refreshToken'] = this.refreshToken.toJson().toString();
    return data;
  }

  String toJsonEncode() {
    var accessToken = {};
    accessToken["token"] = this.accessToken.token;
    accessToken["expires"] = this.accessToken.expires.toIso8601String();
    var refreshToken = {};
    refreshToken["token"] = this.refreshToken.token;
    refreshToken["expires"] = this.refreshToken.expires.toIso8601String();

    var data = {};
    data["access"] = accessToken;
    data["refresh"] = refreshToken;
    String str = json.encode(data);
    return str;
  }

}
