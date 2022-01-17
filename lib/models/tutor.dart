import 'package:lettutor/models/index.dart';
import "dart:developer" as dev;
import 'feedback.dart';

class TutorModel {
  String id;
  String userId;
  String? firstId;
  String? secondId;
  DateTime createdAt;
  DateTime updatedAt;
  String email;
  String avatar;
  String video;
  String name;

  String? google;
  String? facebook;
  String? apple;
  String country;
  String? phone;
  String? language;
  DateTime? birthday;
  int timezone = 7;
  String bio;
  String education;
  String experience;
  String profession;
  String targetStudent;
  String interests;
  String? specialties;
  bool? isNative;
  int price;
  bool isOnline = false;
  List<Feedback> feedbacks;
  double rating;

  bool isFav = false;
  TutorModel(
      {
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.email,
        required this.avatar,
        required this.video,
        required this.name,
        required this.country,
        required this.bio,
        required this.education,
        required this.experience,
        required this.profession,
        required this.targetStudent,
        required this.interests,
        required this.price,
        required this.userId,
        required this.rating,
        required this.feedbacks,
      });

  factory TutorModel.fromJson(Map<String, dynamic> json) {
    var listFb = json["feedbacks"] as List;
    List<Feedback> rows = listFb.map((i) => Feedback.fromJson(i)).toList();
    double sumRate = 0;
    rows.forEach((element) {sumRate += element.rating;});
    return TutorModel(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      email: json['email'],
      avatar: json['avatar'],
      video: json['video'],
      name: json['name'],
      country: json['country'],
      bio: json['bio'],
      education: json['education'],
      experience: json['experience'],
      profession: json['profession'],
      targetStudent: json['targetStudent'],
      interests: json['interests'],
      price: json['price'],
      userId: json['userId'],
      feedbacks: rows,
      rating: sumRate/rows.length
    );
  }
}

class ReviewModel {
  final String? avatar;
  final String name;
  final DateTime time;
  final double rating;
  final String comment;

  ReviewModel({
    this.avatar,
    required this.name,
    required this.time,
    required this.rating,
    required this.comment,
  });
}
