import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor/controller/setting.dart';

import 'package:lettutor/ui/components/background.dart';

class ConfigInterfaceUI extends StatelessWidget {
  ConfigInterfaceUI({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardCol = Theme.of(context).cardColor;
    return Material(
      child: SafeArea(
        child: Background(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                Text("setting_app".tr, style: textTheme.headline2),
                SizedBox(height: 20),
                Container(
                  padding:
                  EdgeInsets.only(left: 18, right: 18, top: 22, bottom: 22),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cardCol),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("theme".tr, style: textTheme.headline3),
                      ElevatedButton(
                        child: Text("change".tr),
                        onPressed: () => SettingCtrl.to.switchTheme(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:20),
                Container(
                  padding:
                  EdgeInsets.only(left: 18, right: 18, top: 22, bottom: 22),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cardCol),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("language".tr, style: textTheme.headline3),
                      ElevatedButton(
                        child: Text("change".tr),
                        onPressed: () => SettingCtrl.to.switchLanguage(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
