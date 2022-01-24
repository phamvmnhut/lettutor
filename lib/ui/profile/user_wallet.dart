import 'package:flutter/material.dart';

import 'package:lettutor/controller/user.dart';
import 'package:lettutor/models/user.dart';

import 'package:lettutor/ui/components/background.dart';
import 'package:lettutor/widgets/circle_avatar.dart';

class UserWalletUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    UserModel _user = UserCtrl.to.user.value!;
    Color cardCol = Theme.of(context).cardColor;
    return Material(
      child: SafeArea(
        child: Background(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatarWidget(imageUrl: _user.avatar ?? "", size: 50),
                    SizedBox(width: 10),
                    Text(
                      _user.name ?? "",
                      style: textTheme.headline2,
                    )
                  ],
                ),
                SizedBox(height: 15),
                Text("Wallet", style: textTheme.headline3),
                Container(
                  padding:
                      EdgeInsets.only(left: 18, right: 18, top: 22, bottom: 22),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cardCol),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            (UserCtrl.to.user.value!.walletInfo!.amount! /
                                        100000)
                                    .toString() +
                                " lessons",
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Current Balance",
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "+",
                          style:
                              TextStyle(color: Color(0xff1B1D28), fontSize: 22),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text("Bonus", style: textTheme.headline3),
                Container(
                  padding:
                      EdgeInsets.only(left: 18, right: 18, top: 22, bottom: 22),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cardCol),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            (UserCtrl.to.user.value!.walletInfo!.bonus! /
                                        100000)
                                    .toString() +
                                " lessons",
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "+",
                          style:
                              TextStyle(color: Color(0xff1B1D28), fontSize: 22),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
