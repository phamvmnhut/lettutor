import 'package:flutter/material.dart';
import 'package:lettutor/datas/local.dart';

class SubjectSelection extends StatefulWidget {
  const SubjectSelection({Key? key}) : super(key: key);

  @override
  _SubjectSelectionState createState() => _SubjectSelectionState();
}

class _SubjectSelectionState extends State<SubjectSelection> {
  String? subject;
  List<String> specList = LocalData.Specialities;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color hlColor = Theme.of(context).highlightColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Want to learn", style: textTheme.headline4),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal:5
          ),
          decoration: BoxDecoration(
            border: Border.all(color: priColor),
            borderRadius:
            const BorderRadius.all(Radius.circular(15)),
            color: cardColor,
          ),
          child: DropdownButton<String>(
            underline: const SizedBox(),
            isExpanded: true,
            value: subject,
            hint: Text("Please select want to learn", style: textTheme.caption),
            onChanged: (newValue) {
              setState(() {
                subject = newValue;
              });
            },
            //isExpanded: true,
            items: specList
                .map<DropdownMenuItem<String>>(
                  (String e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e, style: textTheme.caption)
              ),
            )
                .toList(),
          ),
        ),
      ],
    );
  }
}
