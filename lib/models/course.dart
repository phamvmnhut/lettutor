// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

class CourseModel {
  CourseModel({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.level,
    this.reason,
    this.purpose,
    this.otherDetails,
    this.defaultPrice,
    this.coursePrice,
    // this.courseType,
    // this.sectionType,
    this.visible,
    this.createdAt,
    this.updatedAt,
    this.topics,
    this.categories,
  });

  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? level;
  String? reason;
  String? purpose;
  String? otherDetails;
  int? defaultPrice;
  int? coursePrice;
  // dynamic? courseType;
  // dynamic? sectionType;
  bool? visible;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Topic>? topics;
  List<Category>? categories;

  factory CourseModel.fromRawJson(String str) => CourseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    level: json["level"] == null ? null : json["level"],
    reason: json["reason"] == null ? null : json["reason"],
    purpose: json["purpose"] == null ? null : json["purpose"],
    otherDetails: json["other_details"] == null ? null : json["other_details"],
    defaultPrice: json["default_price"] == null ? null : json["default_price"],
    coursePrice: json["course_price"] == null ? null : json["course_price"],
    // courseType: json["courseType"],
    // sectionType: json["sectionType"],
    visible: json["visible"] == null ? null : json["visible"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    topics: json["topics"] == null ? null : List<Topic>.from(json["topics"].map((x) => Topic.fromJson(x))),
    categories: json["categories"] == null ? null : List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "imageUrl": imageUrl == null ? null : imageUrl,
    "level": level == null ? null : level,
    "reason": reason == null ? null : reason,
    "purpose": purpose == null ? null : purpose,
    "other_details": otherDetails == null ? null : otherDetails,
    "default_price": defaultPrice == null ? null : defaultPrice,
    "course_price": coursePrice == null ? null : coursePrice,
    // "courseType": courseType,
    // "sectionType": sectionType,
    "visible": visible == null ? null : visible,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "topics": topics == null ? null : List<dynamic>.from(topics!.map((x) => x.toJson())),
    "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.id,
    this.title,
    this.description,
    this.key,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? title;
  String? description;
  String? key;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    key: json["key"] == null ? null : json["key"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "description": description,
    "key": key == null ? null : key,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}

class Topic {
  Topic({
    this.id,
    this.courseId,
    this.orderCourse,
    this.name,
    this.nameFile,
    this.description,
    this.videoUrl,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? courseId;
  int? orderCourse;
  String? name;
  String? nameFile;
  String? description;
  String? videoUrl;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Topic.fromRawJson(String str) => Topic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
    id: json["id"] == null ? null : json["id"],
    courseId: json["courseId"] == null ? null : json["courseId"],
    orderCourse: json["orderCourse"] == null ? null : json["orderCourse"],
    name: json["name"] == null ? null : json["name"],
    nameFile: json["nameFile"] == null ? null : json["nameFile"],
    description: json["description"] == null ? null : json["description"],
    videoUrl: json["videoUrl"] == null ? null : json["videoUrl"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "courseId": courseId == null ? null : courseId,
    "orderCourse": orderCourse == null ? null : orderCourse,
    "name": name == null ? null : name,
    "nameFile": nameFile == null ? null : nameFile,
    "description": description == null ? null : description,
    "videoUrl": videoUrl == null ? null : videoUrl,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}
