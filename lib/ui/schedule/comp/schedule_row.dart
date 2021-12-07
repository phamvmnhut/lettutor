import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/models/schedule.dart';
import 'package:lettutor/utils/time_format.dart';

import 'schedule_dialog.dart';
import 'tutor_short_info.dart';

class ScheduleRow extends StatefulWidget {
  ScheduleRow({Key? key, required this.sche}) : super(key: key);
  final ScheduleModel sche;

  @override
  _ScheduleRowState createState() => _ScheduleRowState();
}

class _ScheduleRowState extends State<ScheduleRow> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color hlColor = Theme.of(context).highlightColor;
    void _onPressEditBtn() => showDialog(
          context: context,
          builder: (context) => ScheduleDialog(sch: widget.sche),
        );
    void _onPressViewBtn() => showDialog(
          context: context,
          builder: (context) => ScheduleDialog(sch: widget.sche),
        );
    return Column(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(fullTimeDetail(widget.sche.startTime),
                  style: textTheme.headline3),
              Text(fullTimeDetail(widget.sche.endTime),
                  style: textTheme.headline4)
            ],
          ),
          SizedBox(width: 5),
          TutorShortInfo(tutor: widget.sche.tutor),
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
          widget.sche.isHistory
              ? Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print("Goto Start lession");
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
//
// widget.sche.isHistory ? Column(
// children: [
// ElevatedButton(
// onPressed: () {
// _onPressViewBtn();
// },
// style: ElevatedButton.styleFrom(
// minimumSize: Size.zero, // <-- Add this
// padding: EdgeInsets.fromLTRB(10, 6, 10, 6), // <-- and this
// ),
// child: Text("View", style: textTheme.caption),
// ),
// SizedBox(height: 5),
// ],
// ): Column(
// children: [
// ElevatedButton(
// style: ElevatedButton.styleFrom(
// minimumSize: Size.zero, // <-- Add this
// padding: EdgeInsets.fromLTRB(10, 6, 10, 6), // <-- and this
// ),
// onPressed: () {
// print("Goto Start lession");
// },
// child: Text("Start", style: textTheme.caption),
// ),
// // SizedBox(height: 5),
// ElevatedButton(
// style: ElevatedButton.styleFrom(
// minimumSize: Size.zero, // <-- Add this
// padding: EdgeInsets.fromLTRB(10, 6, 10, 6), // <-- and this
// ),
// onPressed: () {
// _onPressEditBtn();
// },
// child: Text("Edit", style: textTheme.caption),
// ),
// SizedBox(height: 5),
// ],
// ),
