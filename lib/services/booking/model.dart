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
