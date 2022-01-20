import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/controller/tutor.dart';
import 'package:lettutor/utils/ex.dart';

class _SpecicalityItem extends StatelessWidget {
  _SpecicalityItem({Key? key, required this.text, required this.press})
      : super(key: key);
  final String text;
  final VoidCallback press;
  bool isSelected = false;
  final TutorCtrl _tutorCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    Color disableColor = Theme.of(context).disabledColor;
    TextStyle? btnStyle = Theme.of(context).textTheme.bodyText2;
    TextStyle? btnDisableStyle =
        Theme.of(context).textTheme.bodyText2?.copyWith(color: disableColor);
    return Padding(
      padding: const EdgeInsets.all(2),
      child: ElevatedButton(
        onPressed: (){
          _tutorCtrl.filterBySpecify(text);
        },
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
  SpecicalitiesList({Key? key, required this.listSpec}) : super(key: key);

  final List<String> listSpec;
  String isSelected = "PET";

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (var i in listSpec)
          _SpecicalityItem(text: i, press: () {

          })..isSelected = isSelected == i
      ],
    );
  }
}
