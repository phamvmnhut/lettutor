import 'package:lettutor/models/course.dart';
import 'dart:developer' as dev;

class CoursesResponse {
  int count = 0;
  List<CourseModel> rows = [];
  CoursesResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    var list = json["rows"] as List;
    rows = list.map((i) => CourseModel.fromJson(i)).toList();
  }
}

class GetListCourseResponseModel {
  String? error;
  List<CourseModel>? tutors;
  int? count;

  GetListCourseResponseModel.fromJson(Map<String, dynamic> json) {
    error = null;
    CoursesResponse coursesResp = CoursesResponse.fromJson(json['data']);
    count = coursesResp.count;
    tutors = coursesResp.rows;
  }

  GetListCourseResponseModel.fromError(Map<String, dynamic> json){
    this.error = json['message'];
  }
}
