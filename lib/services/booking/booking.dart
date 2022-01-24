import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:lettutor/constants/strings.dart';
import 'package:lettutor/controller/user.dart';
import 'dart:developer' as dev;

import 'model.dart';

class BookingService extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.defaultContentType = "application/json";
    httpClient.baseUrl = Strings.apiUrl;
  }

  final String _getListUrl = "/booking/list/student";
  final String _cancelBookedClassUrl = "/booking";
  final String _bookClassUrl = "/booking";
  final String _editClassUrl = "/booking/student-request/";

  Future<GetListBookingResponseModel> fetchListBooking({required GetListBookingQueryModel query}) async {
    String tokenAccess = UserCtrl.to.accessToken;
    final response = await get( _getListUrl+ query.toString(),
        headers: {"Authorization": "Bearer $tokenAccess"});
    if (response.statusCode == HttpStatus.ok) {
      return GetListBookingResponseModel.fromJson(response.body);
    } else {
      return GetListBookingResponseModel.fromError(response.body);
    }
  }

  Future<String> cancelBookedClass(CancelBookedClassRequestModel data) async {
    String tokenAccess = UserCtrl.to.accessToken;
    //TODO make it complete
    // final response = await delete(_cancelBookedClassUrl,
    //     headers: {"Authorization": "Bearer $tokenAccess"});
    // if (response.statusCode == HttpStatus.ok) {
    //   return "";
    // } else {
    //   var json = response.body as Map<String, dynamic>;
    //   return json["message"];
    // }
    return "";
  }

  Future<String> bookClass(BookClassRequestModel data) async {
    String tokenAccess = UserCtrl.to.accessToken;
    final response = await post(_bookClassUrl, data.toJson(),
        headers: {"Authorization": "Bearer $tokenAccess"});
    if (response.statusCode == HttpStatus.ok) {
      return "";
    } else {
      var json = response.body as Map<String, dynamic>;
      return json["message"];
    }
  }

  Future<String> editBookedClass({required String bookedId, required String note}) async {
    String tokenAccess = UserCtrl.to.accessToken;
    String url = "$_editClassUrl$bookedId";
    final response = await post(url, EditBookedClassRequestModel(studentRequest: note).toJson(),
        headers: {"Authorization": "Bearer $tokenAccess"});
    if (response.statusCode == HttpStatus.ok) {
      return "";
    } else {
      var json = response.body as Map<String, dynamic>;
      return json["message"];
    }
  }
}
