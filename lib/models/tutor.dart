import "dart:developer" as dev;
import 'feedback.dart';
import 'package:get/get.dart';

class TutorModel {
  String? id;
  String? userId;
  String? firstId;
  String? secondId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? email;
  String? avatar;
  String? video;
  String? name;

  String? google;
  String? facebook;
  String? apple;
  String? country;
  String? phone;
  String? language;
  DateTime? birthday;
  int? timezone;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  String? targetStudent;
  String? interests;
  String? specialties;
  bool? isNative;
  int? price;
  bool? isOnline = false;
  List<FeedbackModel>? feedbacks;
  double? rating;

  final isFav = false.obs ;

  TutorModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.email,
    this.avatar,
    this.video,
    this.name,
    this.country,
    this.bio,
    this.education,
    this.experience,
    this.targetStudent,
    this.profession,
    this.interests,
    this.price,
    this.userId,
    this.rating,
    this.feedbacks,
    this.specialties,
  });

  factory TutorModel.fromJson(Map<String, dynamic> json) {
    List<FeedbackModel>? rows = json["feedbacks"] == null
        ? null
        : List<FeedbackModel>.from(json["feedbacks"]
        .map((x) => FeedbackModel.fromJson(x)));
    double avaRating = 0;
    if (rows != null) {
      double sumRate = 0;
      rows.forEach((element) {
        sumRate += element.rating;
      });
      avaRating = sumRate / rows.length;
    }
    return TutorModel(
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        email: json["email"] == null ? null : json["email"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        video: json["video"] == null ? null : json["video"],
        name: json["name"] == null ? null : json["name"],
        country: json["country"] == null ? null : json["country"],
        bio: json["bio"] == null ? null : json["bio"],
        education: json["education"] == null ? null : json["education"],
        experience: json["experience"] == null ? null : json["experience"],
        profession: json["profession"] == null ? null : json["profession"],
        targetStudent: json["targetStudent"] == null ? null : json["targetStudent"],
        interests: json["interests"] == null ? null : json["interests"],
        price: json["price"] == null ? null : json["price"],
        userId: json["userId"] == null ? null : json["userId"],
        feedbacks: rows,
        rating: avaRating,
        specialties: json["specialties"] == null ? null : json["specialties"],
    );
  }

  factory TutorModel.fromAnother(TutorModel tutor) {
    var temp = TutorModel(
        id: tutor.id,
        createdAt: tutor.createdAt,
        updatedAt: tutor.updatedAt,
        email: tutor.email,
        avatar: tutor.avatar,
        video: tutor.video,
        name: tutor.name,
        country: tutor.country,
        bio: tutor.bio,
        education: tutor.education,
        experience: tutor.experience,
        profession: tutor.profession,
        // targetStudent: tutor.targetStudent,
        interests: tutor.interests,
        price: tutor.price,
        userId: tutor.userId,
        rating: tutor.rating,
        feedbacks: tutor.feedbacks,
        specialties: tutor.specialties
    );
    temp.isFav.value = tutor.isFav.value;
    return temp;
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
