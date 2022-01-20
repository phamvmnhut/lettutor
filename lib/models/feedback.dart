import 'dart:convert';

class FeedbackModel {
  FeedbackModel({
    required this.id,
    required this.bookingId,
    required this.firstId,
    required this.secondId,
    required this.rating,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.firstInfo,
  });

  String id;
  String? bookingId;
  String firstId;
  String secondId;
  int rating;
  String content;
  DateTime createdAt;
  DateTime updatedAt;
  FirstIdInfoModel? firstInfo;

  factory FeedbackModel.fromRawJson(String str) => FeedbackModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
    id: json["id"],
    bookingId: json["bookingId"],
    firstId: json["firstId"],
    secondId: json["secondId"],
    rating: json["rating"],
    content: json["content"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    firstInfo:  json["firstInfo"] == null ? null :  FirstIdInfoModel.fromJson(json["firstInfo"]),
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
    "firstInfo": firstInfo!.toJson(),
  };
}

class FirstIdInfoModel {
  FirstIdInfoModel({
    this.id,
    this.level,
    this.email,
    this.google,
    this.facebook,
    this.apple,
    this.avatar,
    this.name,
    this.country,
    this.phone,
    this.language,
    this.birthday,
    this.requestPassword,
    this.isActivated,
    this.isPhoneActivated,
    this.requireNote,
    this.timezone,
    this.phoneAuth,
    this.isPhoneAuthActivated,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  String? id;
  String? level;
  String? email;
  String? google;
  String? facebook;
  String? apple;
  String? avatar;
  String? name;
  String? country;
  String? phone;
  String? language;
  DateTime? birthday;
  bool? requestPassword;
  bool? isActivated;
  bool? isPhoneActivated;
  dynamic requireNote;
  int? timezone;
  dynamic phoneAuth;
  bool? isPhoneAuthActivated;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory FirstIdInfoModel.fromRawJson(String str) => FirstIdInfoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FirstIdInfoModel.fromJson(Map<String, dynamic> json) => FirstIdInfoModel(
    id: json["id"] == null ? null : json["id"],
    level: json["level"] == null ? null : json["level"],
    email: json["email"] == null ? null : json["email"],
    google: json["google"],
    facebook: json["facebook"],
    apple: json["apple"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    name: json["name"] == null ? null : json["name"],
    country: json["country"] == null ? null : json["country"],
    phone: json["phone"] == null ? null : json["phone"],
    language: json["language"] == null ? null : json["language"],
    // birthday: json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
    requestPassword: json["requestPassword"] == null ? null : json["requestPassword"],
    isActivated: json["isActivated"] == null ? null : json["isActivated"],
    isPhoneActivated: json["isPhoneActivated"] == null ? null : json["isPhoneActivated"],
    requireNote: json["requireNote"],
    timezone: json["timezone"] == null ? null : json["timezone"],
    phoneAuth: json["phoneAuth"],
    isPhoneAuthActivated: json["isPhoneAuthActivated"] == null ? null : json["isPhoneAuthActivated"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "level": level == null ? null : level,
    "email": email == null ? null : email,
    "google": google,
    "facebook": facebook,
    "apple": apple,
    "avatar": avatar == null ? null : avatar,
    "name": name == null ? null : name,
    "country": country == null ? null : country,
    "phone": phone == null ? null : phone,
    "language": language == null ? null : language,
    "birthday": birthday == null ? null : "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
    "requestPassword": requestPassword == null ? null : requestPassword,
    "isActivated": isActivated == null ? null : isActivated,
    "isPhoneActivated": isPhoneActivated == null ? null : isPhoneActivated,
    "requireNote": requireNote,
    "timezone": timezone == null ? null : timezone,
    "phoneAuth": phoneAuth,
    "isPhoneAuthActivated": isPhoneAuthActivated == null ? null : isPhoneAuthActivated,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "deletedAt": deletedAt,
  };
}
