import 'package:flutter/material.dart';
import 'package:lettutor/datas/local.dart';
import 'package:lettutor/utils/ex.dart';

class _SpecicalityItem extends StatelessWidget {
  _SpecicalityItem({Key? key, required this.text, required this.press})
      : super(key: key);
  final String text;
  final VoidCallback press;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    Color disableColor = Theme.of(context).disabledColor;
    TextStyle? btnStyle = Theme.of(context).textTheme.bodyText2;
    TextStyle? btnDisableStyle =
        Theme.of(context).textTheme.bodyText2?.copyWith(color: disableColor);
    return Padding(
      padding: const EdgeInsets.all(2),
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          primary: Theme.of(context)
              .primaryColor
              .lighter(lightness: isSelected ? 0 : 10),
        ),
        child: Text(text, style: isSelected ? btnStyle : btnDisableStyle),
      ),
    );
  }
}

class SpecicalitiesList extends StatelessWidget {
  SpecicalitiesList({Key? key}) : super(key: key);
  List<String> listSpec = LocalData.Specialities;
  String isSelected = "PET";

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (var i in listSpec)
          _SpecicalityItem(text: i, press: () {})..isSelected = isSelected == i
      ],
    );
  }
}
