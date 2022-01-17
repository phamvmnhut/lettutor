import 'dart:convert';

class Feedback {
  Feedback({
    required this.id,
    required this.bookingId,
    required this.firstId,
    required this.secondId,
    required this.rating,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    // required this.firstInfo,
  });

  String id;
  String? bookingId;
  String firstId;
  String secondId;
  int rating;
  String content;
  DateTime createdAt;
  DateTime updatedAt;
  // FirstInfo firstInfo;

  factory Feedback.fromRawJson(String str) => Feedback.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
    id: json["id"],
    bookingId: json["bookingId"],
    firstId: json["firstId"],
    secondId: json["secondId"],
    rating: json["rating"],
    content: json["content"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    // firstInfo: FirstInfo.fromJson(json["firstInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bookingId": bookingId,
    "firstId": firstId,
    "secondId": secondId,
    "rating": rating,
    "content": content,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    // "firstInfo": firstInfo.toJson(),
  };
}
