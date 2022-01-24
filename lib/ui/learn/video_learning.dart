import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:lettutor/models/booking.dart';
import 'package:lettutor/models/room.dart';

import 'dart:developer' as dev;

class VideoLearningUI extends StatelessWidget {
  VideoLearningUI({Key? key, required this.booking}) : super(key: key) {
    Uri studentLink = Uri.parse(booking.studentMeetingLink ?? "");
    String tokenS = studentLink.queryParameters["token"] ?? "";
    String token = tokenS.split(".")[1];
    String placeholder =
        "iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==";

    if (token.length % 4 > 0) {
      token += '=' * (4 - token.length % 4); // as suggested by Albert221
    }
    String decoded = utf8.decode(Base64Decoder().convert(token));
    room = RoomModel.fromRawJson(decoded);
  }

  final BookingModel booking;
  late RoomModel room;

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
