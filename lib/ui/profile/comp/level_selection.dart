import 'package:flutter/material.dart';

class LevelSelection extends StatefulWidget {
  const LevelSelection({Key? key}) : super(key: key);

  @override
  _LevelSelectionState createState() => _LevelSelectionState();
}

class _LevelSelectionState extends State<LevelSelection> {
  String? level;
  List<String> levels = ["Level 1", "Level 2"];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color hlColor = Theme.of(context).highlightColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("My level", style: textTheme.headline4),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 5,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: priColor),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: cardColor,
          ),
          child: DropdownButton<String>(
            underline: const SizedBox(),
            isExpanded: true,
            value: level,
            hint: Text("Please select your level", style: textTheme.caption),
            onChanged: (newValue) {
              setState(() {
                level = newValue;
              });
            },
            items: levels
                .map<DropdownMenuItem<String>>(
                  (String e) => DropdownMenuItem<String>(
                      value: e, child: Text(e, style: textTheme.caption)),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
