import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:lettutor/controller/booking.dart';
import 'package:lettutor/controller/message.dart';
import 'package:lettutor/controller/tutor.dart';
import 'package:lettutor/models/booking.dart';
import 'package:lettutor/ui/booking/comp/schedule_view.dart';

import 'package:lettutor/utils/time_format.dart';

import 'schedule_edit.dart';

class ScheduleRow extends StatelessWidget {
  ScheduleRow({Key? key, required this.sche}) : super(key: key);
  final BookingModel sche;
  final BookingCtrl _bookingCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    ScheduleTutorModel _scheduleInfo = sche.scheduleDetailInfo!.scheduleInfo!;
    String flagString = 'icons/flags/svg/vn.svg';
    DateTime endTime = DateTime.fromMillisecondsSinceEpoch(
        sche.scheduleDetailInfo!.endPeriodTimestamp!);
    bool isHistory = DateTime.now().difference(endTime).inMinutes > 5;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                    fullTimeDetail(
                      DateTime.fromMillisecondsSinceEpoch(
                          sche.scheduleDetailInfo!.startPeriodTimestamp!),
                    ),
                    style: textTheme.headline3),
                Text(
                    fullTimeDetail(
                      DateTime.fromMillisecondsSinceEpoch(
                          sche.scheduleDetailInfo!.endPeriodTimestamp!),
                    ),
                    style: textTheme.headline4)
              ],
            ),
            SizedBox(width: 5),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          height: 30,
                          width: 30,
                          placeholder: 'assets/images/indicator.gif',
                          image: _scheduleInfo.tutorInfo!.avatar ?? "",
                          imageErrorBuilder: (context, _, strace) =>
                              Image.asset("assets/images/indicator.gif",
                                  height: 30, width: 30, fit: BoxFit.cover),
                        ),
                      ),
                      onTap: () {
                        TutorCtrl.to
                            .navigateDetail(_scheduleInfo.tutorId ?? "");
                      },
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          child: Text(
                            _scheduleInfo.tutorInfo!.name ?? "",
                            style: textTheme.headline4,
                            maxLines: 2,
                          ),
                          onTap: () {
                            TutorCtrl.to
                                .navigateDetail(_scheduleInfo.tutorId ?? "");
                          },
                        ),
                        InkWell(
                          onTap: () {
                            MessageCtrl.to
                                .navigateDetail(_scheduleInfo.tutorId ?? "");
                          },
                          child: Text(
                            "Chat",
                            style:
                                textTheme.caption!.copyWith(color: Colors.blue),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 15,
                      width: 27.5,
                      child: SvgPicture.asset(
                          flagString.replaceAll(
                              "vn",
                              (_scheduleInfo.tutorInfo!.country ?? "vn")
                                  .toLowerCase()),
                          package: 'country_icons'),
                    ),
                    Text(
                      CountryParser.tryParse(
                                  _scheduleInfo.tutorInfo!.country ?? "")!
                              .name,
                      style: textTheme.caption
                          ?.copyWith(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      isHistory == false
                          ? InkWell(
                              onTap: () {
                                BookingCtrl.to.cancelBooking(booking: sche);
                              },
                              child: Text(
                                "Cancel",
                                style: textTheme.headline4!
                                    .copyWith(color: Colors.red),
                              ),
                            )
                          : SizedBox(),
                      SizedBox(width: 5),
                      isHistory == false
                          ? InkWell(
                              child: Text(
                                "Edit",
                                style: textTheme.headline4!
                                    .copyWith(color: Colors.blue),
                              ),
                              onTap: () {
                                Get.dialog(
                                  ScheduleEdit(
                                      booking: sche),
                                );
                              },
                            )
                          : InkWell(
                              child: Text(
                                "View",
                                style: textTheme.headline4!
                                    .copyWith(color: Colors.blue),
                              ),
                              onTap: () {
                                Get.dialog(
                                  ScheduleView(
                                      booking: sche),
                                );
                              },
                            ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  isHistory == false
                      ? ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Start",
                            style: textTheme.caption,
                          ),
                        )
                      : SizedBox()
                ],
              ),
            ),
            SizedBox(width: 5)
          ],
        ),
      ],
    );
  }
}
