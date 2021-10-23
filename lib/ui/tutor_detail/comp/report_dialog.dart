import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:lettutor/ui/components/custom_dialog.dart';
import 'package:lettutor/ui/components/custom_text_form_field.dart';

class ReportDialog extends StatefulWidget {
  ReportDialog({Key? key}) : super(key: key);

  @override
  State<ReportDialog> createState() => _ReportDialogState();
}

class _ReportDialogState extends State<ReportDialog> {
  final _reportController = TextEditingController();
  bool isAnnoying = false;
  bool isFake = false;
  bool isInappropriate = false;
  bool isTypeReport = false;

  _onPressCloseButton() => Navigator.of(context).pop();

  _onPressSubmitButton() => Navigator.of(context).pop();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _reportController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return CustomDialog(
      title: "Reports",
      child: KeyboardDismisser(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Checkbox(
                    value: isAnnoying,
                    onChanged: (bool? value) =>
                        setState(() => isAnnoying = value!)),
                Flexible(
                  child: Text("This tutor is annoying me",
                      style: textTheme.caption),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: isFake,
                    onChanged: (bool? value) =>
                        setState(() => isFake = value!)),
                Flexible(
                  child: Text(
                      "This profile is pretending be someone or is fake",
                      style: textTheme.caption),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: isInappropriate,
                    onChanged: (bool? value) =>
                        setState(() => isInappropriate = value!)),
                Flexible(
                  child: Text("Inappropriate profile photo",
                      style: textTheme.caption),
                )
              ],
            ),
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
          ],
        ),
      ),
    );
  }
}
