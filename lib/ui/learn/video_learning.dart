import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/models/booking.dart';

class VideoLearningUI extends StatelessWidget {
  VideoLearningUI({Key? key,required this.booking}) : super(key: key);

  final BookingModel booking;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Text("back"),
              ),
              Text("Learning Video Call")
            ],
          ),
        ),
      ),
    );
  }
}
