import 'package:lettutor/models/index.dart';

class TutorModel {
  final String avtUrl;
  final String name;
  bool isFav;
  final Country country;
  final double rate;
  final List<String> specList;
  final String des;

  List<String> langs;
  List<String> majors;
  String hobby;
  String exp;

  TutorModel(
      {required this.isFav,
      required this.avtUrl,
      required this.name,
      required this.country,
      required this.rate,
      required this.specList,
      required this.des,
      this.langs = const [],
      this.majors = const [],
      this.hobby = "",
      this.exp = ""
      });
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
