import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lettutor/ui/components/custom_dialog.dart';
import 'package:lettutor/ui/tutor_detail/comp/booking_dialog.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

class TutorSchedule extends StatefulWidget {
  const TutorSchedule({Key? key}) : super(key: key);

  @override
  _TutorScheduleState createState() => _TutorScheduleState();
}

class _TutorScheduleState extends State<TutorSchedule> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color priColor = Theme.of(context).primaryColor;
    void _onPressBookingBtn({required DateTime time}) => showDialog(
      context: context,
      builder: (context) => BookingDialog(time: time),
    );
    return CustomDialog(
      title: "Schedule",
      child: Material(
        child: SfCalendar(
          view: CalendarView.week,
          showDatePickerButton: true,
          allowedViews: <CalendarView>[
            CalendarView.day,
            CalendarView.week,
          ],
          specialRegions: _getTimeRegions(context),
          timeRegionBuilder:
              (BuildContext context, TimeRegionDetails timeRegionDetails) {
            return Container(
              color: timeRegionDetails.region.color,
              alignment: Alignment.center,
              child: Icon(
                Icons.restaurant,
                color: Colors.grey.withOpacity(0.5),
              ),
            );
          },
          dataSource: _getCalendarDataSource(),
          appointmentBuilder:
              (BuildContext context, CalendarAppointmentDetails details) {
                final Appointment meeting =
                    details.appointments.first;
            return Container(
              alignment: Alignment.center,
              child: IconButton(
                onPressed: (){
                  log(meeting.startTime.toString());
                  _onPressBookingBtn(time: meeting.startTime);
                },
                icon: Icon(
                  Icons.bookmark,
                  color: priColor ,
                ),
              ),
            );
          },
          timeSlotViewSettings: TimeSlotViewSettings(
            timeInterval: Duration(minutes: 30),
            timeFormat: "hh:mm",
            nonWorkingDays: <int>[DateTime.friday, DateTime.saturday],
          ),
        ),
      ),
    );
  }

  List<TimeRegion> _getTimeRegions(BuildContext context) {
    final List<TimeRegion> regions = <TimeRegion>[];
    final DateTime current = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, DateTime.now().hour);
    regions.add(
      TimeRegion(
          startTime: current,
          endTime: current.add(Duration(minutes: 30)),
          enablePointerInteraction: false,
          color: Colors.grey.withOpacity(0.2),
          text: 'Booked',),
    );
    regions.add(TimeRegion(
        startTime: current.add(Duration(hours: 1)),
        endTime: current.add(Duration(hours: 1, minutes: 30)),
        enablePointerInteraction: false,
        color: Colors.grey.withOpacity(0.2),
        text: 'Booked',));
    return regions;
  }

  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    final DateTime current = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, DateTime.now().hour);
    appointments.add(Appointment(
      startTime: current.add(Duration(minutes: 30)),
      endTime: current.add(Duration(hours: 1)),
      subject: 'Can Book',
    ));

    return _AppointmentDataSource(appointments);
  }
}
