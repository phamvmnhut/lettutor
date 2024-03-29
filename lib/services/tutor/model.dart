import 'package:lettutor/models/tutor.dart';
import 'dart:developer' as dev;

import 'package:lettutor/models/tutor_detail.dart';

class TutorsResponse {
  int count = 0;
  List<TutorModel> rows = [];
  TutorsResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    var list = json["rows"] as List;
    rows = list.map((i) => TutorModel.fromJson(i)).toList();
  }
}

class GetListTutorResponseModel {
  String? error;
  List<TutorModel>? tutors;
  int? count;

  List<TutorModel> _updateFavoriteTutor(List<TutorModel> listTutor, List<dynamic> list) {
    List rows = list.map((i) => i["secondId"]).toList();
    var listTutorResp = listTutor.map((e) {
      if (rows.indexWhere((element) => element.toString() == e.userId) != -1){
        e.isFav.value = true;
      }
      return e;
    }).toList();
    return listTutorResp;
  }
  GetListTutorResponseModel.fromJson(Map<String, dynamic> json) {
    error = null;
    TutorsResponse tutorsResp = TutorsResponse.fromJson(json['tutors']);
    dev.log(tutorsResp.rows.length.toString(), name: "ListTutor");
    List<TutorModel> rowsUpdate = _updateFavoriteTutor(tutorsResp.rows, json['favoriteTutor']);
    count = tutorsResp.count;
    tutors = rowsUpdate;
  }
  GetListTutorResponseModel.fromSearchJson(Map<String, dynamic> json) {
    error = null;
    TutorsResponse tutorsResp = TutorsResponse.fromJson(json);
    // List<TutorModel> rowsUpdate = _updateFavoriteTutor(tutorsResp.rows, json['favoriteTutor']);
    count = tutorsResp.count;
    tutors = tutorsResp.rows;
  }
  GetListTutorResponseModel.fromError(Map<String, dynamic> json){
    this.error = json['message'];
  }
}

class ManageFavoriteTutorRequestModel {
  String tutorId;

  ManageFavoriteTutorRequestModel({required this.tutorId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tutorId'] = this.tutorId;
    return data;
  }
}

class SearchTutorRequestModel {
  String search;

  SearchTutorRequestModel({required this.search});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['search'] = this.search;
    return data;
  }
}

class GetTutorInformationByIdResponseModel {
  String? error;
  TutorDetailModel? tutorDetail;

  List<TutorModel> _updateFeedbackTutor(List<TutorModel> listTutor, List<dynamic> list) {
    List rows = list.map((i) => i["secondId"]).toList();
    var listTutorResp = listTutor.map((e) {
      if (rows.indexWhere((element) => element.toString() == e.userId) != -1){
        e.isFav.value = true;
      }
      return e;
    }).toList();
    return listTutorResp;
  }

  GetTutorInformationByIdResponseModel.fromJson(Map<String, dynamic> json) {
    error = null;
    tutorDetail = TutorDetailModel.fromJson(json);
  }
  GetTutorInformationByIdResponseModel.fromError(Map<String, dynamic> json){
    this.error = json['message'];
  }
}
