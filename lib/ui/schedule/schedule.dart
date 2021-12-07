import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/datas/local.dart';
import 'package:lettutor/features/schedule.dart';
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

class ScheduleUI extends StatelessWidget {
  ScheduleUI({Key? key}) : super(key: key);

  final ScheduleCtrl _scheduleCtrl = Get.put(ScheduleCtrl());

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
            child: Obx(
              () => SfCalendar(
                view: CalendarView.schedule,
                showDatePickerButton: true,
                scheduleViewSettings: ScheduleViewSettings(
                    appointmentItemHeight: 120,
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
                  _scheduleCtrl.schedules
                      .map(
                        (element) => Appointment(
                            startTime: element.startTime,
                            endTime: element.endTime,
                            subject: element.id,
                            id: element),
                      )
                      .toList(),
                ),
                appointmentBuilder:
                    (BuildContext context, CalendarAppointmentDetails details) {
                  final Appointment meeting = details.appointments.first;
                  ScheduleModel ele = meeting.id as ScheduleModel;
                  return ele.isHistory
                      ? Banner(
                          message: 'Learned',
                          location: BannerLocation.bottomStart,
                          color: Colors.transparent,
                          child: ScheduleRow(sche: ele))
                      : ScheduleRow(sche: ele);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
