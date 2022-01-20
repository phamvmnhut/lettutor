import 'dart:convert';

class UserEnum {
  static const List<String> UserLevel = [
    "BEGINNER",
    "HIGHER_BEGINNER",
    "PRE_INTERMEDIATE",
    "INTERMEDIATE",
    "UPPER_INTERMEDIATE",
    "ADVANCED",
    "PROFICIENCY"
  ];
}

class UserModel {
  UserModel({
    this.id,
    this.email,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.roles,
    this.language,
    this.birthday,
    this.isActivated,
    // this.tutorInfo,
    // this.walletInfo,
    // this.feedbacks,
    // this.courses,
    this.requireNote,
    this.level,
    this.learnTopics,
    // this.testPreparations,
    this.isPhoneActivated,
    this.timezone,
    // this.referralInfo,
    this.avgRating,
    // this.priceOfEachSession,
  });

  String? id;
  String? email;
  String? name;
  String? avatar;
  String? country;
  String? phone;
  List<String>? roles;
  String? language;
  DateTime? birthday;
  bool? isActivated;

  // dynamic tutorInfo;
  // WalletInfo walletInfo;
  // List<dynamic> feedbacks;
  // List<dynamic> courses;
  String? requireNote;
  String? level;

  List<LearnTopic>? learnTopics;
  // List<dynamic> testPreparations;
  bool? isPhoneActivated;
  int? timezone;

  // ReferralInfo referralInfo;
  double? avgRating;

  // PriceOfEachSession priceOfEachSession;

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        name: json["name"] == null ? null : json["name"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        country: json["country"] == null ? null : json["country"],
        phone: json["phone"] == null ? null : json["phone"],
        roles: json["roles"] == null
            ? null
            : List<String>.from(json["roles"].map((x) => x)),
        language: json["language"],
        birthday:
            json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
        isActivated: json["isActivated"] == null ? null : json["isActivated"],
        // tutorInfo: json["tutorInfo"],
        // walletInfo: json["walletInfo"] == null ? null : WalletInfo.fromJson(json["walletInfo"]),
        // feedbacks: json["feedbacks"] == null ? null : List<dynamic>.from(json["feedbacks"].map((x) => x)),
        // courses: json["courses"] == null ? null : List<dynamic>.from(json["courses"].map((x) => x)),
        requireNote: json["requireNote"],
        level: json["level"] == null ? null : json["level"],
        learnTopics: json["learnTopics"] == null ? null : List<LearnTopic>.from(json["learnTopics"].map((x) => LearnTopic.fromJson(x))),
        // testPreparations: json["testPreparations"] == null ? null : List<dynamic>.from(json["testPreparations"].map((x) => x)),
        isPhoneActivated:
            json["isPhoneActivated"] == null ? null : json["isPhoneActivated"],
        timezone: json["timezone"] == null ? null : json["timezone"],
        // referralInfo: json["referralInfo"] == null ? null : ReferralInfo.fromJson(json["referralInfo"]),
        avgRating:
            json["avgRating"] == null ? null : json["avgRating"].toDouble(),
        // priceOfEachSession: json["priceOfEachSession"] == null ? null : PriceOfEachSession.fromJson(json["priceOfEachSession"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "name": name == null ? null : name,
        "avatar": avatar == null ? null : avatar,
        "country": country == null ? null : country,
        "phone": phone == null ? null : phone,
        "roles":
            roles == null ? null : List<dynamic>.from(roles!.map((x) => x)),
        "language": language,
        "birthday": birthday == null
            ? null
            : "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
        "isActivated": isActivated == null ? null : isActivated,
        // "tutorInfo": tutorInfo,
        // "walletInfo": walletInfo == null ? null : walletInfo.toJson(),
        // "feedbacks": feedbacks == null ? null : List<dynamic>.from(feedbacks.map((x) => x)),
        // "courses": courses == null ? null : List<dynamic>.from(courses.map((x) => x)),
        "requireNote": requireNote,
        "level": level == null ? null : level,
        "learnTopics": learnTopics == null ? null : List<dynamic>.from(learnTopics!.map((x) => x)),
        // "testPreparations": testPreparations == null ? null : List<dynamic>.from(testPreparations.map((x) => x)),
        "isPhoneActivated": isPhoneActivated == null ? null : isPhoneActivated,
        "timezone": timezone == null ? null : timezone,
        // "referralInfo": referralInfo == null ? null : referralInfo.toJson(),
        "avgRating": avgRating == null ? null : avgRating,
        // "priceOfEachSession": priceOfEachSession == null ? null : priceOfEachSession.toJson(),
      };
}

class LearnTopic {
  LearnTopic({
    this.id,
    this.key,
    this.name,
  });

  int? id;
  String? key;
  String? name;

  factory LearnTopic.fromRawJson(String str) => LearnTopic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LearnTopic.fromJson(Map<String, dynamic> json) => LearnTopic(
    id: json["id"] == null ? null : json["id"],
    key: json["key"] == null ? null : json["key"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "key": key == null ? null : key,
    "name": name == null ? null : name,
  };
}


// class PriceOfEachSession {
//   PriceOfEachSession({
//     this.id,
//     this.key,
//     this.price,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   String id;
//   String key;
//   String price;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   factory PriceOfEachSession.fromRawJson(String str) => PriceOfEachSession.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory PriceOfEachSession.fromJson(Map<String, dynamic> json) => PriceOfEachSession(
//     id: json["id"] == null ? null : json["id"],
//     key: json["key"] == null ? null : json["key"],
//     price: json["price"] == null ? null : json["price"],
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "key": key == null ? null : key,
//     "price": price == null ? null : price,
//     "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
//     "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
//   };
// }
//
// class ReferralInfo {
//   ReferralInfo({
//     this.id,
//     this.referralCode,
//     this.userId,
//     this.referralPackId,
//     this.createdAt,
//     this.updatedAt,
//     this.referralPackInfo,
//   });
//
//   int id;
//   String referralCode;
//   String userId;
//   int referralPackId;
//   DateTime createdAt;
//   DateTime updatedAt;
//   ReferralPackInfo referralPackInfo;
//
//   factory ReferralInfo.fromRawJson(String str) => ReferralInfo.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory ReferralInfo.fromJson(Map<String, dynamic> json) => ReferralInfo(
//     id: json["id"] == null ? null : json["id"],
//     referralCode: json["referralCode"] == null ? null : json["referralCode"],
//     userId: json["userId"] == null ? null : json["userId"],
//     referralPackId: json["referralPackId"] == null ? null : json["referralPackId"],
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     referralPackInfo: json["referralPackInfo"] == null ? null : ReferralPackInfo.fromJson(json["referralPackInfo"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "referralCode": referralCode == null ? null : referralCode,
//     "userId": userId == null ? null : userId,
//     "referralPackId": referralPackId == null ? null : referralPackId,
//     "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
//     "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
//     "referralPackInfo": referralPackInfo == null ? null : referralPackInfo.toJson(),
//   };
// }
//
// class ReferralPackInfo {
//   ReferralPackInfo({
//     this.id,
//     this.earnPercent,
//     this.isActive,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   int id;
//   int earnPercent;
//   bool isActive;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   factory ReferralPackInfo.fromRawJson(String str) => ReferralPackInfo.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory ReferralPackInfo.fromJson(Map<String, dynamic> json) => ReferralPackInfo(
//     id: json["id"] == null ? null : json["id"],
//     earnPercent: json["earnPercent"] == null ? null : json["earnPercent"],
//     isActive: json["isActive"] == null ? null : json["isActive"],
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "earnPercent": earnPercent == null ? null : earnPercent,
//     "isActive": isActive == null ? null : isActive,
//     "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
//     "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
//   };
// }
//
// class WalletInfo {
//   WalletInfo({
//     this.id,
//     this.userId,
//     this.amount,
//     this.isBlocked,
//     this.createdAt,
//     this.updatedAt,
//     this.bonus,
//   });
//
//   String id;
//   String userId;
//   String amount;
//   bool isBlocked;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int bonus;
//
//   factory WalletInfo.fromRawJson(String str) => WalletInfo.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory WalletInfo.fromJson(Map<String, dynamic> json) => WalletInfo(
//     id: json["id"] == null ? null : json["id"],
//     userId: json["userId"] == null ? null : json["userId"],
//     amount: json["amount"] == null ? null : json["amount"],
//     isBlocked: json["isBlocked"] == null ? null : json["isBlocked"],
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     bonus: json["bonus"] == null ? null : json["bonus"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "userId": userId == null ? null : userId,
//     "amount": amount == null ? null : amount,
//     "isBlocked": isBlocked == null ? null : isBlocked,
//     "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
//     "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
//     "bonus": bonus == null ? null : bonus,
//   };
// }
