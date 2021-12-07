import 'package:lettutor/models/tutor.dart';

class ScheduleModel {
  final String id;
  final TutorModel tutor;
  final DateTime startTime;
  final DateTime endTime;
  String requirement;
  final String rate;
  bool isHistory;

  ScheduleModel({
    required this.id,
    required this.tutor,
    required this.startTime,
    required this.endTime,
    this.requirement = "",
    required this.rate,
    this.isHistory = false,
  });
}
