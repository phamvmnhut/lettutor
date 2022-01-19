import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/controller//schedule.dart';
import 'package:lettutor/models/schedule.dart';
import 'package:lettutor/utils/time_format.dart';

import 'schedule_dialog.dart';
import 'tutor_short_info.dart';

class ScheduleRow extends StatelessWidget {
  ScheduleRow({Key? key, required this.sche}) : super(key: key);
  final ScheduleModel sche;
  final ScheduleCtrl _scheduleCtrl = Get.find();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color hlColor = Theme.of(context).highlightColor;
    void _onPressEditBtn() => showDialog(
          context: context,
          builder: (context) => ScheduleDialog(sch: sche),
        );
    void _onPressViewBtn() => showDialog(
          context: context,
          builder: (context) => ScheduleDialog(sch: sche),
        );
    return Column(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(fullTimeDetail(sche.startTime),
                  style: textTheme.headline3),
              Text(fullTimeDetail(sche.endTime),
                  style: textTheme.headline4)
            ],
          ),
          SizedBox(width: 5),
          TutorShortInfo(tutor: sche.tutor),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              print("Chat");
            },
            child: Text("Chat", style: textTheme.caption),
          ),
          SizedBox(width: 5),
          !sche.isHistory
              ? Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print("Goto Start lession");
                        _scheduleCtrl.navigateLearn(sche.id);
                      },
                      child: Text("Start", style: textTheme.caption),
                    ),
                    SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () {
                        _onPressEditBtn();
                      },
                      child: Text("Edit", style: textTheme.caption),
                    ),
                  ],
                )
              : ElevatedButton(
                  onPressed: () {
                    _onPressEditBtn();
                  },
                  child: Text("View", style: textTheme.caption),
                ),
          SizedBox(width: 5),
        ],
      )
    ]);
  }
}
