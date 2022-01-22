import 'package:flutter/material.dart';
import 'package:lettutor/models/booking.dart';
import 'package:lettutor/ui/components/custom_dialog.dart';

class ScheduleDialog extends StatelessWidget {
  ScheduleDialog({Key? key, required this.sch}) : super(key: key);
  final ScheduleTutorModel sch;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color hlColor = Theme.of(context).highlightColor;
    _onPressDoneButton() => Navigator.of(context).pop();
    return CustomDialog(
        title: 'Schedule detail',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Request for lesson", style: textTheme.headline3),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(sch.requirement, style: textTheme.caption),
            // ),
            // Text("Tutor reviewed", style: textTheme.headline3),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(sch.rate, style: textTheme.caption),
            // ),
            // sch.isHistory ? Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     ElevatedButton(
            //         onPressed: () {
            //           _onPressDoneButton();
            //         },
            //         child: Text("Done", style: textTheme.bodyText2))
            //   ],
            // ): Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     ElevatedButton(
            //         onPressed: () {
            //           _onPressDoneButton();
            //         },
            //         child: Text("Cancel", style: textTheme.bodyText2)),
            //     SizedBox(width: 5),
            //     ElevatedButton(
            //         onPressed: () {
            //           _onPressDoneButton();
            //         },
            //         child: Text("Done", style: textTheme.bodyText2))
            //   ],
            // )
          ],
        ));
  }
}
