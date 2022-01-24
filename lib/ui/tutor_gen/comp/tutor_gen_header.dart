import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor/controller/booking.dart';
import 'package:lettutor/ui/learn/wating_room.dart';
import 'package:lettutor/utils/time_format.dart';

class TutorGenHeader extends StatelessWidget {
  const TutorGenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color btnColor = Theme.of(context).buttonColor;
    Color priColor = Theme.of(context).primaryColor;
    TextTheme textTheme = Theme.of(context).textTheme;
    BookingCtrl _bookingCtrl = BookingCtrl.to;
    return Container(
      color: priColor,
      height: 200,
      width: double.infinity,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Welcome to Let Tutor",
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              "Get your room by booking now",
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 10),
            Obx(() {
              if (_bookingCtrl.bookings.length > 0) {
                int startTime = _bookingCtrl
                    .bookings[0].scheduleDetailInfo!.startPeriodTimestamp!;
                String display = fullDayWithTimeDetail(
                    DateTime.fromMillisecondsSinceEpoch(startTime));
                return Text(
                  "$display Upcoming",
                  style: Theme.of(context).textTheme.headline3,
                );
              } else
                return SizedBox();
            }),
            ElevatedButton.icon(
              onPressed: () {
                if (_bookingCtrl.bookings.length > 0) {
                  Get.to(
                      () => WaitingRoomUI(booking: _bookingCtrl.bookings[0]));
                } else {}
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
              ),
              label: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Learn Now", style: textTheme.button),
              ),
              icon: Icon(Icons.library_add_check_outlined,
                  size: 20.0, color: btnColor),
            )
          ],
        ),
      ),
    );
  }
}
