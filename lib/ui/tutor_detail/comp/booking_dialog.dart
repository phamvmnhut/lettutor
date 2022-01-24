import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor/controller/booking.dart';
import 'package:lettutor/controller/user.dart';
import 'package:lettutor/models/booking.dart';

import 'package:lettutor/ui/components/custom_dialog.dart';
import 'package:lettutor/utils/time_format.dart';

class BookingDialog extends StatefulWidget {
  BookingDialog({Key? key, required this.schedule}) : super(key: key);
  final ScheduleTutorModel schedule;

  @override
  State<BookingDialog> createState() => _ReportDialogState();
}

class _ReportDialogState extends State<BookingDialog> {
  final _noteCtrl = TextEditingController();
  bool isTypeReport = false;

  @override
  void dispose() {
    super.dispose();
    _noteCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    _onPressCloseButton() => Get.back();
    double balance = UserCtrl.to.user.value!.walletInfo!.amount! / 100000;
    int price = 1;
    return CustomDialog(
      title: "Booking",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Time", style: textTheme.headline4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                fullDayWithTimeDetail(
                  DateTime.fromMillisecondsSinceEpoch(
                      widget.schedule.startTimestamp!),
                ),
                style: textTheme.caption),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Balance", style: textTheme.headline4),
              Text("You have ${balance.toString()} lessons left.",
                  style: textTheme.caption),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Price", style: textTheme.headline4),
              Text("${price.toString()} lessons", style: textTheme.caption),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Ban xu", style: textTheme.headline4),
              Text("Gia ban xu co the mac hon", style: textTheme.caption),
            ],
          ),
          Text("Note", style: textTheme.headline4),
          TextField(
            textAlignVertical: TextAlignVertical.top,
            controller: _noteCtrl,
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
            onChanged: (value) => setState(() =>
                value.isNotEmpty ? isTypeReport = true : isTypeReport = false),
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
                  onPressed: () async {
                    bool resp = await BookingCtrl.to.bookClass(
                        schedule: widget.schedule, note: _noteCtrl.text);
                    if (resp) {
                      Get.back();
                      Get.back(); // close schedule
                    }
                  },
                  child: Text("Submit", style: textTheme.button)),
            ],
          ),
        ],
      ),
    );
  }
}
