import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/ui/tutor_gen/comp/specialities_list.dart';

class InfoMoreTutor extends StatelessWidget {
  InfoMoreTutor({Key? key, required this.tutorDetail}) : super(key: key);
  final TutorModel tutorDetail;

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SpecicalitiesList()..listSpec = tutorDetail.langs,
          ),
          SizedBox(height: 10),
          Text("Major", style: textTheme.headline3),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SpecicalitiesList()..listSpec = tutorDetail.majors,
          ),
          SizedBox(height: 10),
          Text("Hobby", style: textTheme.headline3),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(tutorDetail.hobby, style: textTheme.caption),
          ),
          SizedBox(height: 10),
          Text("Work Experience", style: textTheme.headline3),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(tutorDetail.exp, style: textTheme.caption),
          )
        ],
      ),
    );
  }
}

