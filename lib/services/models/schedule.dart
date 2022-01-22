import 'package:lettutor/models/booking.dart';

class GetTutorScheduleByIdResponseModel {
  String? error;
  List<ScheduleTutorModel>? scheduleList;

  GetTutorScheduleByIdResponseModel.fromJson(Map<String, dynamic> json) {
    error = null;
    var list = json["data"] as List;
    scheduleList = list.map((i) => ScheduleTutorModel.fromJson(i)).toList();
  }

  GetTutorScheduleByIdResponseModel.fromError(Map<String, dynamic> json){
    this.error = json['message'];
  }
}

class GetTutorScheduleByIdRequestModel {
  String tutorId;

  GetTutorScheduleByIdRequestModel({required this.tutorId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tutorId'] = this.tutorId;
    return data;
  }
}