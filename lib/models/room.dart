// To parse this JSON data, do
//
//     final roomModel = roomModelFromJson(jsonString);

import 'dart:convert';
import './tutor.dart';

class RoomModel {
  RoomModel({
    this.context,
    this.room,
    this.roomName,
    this.userCall,
    this.userBeCalled,
    this.isTutor,
    this.startTime,
    this.endSession,
    this.timeInRoom,
    this.bookingId,
    this.iat,
    this.exp,
    this.aud,
    this.iss,
    this.sub,
  });

  Context? context;
  String? room;
  String? roomName;
  UserBeCalledClass? userCall;
  UserBeCalledClass? userBeCalled;
  bool? isTutor;
  int? startTime;
  int? endSession;
  int? timeInRoom;
  String? bookingId;
  int? iat;
  int? exp;
  String? aud;
  String? iss;
  String? sub;

  factory RoomModel.fromRawJson(String str) => RoomModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
    context: json["context"] == null ? null : Context.fromJson(json["context"]),
    room: json["room"] == null ? null : json["room"],
    roomName: json["roomName"] == null ? null : json["roomName"],
    userCall: json["userCall"] == null ? null : UserBeCalledClass.fromJson(json["userCall"]),
    userBeCalled: json["userBeCalled"] == null ? null : UserBeCalledClass.fromJson(json["userBeCalled"]),
    isTutor: json["isTutor"] == null ? null : json["isTutor"],
    startTime: json["startTime"] == null ? null : json["startTime"],
    endSession: json["endSession"] == null ? null : json["endSession"],
    timeInRoom: json["timeInRoom"] == null ? null : json["timeInRoom"],
    bookingId: json["bookingId"] == null ? null : json["bookingId"],
    iat: json["iat"] == null ? null : json["iat"],
    exp: json["exp"] == null ? null : json["exp"],
    aud: json["aud"] == null ? null : json["aud"],
    iss: json["iss"] == null ? null : json["iss"],
    sub: json["sub"] == null ? null : json["sub"],
  );

  Map<String, dynamic> toJson() => {
    "context": context == null ? null : context!.toJson(),
    "room": room == null ? null : room,
    "roomName": roomName == null ? null : roomName,
    "userCall": userCall == null ? null : userCall!.toJson(),
    "userBeCalled": userBeCalled == null ? null : userBeCalled!.toJson(),
    "isTutor": isTutor == null ? null : isTutor,
    "startTime": startTime == null ? null : startTime,
    "endSession": endSession == null ? null : endSession,
    "timeInRoom": timeInRoom == null ? null : timeInRoom,
    "bookingId": bookingId == null ? null : bookingId,
    "iat": iat == null ? null : iat,
    "exp": exp == null ? null : exp,
    "aud": aud == null ? null : aud,
    "iss": iss == null ? null : iss,
    "sub": sub == null ? null : sub,
  };
}

class Context {
  Context({
    this.user,
  });

  User? user;

  factory Context.fromRawJson(String str) => Context.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Context.fromJson(Map<String, dynamic> json) => Context(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user == null ? null : user!.toJson(),
  };
}

class User {
  User({
    this.email,
    this.name,
  });

  String? email;
  String? name;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json["email"] == null ? null : json["email"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "email": email == null ? null : email,
    "name": name == null ? null : name,
  };
}

class UserBeCalledClass {
  UserBeCalledClass({
    this.id,
    this.email,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.language,
    this.birthday,
    this.isActivated,
    this.tutorInfo,
    this.requireNote,
    this.level,
    this.isPhoneActivated,
    this.timezone,
  });

  String? id;
  String? email;
  String? name;
  String? avatar;
  String? country;
  String? phone;
  String? language;
  DateTime? birthday;
  bool? isActivated;
  TutorModel? tutorInfo;
  String? requireNote;
  String? level;
  bool? isPhoneActivated;
  int? timezone;

  factory UserBeCalledClass.fromRawJson(String str) => UserBeCalledClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserBeCalledClass.fromJson(Map<String, dynamic> json) => UserBeCalledClass(
    id: json["id"] == null ? null : json["id"],
    email: json["email"] == null ? null : json["email"],
    name: json["name"] == null ? null : json["name"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    country: json["country"] == null ? null : json["country"],
    phone: json["phone"] == null ? null : json["phone"],
    language: json["language"] == null ? null : json["language"],
    birthday: json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
    isActivated: json["isActivated"] == null ? null : json["isActivated"],
    tutorInfo: json["tutorInfo"] == null ? null : TutorModel.fromJson(json["tutorInfo"]),
    requireNote: json["requireNote"],
    level: json["level"] == null ? null : json["level"],
    isPhoneActivated: json["isPhoneActivated"] == null ? null : json["isPhoneActivated"],
    timezone: json["timezone"] == null ? null : json["timezone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "email": email == null ? null : email,
    "name": name == null ? null : name,
    "avatar": avatar == null ? null : avatar,
    "country": country == null ? null : country,
    "phone": phone == null ? null : phone,
    "language": language == null ? null : language,
    "birthday": birthday == null ? null : "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
    "isActivated": isActivated == null ? null : isActivated,
    // "tutorInfo": tutorInfo == null ? null : tutorInfo!.toJson(),
    "requireNote": requireNote,
    "level": level == null ? null : level,
    "isPhoneActivated": isPhoneActivated == null ? null : isPhoneActivated,
    "timezone": timezone == null ? null : timezone,
  };
}
