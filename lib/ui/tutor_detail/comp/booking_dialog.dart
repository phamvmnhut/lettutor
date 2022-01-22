import 'package:flutter/material.dart';
import 'package:lettutor/models/booking.dart';
import 'package:lettutor/ui/components/custom_dialog.dart';
import 'package:lettutor/utils/time_format.dart';

class BookingDialog extends StatefulWidget {
  BookingDialog({Key? key, required this.scheduleTutor}) : super(key: key);
  final ScheduleTutorModel scheduleTutor;
  @override
  State<BookingDialog> createState() => _ReportDialogState();
}

class _ReportDialogState extends State<BookingDialog> {
  final _reportController = TextEditingController();
  bool isTypeReport = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _reportController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    _onPressCloseButton() => Navigator.of(context).pop();
    _onPressSubmitButton() => Navigator.of(context).pop();
    return CustomDialog(
      title: "Booking",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

        Text("Time", style: textTheme.headline4),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(fullDayWithTimeDetail(widget.scheduleTutor.createdAt!), style: textTheme.caption),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text("So du", style: textTheme.headline4),
            Text("Ban con 2 buoi hoc", style: textTheme.caption),
        ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Gia", style: textTheme.headline4),
            Text("2 buoi hoc", style: textTheme.caption),
          ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Ban xu", style: textTheme.headline4),
            Text("Gia ban xu co the mac hon", style: textTheme.caption),
          ],),
        Text("Note", style: textTheme.headline4),
        TextField(
          textAlignVertical: TextAlignVertical.top,
          controller: _reportController,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          expands: false,
          decoration: const InputDecoration(
            hintText: 'Please help us know details about your problem',
            hintMaxLines: 3,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          onChanged: (value) => setState(() => value.isNotEmpty
              ? isTypeReport = true
              : isTypeReport = false),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  _onPressCloseButton();
                },
                child: Text("Cancel", style: textTheme.bodyText2)),
            SizedBox(width: 10),
            ElevatedButton(
                onPressed: () {
                  _onPressSubmitButton();
                },
                child: Text("Submit", style: textTheme.button)),
          ],
        ),
      ],),
    );
  }
}
