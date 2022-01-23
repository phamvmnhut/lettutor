import 'dart:convert';
import 'package:lettutor/models/booking.dart';

import 'dart:developer' as dev;

class BookingsResponse {
  int count = 0;
  List<BookingModel> rows = [];
  BookingsResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    var list = json["rows"] as List;
    rows = list.map((i) => BookingModel.fromJson(i)).toList();
  }
}

class GetListBookingResponseModel {
  String? error;
  List<BookingModel>? bookings;
  int? count;

  GetListBookingResponseModel.fromJson(Map<String, dynamic> json) {
    error = null;
    BookingsResponse bookingResp = BookingsResponse.fromJson(json['data']);
    count = bookingResp.count;
    bookings = bookingResp.rows;
  }

  GetListBookingResponseModel.fromError(Map<String, dynamic> json){
    this.error = json['message'];
  }
}

class CancelBookedClassRequestModel {
  String scheduleDetailIds;

  CancelBookedClassRequestModel({required this.scheduleDetailIds});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scheduleDetailIds'] = this.scheduleDetailIds;
    return data;
  }
}

class EditBookedClassRequestModel {
  String studentRequest;
  EditBookedClassRequestModel({required this.studentRequest});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentRequest'] = this.studentRequest;
    return data;
  }
}

class BookClassRequestModel {
  String scheduleDetailIds;
  String note;
  BookClassRequestModel({required this.scheduleDetailIds, required this.note});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scheduleDetailIds'] = this.scheduleDetailIds;
    data['note'] = this.note;
    return data;
  }
}
