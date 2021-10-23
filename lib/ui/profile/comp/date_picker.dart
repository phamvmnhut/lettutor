import 'package:flutter/material.dart';

class DatePickerButton extends StatelessWidget {
  final DateTime selectedDate;

  DatePickerButton({Key? key, required this.selectedDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color hlColor = Theme.of(context).highlightColor;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: priColor),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: cardColor,
      ),
      child: Text("${selectedDate.toLocal()}".split(' ')[0],
          style: textTheme.caption),
    );
  }
}
