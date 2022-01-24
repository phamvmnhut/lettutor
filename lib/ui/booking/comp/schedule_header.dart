import 'package:flutter/material.dart';
import 'package:lettutor/utils/ex.dart';

class ScheduleHeader extends StatelessWidget {
  const ScheduleHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color priLightgerColor = Theme.of(context).primaryColorLight;
    Color hlColor = Theme.of(context).highlightColor;

    return Container(
      color: priColor.lighter(lightness: 20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 30),
          Text("Schedule and History", style: textTheme.headline2),
          SizedBox(height: 5),
          Text(
            "You have done 9 hours in Let Tutor",
            style: textTheme.headline4,
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
