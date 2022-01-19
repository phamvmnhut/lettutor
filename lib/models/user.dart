import 'dart:convert';

class UserModel {
  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    this.country,
    required this.phone,
    // required this.roles,
    this.language,
    this.birthday,
    // required this.isActivated,
    // this.tutorInfo,
    // required this.walletInfo,
    // this.feedbacks,
    // this.courses,
    this.requireNote,
    this.level,
    // this.learnTopics,
    // this.testPreparations,
    // required this.isPhoneActivated,
    required this.timezone,
    // this.referralInfo,
    // this.avgRating,
    // this.priceOfEachSession,
  });

  String id;
  String email;
  String name;
  String avatar;
  dynamic country;
  String phone;
  // List<String> roles;
  dynamic language;
  dynamic birthday;
  // bool isActivated;
  // dynamic tutorInfo;
  // WalletInfo walletInfo;
  // List<dynamic> feedbacks;
  // List<dynamic> courses;
  dynamic requireNote;
  dynamic level;
  // List<dynamic> learnTopics;
  // List<dynamic> testPreparations;
  // bool isPhoneActivated;
  int timezone;
  // ReferralInfo referralInfo;
  // int avgRating;
  // PriceOfEachSession priceOfEachSession;

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    email: json["email"],
    name: json["name"],
    avatar: json["avatar"],
    country: json["country"],
    phone: json["phone"],
    // roles: List<String>.from(json["roles"].map((x) => x)),
    language: json["language"],
    birthday: json["birthday"],
    // isActivated: json["isActivated"],
    // tutorInfo: json["tutorInfo"],
    // walletInfo: WalletInfo.fromJson(json["walletInfo"]),
    // feedbacks: List<dynamic>.from(json["feedbacks"].map((x) => x)),
    // courses: List<dynamic>.from(json["courses"].map((x) => x)),
    requireNote: json["requireNote"],
    level: json["level"],
    // learnTopics: List<dynamic>.from(json["learnTopics"].map((x) => x)),
    // testPreparations: List<dynamic>.from(json["testPreparations"].map((x) => x)),
    // isPhoneActivated: json["isPhoneActivated"],
    timezone: json["timezone"],
    // referralInfo: ReferralInfo.fromJson(json["referralInfo"]),
    // avgRating: json["avgRating"],
    // priceOfEachSession: PriceOfEachSession.fromJson(json["priceOfEachSession"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
    "avatar": avatar,
    "country": country,
    "phone": phone,
    // "roles": List<dynamic>.from(roles.map((x) => x)),
    "language": language,
    "birthday": birthday,
    // "isActivated": isActivated,
    // "tutorInfo": tutorInfo,
    // "walletInfo": walletInfo.toJson(),
    // "feedbacks": List<dynamic>.from(feedbacks.map((x) => x)),
    // "courses": List<dynamic>.from(courses.map((x) => x)),
    "requireNote": requireNote,
    "level": level,
    // "learnTopics": List<dynamic>.from(learnTopics.map((x) => x)),
    // "testPreparations": List<dynamic>.from(testPreparations.map((x) => x)),
    // "isPhoneActivated": isPhoneActivated,
    "timezone": timezone,
    // "referralInfo": referralInfo.toJson(),
    // "avgRating": avgRating,
    // "priceOfEachSession": priceOfEachSession.toJson(),
  };
}
//
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
//     id: json["id"],
//     key: json["key"],
//     price: json["price"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "key": key,
//     "price": price,
//     "createdAt": createdAt.toIso8601String(),
//     "updatedAt": updatedAt.toIso8601String(),
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
//     id: json["id"],
//     referralCode: json["referralCode"],
//     userId: json["userId"],
//     referralPackId: json["referralPackId"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//     referralPackInfo: ReferralPackInfo.fromJson(json["referralPackInfo"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "referralCode": referralCode,
//     "userId": userId,
//     "referralPackId": referralPackId,
//     "createdAt": createdAt.toIso8601String(),
//     "updatedAt": updatedAt.toIso8601String(),
//     "referralPackInfo": referralPackInfo.toJson(),
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
//     id: json["id"],
//     earnPercent: json["earnPercent"],
//     isActive: json["isActive"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "earnPercent": earnPercent,
//     "isActive": isActive,
//     "createdAt": createdAt.toIso8601String(),
//     "updatedAt": updatedAt.toIso8601String(),
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
//     id: json["id"],
//     userId: json["userId"],
//     amount: json["amount"],
//     isBlocked: json["isBlocked"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//     bonus: json["bonus"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "userId": userId,
//     "amount": amount,
//     "isBlocked": isBlocked,
//     "createdAt": createdAt.toIso8601String(),
//     "updatedAt": updatedAt.toIso8601String(),
//     "bonus": bonus,
//   };
// }
