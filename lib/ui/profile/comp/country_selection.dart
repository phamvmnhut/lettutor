import 'package:flutter/material.dart';

class CountrySelection extends StatefulWidget {
  const CountrySelection({Key? key}) : super(key: key);

  @override
  _CountrySelectionState createState() => _CountrySelectionState();
}

class _CountrySelectionState extends State<CountrySelection> {
  String? country;
  List<String> countries = ["Viet Nam", "American"];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color hlColor = Theme.of(context).highlightColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Country", style: textTheme.headline4),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal:5,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: priColor),
            borderRadius:
            const BorderRadius.all(Radius.circular(10)),
            color: cardColor,
          ),
          child: DropdownButton<String>(
            underline: const SizedBox(),
            isExpanded: true,
            value: country,
            hint: Text("Please select your country", style: textTheme.caption),
            onChanged: (newValue) {
              setState(() {
                country = newValue;
              });
            },
            items: countries
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
