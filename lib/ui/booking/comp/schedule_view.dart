import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/models/booking.dart';
import 'package:lettutor/ui/components/custom_dialog.dart';

class ScheduleView extends StatelessWidget {
  ScheduleView({Key? key, required this.booking}) : super(key: key);

  final BookingModel booking;

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
            child: Text(booking.studentRequest ?? "", style: textTheme.caption),
          ),
          Text("Tutor reviewed", style: textTheme.headline3),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(booking.tutorReview ?? "Tutor haven't reviewed yet",
                style: textTheme.caption),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Done", style: textTheme.bodyText2))
            ],
          )
        ],
      ),
    );
  }
}
