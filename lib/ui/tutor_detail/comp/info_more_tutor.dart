import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/features/tutor.dart';

class InfoMoreTutor extends StatelessWidget {
  InfoMoreTutor({Key? key}) : super(key: key);
  final TutorCtrl _tutorCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text("Language", style: textTheme.headline3),
          SizedBox(height: 10),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: SpecicalitiesList()..listSpec = _tutorCtrl.tutors[tutorIndex].langs,
          // ),
          SizedBox(height: 10),
          Text("Major", style: textTheme.headline3),
          SizedBox(height: 10),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: SpecicalitiesList()..listSpec = _tutorCtrl.tutors[tutorIndex].majors,
          // ),
          SizedBox(height: 10),
          Text("Hobby", style: textTheme.headline3),
          SizedBox(height: 10),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(_tutorCtrl.tutors[tutorIndex].hobby, style: textTheme.caption),
          // ),
          SizedBox(height: 10),
          Text("Work Experience", style: textTheme.headline3),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _tutorCtrl.tutorSelected.experience,
              style: textTheme.caption,
            ),
          )
        ],
      ),
    );
  }
}
