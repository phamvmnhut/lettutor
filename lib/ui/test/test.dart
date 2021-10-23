import 'package:flutter/material.dart';
import 'package:lettutor/datas/local.dart';
import 'package:lettutor/models/schedule.dart';
import 'package:lettutor/ui/components/background.dart';

class TestUI extends StatelessWidget {
  const TestUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Background.another2(
          child: Container(
        color: Colors.redAccent,
        height: 50,
        width: 50,
      )),
    );
  }
}
