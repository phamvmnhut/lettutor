import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

import 'package:lettutor/controller/booking.dart';
import 'package:lettutor/models/booking.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'comp/schedule_row.dart';
import 'comp/schedule_header.dart';

class BookingUI extends StatelessWidget {
  BookingUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color hlColor = Theme.of(context).highlightColor;
    final BookingCtrl _bookingCtrl = BookingCtrl.to;
    return Material(
      child: Column(
        children: [
          ScheduleHeader(),
          SizedBox(height: 10),
          Expanded(
            child: Obx(
              () => SfCalendar(
                view: CalendarView.schedule,
                showDatePickerButton: true,
                scheduleViewSettings: ScheduleViewSettings(
                    appointmentItemHeight: 70,
                    hideEmptyScheduleWeek: true,
                    dayHeaderSettings: DayHeaderSettings(
                      dayFormat: 'EEE',
                      dayTextStyle: textTheme.caption,
                      dateTextStyle: textTheme.headline4,
                    ),
                    monthHeaderSettings: MonthHeaderSettings(
                      monthFormat: 'MMMM, yyyy',
                      height: 100,
                      textAlign: TextAlign.left,
                      backgroundColor: hlColor,
                      monthTextStyle: textTheme.headline3,
                    )),
                dataSource: _AppointmentDataSource(
                  _bookingCtrl.bookings.mapIndexed((index, element) {
                    int startTime =
                        element.scheduleDetailInfo!.startPeriodTimestamp!;
                    int endTime =
                        element.scheduleDetailInfo!.endPeriodTimestamp!;
                    return Appointment(
                        startTime:
                            DateTime.fromMicrosecondsSinceEpoch(startTime),
                        endTime: DateTime.fromMicrosecondsSinceEpoch(endTime),
                        subject: index.toString());
                  }).toList(),
                ),
                appointmentBuilder:
                    (BuildContext context, CalendarAppointmentDetails details) {
                  final Appointment meeting = details.appointments.first;
                  BookingModel ele = _bookingCtrl.bookings[int.parse(meeting.subject)];
                  return ScheduleRow(sche: ele);
                  // return ele.scheduleDetailInfo!.isBooked!
                  //     ? Banner(
                  //         message: 'Learned',
                  //         location: BannerLocation.bottomStart,
                  //         color: Colors.transparent,
                  //         child: ScheduleRow(sche: ele))
                  //     :
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
