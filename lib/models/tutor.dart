import 'package:lettutor/models/index.dart';

class TutorModel {
  final String avtUrl;
  final String name;
  final bool isFav;
  final Country country;
  final double rate;
  final List<String> specList;
  final String des;

  TutorModel(
      {required this.isFav,
      required this.avtUrl,
      required this.name,
      required this.country,
      required this.rate,
      required this.specList,
      required this.des});
}

class TutorDetailModel {
  final TutorModel tutor;
  final List<String> langs;
  final List<String> majors;
  final String hobby;
  final String exp;

  TutorDetailModel(
      {required this.tutor,
      required this.langs,
      required this.majors,
      required this.hobby,
      required this.exp});
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
