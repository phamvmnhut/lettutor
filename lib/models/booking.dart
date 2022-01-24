import 'dart:convert';

import 'package:lettutor/models/tutor.dart';

class ScheduleTutorModel {
  ScheduleTutorModel({
    this.id,
    this.tutorId,
    this.startTime,
    this.endTime,
    this.startTimestamp,
    this.endTimestamp,
    this.createdAt,
    this.isBooked,
    this.scheduleDetails,
    this.tutorInfo,
  });

  String? id;
  String? tutorId;
  String? startTime;
  String? endTime;
  int? startTimestamp;
  int? endTimestamp;
  DateTime? createdAt;
  bool? isBooked;
  List<ScheduleDetailModel>? scheduleDetails;
  TutorModel? tutorInfo;

  factory ScheduleTutorModel.fromRawJson(String str) =>
      ScheduleTutorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ScheduleTutorModel.fromJson(Map<String, dynamic> json) =>
      ScheduleTutorModel(
        id: json["id"] == null ? null : json["id"],
        tutorId: json["tutorId"] == null ? null : json["tutorId"],
        startTime: json["startTime"] == null ? null : json["startTime"],
        endTime: json["endTime"] == null ? null : json["endTime"],
        startTimestamp:
            json["startTimestamp"] == null ? null : json["startTimestamp"],
        endTimestamp:
            json["endTimestamp"] == null ? null : json["endTimestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        isBooked: json["isBooked"] == null ? null : json["isBooked"],
        scheduleDetails: json["scheduleDetails"] == null
            ? null
            : List<ScheduleDetailModel>.from(json["scheduleDetails"]
                .map((x) => ScheduleDetailModel.fromJson(x))),
        tutorInfo: json["tutorInfo"] == null
            ? null
            : TutorModel.fromJson(json["tutorInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "tutorId": tutorId == null ? null : tutorId,
        "startTime": startTime == null ? null : startTime,
        "endTime": endTime == null ? null : endTime,
        "startTimestamp": startTimestamp == null ? null : startTimestamp,
        "endTimestamp": endTimestamp == null ? null : endTimestamp,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "isBooked": isBooked == null ? null : isBooked,
        "scheduleDetails": scheduleDetails == null
            ? null
            : List<ScheduleDetailModel>.from(scheduleDetails!.map((x) => x.toJson())),
      };
}

class ScheduleDetailModel {
  ScheduleDetailModel({
    this.startPeriodTimestamp,
    this.endPeriodTimestamp,
    this.id,
    this.scheduleId,
    this.startPeriod,
    this.endPeriod,
    this.createdAt,
    this.updatedAt,
    this.bookingInfo,
    this.isBooked,
    this.scheduleInfo,
  });

  int? startPeriodTimestamp;
  int? endPeriodTimestamp;
  String? id;
  String? scheduleId;
  String? startPeriod;
  String? endPeriod;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<BookingModel>? bookingInfo;
  bool? isBooked;
  ScheduleTutorModel? scheduleInfo;

  factory ScheduleDetailModel.fromRawJson(String str) =>
      ScheduleDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ScheduleDetailModel.fromJson(Map<String, dynamic> json) =>
      ScheduleDetailModel(
        startPeriodTimestamp: json["startPeriodTimestamp"] == null
            ? null
            : json["startPeriodTimestamp"],
        endPeriodTimestamp: json["endPeriodTimestamp"] == null
            ? null
            : json["endPeriodTimestamp"],
        id: json["id"] == null ? null : json["id"],
        scheduleId: json["scheduleId"] == null ? null : json["scheduleId"],
        startPeriod: json["startPeriod"] == null ? null : json["startPeriod"],
        endPeriod: json["endPeriod"] == null ? null : json["endPeriod"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        bookingInfo: json["bookingInfo"] == null
            ? null
            : List<BookingModel>.from(
                json["bookingInfo"].map((x) => BookingModel.fromJson(x))),
        isBooked: json["isBooked"] == null ? null : json["isBooked"],
        scheduleInfo: json["scheduleInfo"] == null
            ? null
            : ScheduleTutorModel.fromJson(json["scheduleInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "startPeriodTimestamp":
            startPeriodTimestamp == null ? null : startPeriodTimestamp,
        "endPeriodTimestamp":
            endPeriodTimestamp == null ? null : endPeriodTimestamp,
        "id": id == null ? null : id,
        "scheduleId": scheduleId == null ? null : scheduleId,
        "startPeriod": startPeriod == null ? null : startPeriod,
        "endPeriod": endPeriod == null ? null : endPeriod,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "bookingInfo": bookingInfo == null
            ? null
            : List<BookingModel>.from(bookingInfo!.map((x) => x.toJson())),
        "isBooked": isBooked == null ? null : isBooked,
      };
}

class BookingModel {
  BookingModel({
    this.createdAtTimeStamp,
    this.updatedAtTimeStamp,
    this.id,
    this.userId,
    this.scheduleDetailId,
    this.tutorMeetingLink,
    this.studentMeetingLink,
    this.studentRequest,
    this.tutorReview,
    this.scoreByTutor,
    this.createdAt,
    this.updatedAt,
    this.recordUrl,
    this.isDeleted,
    this.scheduleDetailInfo,
  });

  int? createdAtTimeStamp;
  int? updatedAtTimeStamp;
  String? id;
  String? userId;
  String? scheduleDetailId;
  String? tutorMeetingLink;
  String? studentMeetingLink;
  String? studentRequest;
  String? tutorReview;
  int? scoreByTutor;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? recordUrl;
  bool? isDeleted;
  ScheduleDetailModel? scheduleDetailInfo;

  factory BookingModel.fromRawJson(String str) =>
      BookingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        createdAtTimeStamp: json["createdAtTimeStamp"] == null
            ? null
            : json["createdAtTimeStamp"],
        updatedAtTimeStamp: json["updatedAtTimeStamp"] == null
            ? null
            : json["updatedAtTimeStamp"],
        id: json["id"] == null ? null : json["id"],
        userId: json["userId"] == null ? null : json["userId"],
        scheduleDetailId:
            json["scheduleDetailId"] == null ? null : json["scheduleDetailId"],
        tutorMeetingLink:
            json["tutorMeetingLink"] == null ? null : json["tutorMeetingLink"],
        studentMeetingLink: json["studentMeetingLink"] == null
            ? null
            : json["studentMeetingLink"],
        studentRequest:
            json["studentRequest"] == null ? null : json["studentRequest"],
        tutorReview: json["tutorReview"] == null ? null : json["tutorReview"],
        scoreByTutor:
            json["scoreByTutor"] == null ? null : json["scoreByTutor"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        recordUrl: json["recordUrl"] == null ? null : json["recordUrl"],
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
        scheduleDetailInfo: json["scheduleDetailInfo"] == null
            ? null
            : ScheduleDetailModel.fromJson(json["scheduleDetailInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "createdAtTimeStamp":
            createdAtTimeStamp == null ? null : createdAtTimeStamp,
        "updatedAtTimeStamp":
            updatedAtTimeStamp == null ? null : updatedAtTimeStamp,
        "id": id == null ? null : id,
        "userId": userId == null ? null : userId,
        "scheduleDetailId": scheduleDetailId == null ? null : scheduleDetailId,
        "tutorMeetingLink": tutorMeetingLink == null ? null : tutorMeetingLink,
        "studentMeetingLink":
            studentMeetingLink == null ? null : studentMeetingLink,
        "studentRequest": studentRequest,
        "tutorReview": tutorReview,
        "scoreByTutor": scoreByTutor,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "recordUrl": recordUrl,
        "isDeleted": isDeleted == null ? null : isDeleted,
      };
}
