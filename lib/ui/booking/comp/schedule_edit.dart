import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/controller/booking.dart';
import 'package:lettutor/models/booking.dart';
import 'package:lettutor/ui/components/custom_dialog.dart';

class ScheduleEdit extends StatelessWidget {
  ScheduleEdit({Key? key, required this.booking}) : super(key: key) {
    _noteUpdateCtrl.text = booking.studentRequest ?? "";
  }

  final BookingModel booking;
  final _noteUpdateCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return CustomDialog(
      title: 'Schedule detail',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Request for lesson", style: textTheme.headline3),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _noteUpdateCtrl,
              textAlign: TextAlign.left,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Request for teacher about this lesson',
                hintStyle: TextStyle(
                    color: Colors.black54, fontStyle: FontStyle.italic),
              ),
            ),
            // Text(booking.studentRequest ?? "", style: textTheme.caption),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Cancel", style: textTheme.bodyText2)),
              SizedBox(width: 5),
              ElevatedButton(
                  onPressed: () {
                    BookingCtrl.to.editBooking(booking: booking, note: _noteUpdateCtrl.text);
                  },
                  child: Text("Update", style: textTheme.bodyText2))
            ],
          )
        ],
      ),
    );
  }
}
