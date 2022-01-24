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
  List<String> scheduleDetailIds;
  String note;
  BookClassRequestModel({required this.scheduleDetailIds, required this.note});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scheduleDetailIds'] = scheduleDetailIds;
    data['note'] = this.note;
    return data;
  }
}

class GetListBookingQueryModel {
  int? page;
  DateTime? dateTimeGte;
  DateTime? dateTimeLte;

  GetListBookingQueryModel({ this.page, this.dateTimeGte, this.dateTimeLte});
  String toString() {
    Map<String, String> queryParameters = {
      'orderBy': 'meeting',
      'sortBy': 'desc',
      'perPage': '100',
      'page': page == null ? '1' : page.toString()
    };
    String url = "?";
    queryParameters.forEach((key, value) {
      url = url + key + "=" + value + "&";
    });
    if (dateTimeGte !=null) {
      url = url + "dateTimeGte" + "=" + dateTimeGte!.millisecondsSinceEpoch.toString() + "&";
    }
    if (dateTimeLte !=null) {
      url = url + "dateTimeLte" + "=" + dateTimeLte!.millisecondsSinceEpoch.toString() + "&";
    }
    return url.substring(0, url.length - 1);
  }
}
