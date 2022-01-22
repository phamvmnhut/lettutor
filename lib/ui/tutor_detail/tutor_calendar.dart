import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lettutor/models/booking.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:collection/collection.dart';

import 'comp/booking_dialog.dart';

import 'dart:developer' as dev;

class TutorCalendarUI extends StatefulWidget {
  TutorCalendarUI({Key? key, required this.schedules}) : super(key: key);
  final List<ScheduleTutorModel> schedules;

  @override
  _TutorCalendarUIState createState() => _TutorCalendarUIState();
}

class _TutorCalendarUIState extends State<TutorCalendarUI> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color priColor = Theme.of(context).primaryColor;
    void _onPressBookingBtn({required int index}) => showDialog(
      context: context,
      builder: (context) => BookingDialog(scheduleTutor: widget.schedules.elementAt(index)),
    );
    return Material(
      child: SfCalendar(
        view: CalendarView.week,
        showDatePickerButton: true,
        allowedViews: <CalendarView>[
          CalendarView.day,
          CalendarView.week,
        ],
        dataSource: _getCalendarDataSource(),
        appointmentBuilder:
            (BuildContext context, CalendarAppointmentDetails details) {
          final Appointment meeting =
              details.appointments.first;
          return Container(
            alignment: Alignment.center,
            child: meeting.subject == "booked" ? Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.restaurant,
                color: Colors.grey.withOpacity(0.5),
              ),
            ) : IconButton(
              onPressed: (){
                int index = int.parse(meeting.subject);
                _onPressBookingBtn(index: index);
              },
              icon: Icon(
                Icons.bookmark,
                color: priColor ,
              ),
            )
          );
        },
        timeSlotViewSettings: TimeSlotViewSettings(
          timeInterval: Duration(minutes: 30),
          timeFormat: "hh:mm",
          nonWorkingDays: <int>[DateTime.friday, DateTime.saturday],
        ),
      ),
    );
  }

  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = widget.schedules.mapIndexed((index, e) {
      DateTime endTime = DateTime.fromMillisecondsSinceEpoch(e.endTimestamp!);
      DateTime now = DateTime.now();
      return Appointment(
        startTime: DateTime.fromMillisecondsSinceEpoch(e.startTimestamp!),
        endTime: DateTime.fromMillisecondsSinceEpoch(e.endTimestamp!),
        subject: (e.isBooked == false && now.difference(endTime).inMinutes < 10) ? index.toString() : 'booked',
      );
    }).toList();
    return _AppointmentDataSource(appointments);
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
