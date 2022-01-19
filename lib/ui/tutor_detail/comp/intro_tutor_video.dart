import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor_detail.dart';

class IntroTutorVideo extends StatelessWidget {
  IntroTutorVideo({Key? key, required this.data}) : super(key: key);
  final TutorDetailModel data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: double.infinity,
        color: Colors.redAccent,
      ),
    );
  }
}
