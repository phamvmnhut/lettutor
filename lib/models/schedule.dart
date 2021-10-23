import 'package:lettutor/models/tutor.dart';

class ScheduleModel {
  final String id;
  final TutorModel tutor;
  final DateTime startTime;
  final DateTime endTime;
  final String requirement;
  final String rate;
  final bool isHistory;

  ScheduleModel({
    required this.id,
    required this.tutor,
    required this.startTime,
    required this.endTime,
    required this.requirement,
    required this.rate,
    required this.isHistory,
  });
}
