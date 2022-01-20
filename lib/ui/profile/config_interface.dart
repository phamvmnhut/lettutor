import 'package:flutter/material.dart';

import 'package:lettutor/controller/setting.dart';

class ConfigInterfaceUI extends StatelessWidget {
  ConfigInterfaceUI({Key? key}) : super(key: key);

  final SettingCtrl _settingCtrl = SettingCtrl.to;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child:
        ElevatedButton(
          child: Text("Change"),
          onPressed: () => _settingCtrl.switchTheme(),
        ),
      ),
    );
  }
}
