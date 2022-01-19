// To parse this JSON data, do
//
//     final tutorDetail = tutorDetailFromJson(jsonString);

import 'dart:convert';

import 'user.dart';

import 'feedback.dart';

class TutorDetailModel {
  TutorDetailModel({
    required this.id,
    required this.userId,
    required this.video,
    required this.bio,
    required this.education,
    required this.experience,
    required this.profession,
    this.accent,
    required this.targetStudent,
    required this.interests,
    required this.languages,
    required this.specialties,
    this.resume,
    required this.isActivated,
    required this.isNative,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.isFavorite,
    required this.avgRating,
    required this.price,
    required this.feedbacks,
  });

  String id;
  String userId;
  String video;
  String bio;
  String education;
  String? experience;
  String profession;
  dynamic accent;
  String targetStudent;
  String interests;
  String languages;
  String specialties;
  dynamic resume;
  bool isActivated;
  bool? isNative;
  DateTime createdAt;
  DateTime updatedAt;

  UserModel user;
  bool isFavorite;
  double avgRating;
  double price;
  List<FeedbackModel> feedbacks;

  factory TutorDetailModel.fromRawJson(String str) =>
      TutorDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TutorDetailModel.fromJson(Map<String, dynamic> json) {
    var user = json["User"] as Map<String, dynamic>;
    var listFb = user["feedbacks"] as List;
    List<FeedbackModel> rows = listFb.map((i) => FeedbackModel.fromJson(i)).toList();

    return TutorDetailModel(
      id: json["id"],
      userId: json["userId"],
      video: json["video"],
      bio: json["bio"],
      education: json["education"],
      experience: json["experience"],
      profession: json["profession"],
      accent: json["accent"],
      targetStudent: json["targetStudent"],
      interests: json["interests"],
      languages: json["languages"],
      specialties: json["specialties"],
      resume: json["resume"],
      isActivated: json["isActivated"],
      isNative: json["isNative"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      user: UserModel.fromJson(json["User"]),
      isFavorite: json["isFavorite"],
      avgRating: json["avgRating"].toDouble(),
      price: json["price"].toDouble(),
      feedbacks: rows,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "video": video,
        "bio": bio,
        "education": education,
        "experience": experience,
        "profession": profession,
        "accent": accent,
        "targetStudent": targetStudent,
        "interests": interests,
        "languages": languages,
        "specialties": specialties,
        "resume": resume,
        "isActivated": isActivated,
        "isNative": isNative,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "user": user.toJson(),
        "isFavorite": isFavorite,
        "avgRating": avgRating,
        "price": price,
      };
}
