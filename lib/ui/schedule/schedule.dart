import 'package:flutter/material.dart';
import 'package:lettutor/datas/local.dart';
import 'package:lettutor/models/schedule.dart';
import 'package:lettutor/ui/schedule/comp/tutor_short_info.dart';
import 'package:lettutor/utils/time_format.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'comp/schedule_row.dart';
import 'comp/schedule_header.dart';

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

class ScheduleUI extends StatefulWidget {
  ScheduleUI({Key? key}) : super(key: key);
  final List<ScheduleModel> scheduleList = LocalData.scheduleList;

  @override
  _ScheduleUIState createState() => _ScheduleUIState();
}

class _ScheduleUIState extends State<ScheduleUI> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color hlColor = Theme.of(context).highlightColor;
    return Material(
      child: Column(
        children: [
          ScheduleHeader(),
          SizedBox(height: 10),
          Expanded(
            child: SfCalendar(
              view: CalendarView.schedule,
              showDatePickerButton: true,
              scheduleViewSettings: ScheduleViewSettings(
                appointmentItemHeight: 100,
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
                  monthTextStyle: textTheme.headline3,)
              ),
              dataSource: _getCalendarDataSource(),
              appointmentBuilder:
                  (BuildContext context, CalendarAppointmentDetails details) {
                final Appointment meeting = details.appointments.first;
                ScheduleModel ele = meeting.id as ScheduleModel;
                return ele.isHistory
                    ? Banner(
                        message: 'Learned',
                        location: BannerLocation.bottomStart,
                        color: Colors.transparent,
                        child: ScheduleRow(sche: ele)
                      )
                    : ScheduleRow(sche: ele);
              },
            ),
          ),
        ],
      ),
    );
  }

  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    widget.scheduleList.forEach((element) {
      appointments.add(Appointment(
          startTime: element.startTime,
          endTime: element.endTime,
          subject: element.id,
          id: element));
    });

    return _AppointmentDataSource(appointments);
  }
}
