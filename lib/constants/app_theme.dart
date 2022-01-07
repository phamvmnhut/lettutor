import 'package:flutter/cupertino.dart';

import './colors.dart';
import './font_family.dart';

import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData.light().copyWith(
  primaryColor: AppColors.mainColor[500],
  accentColor: AppColors.accentColor[500],
  primaryColorLight: AppColors.mainColor[200],
  primaryColorDark: AppColors.mainColor[800],
  focusColor: AppColors.mainColor[800],
  dividerColor: AppColors.mainColor[800],
  brightness: Brightness.light,
  primaryColorBrightness: Brightness.light,
  accentColorBrightness: Brightness.light,
  cardColor: Colors.white70,
  buttonColor: Colors.white70,
  disabledColor: Colors.black26,
  backgroundColor: Colors.white54,
  indicatorColor: AppColors.mainColor[800],
  textTheme: TextTheme(
    headline1: TextStyle(),
    headline2: TextStyle(fontSize: 22),
    headline3: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    headline4: TextStyle(fontSize: 16),
    headline5: TextStyle(),
    headline6: TextStyle(),
    caption: TextStyle(color: Colors.black54, fontSize: 14),
    overline: TextStyle(),
    subtitle1: TextStyle(),
    subtitle2: TextStyle(),

    bodyText1: TextStyle(
      // big button
      color: Colors.white70,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    button: TextStyle(color: Colors.white70, fontSize: 16),
    // normal
    bodyText2: TextStyle(
      // small button
      color: Colors.white70,
      fontSize: 14,
    ),
  ).apply(
    bodyColor: Colors.black87,
    displayColor: Colors.black54,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: AppColors.mainColor[600],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      textStyle: TextStyle(fontSize: 14),
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.black45
  ),
);

final ThemeData themeDataDark = ThemeData.dark().copyWith(
  primaryColor: AppColors.mainColor[500],
  accentColor: AppColors.accentColor[500],
  primaryColorLight: AppColors.mainColor[200],
  primaryColorDark: AppColors.mainColor[800],
  focusColor: AppColors.mainColor[800],
  dividerColor: AppColors.mainColor[800],
  brightness: Brightness.dark,
  primaryColorBrightness: Brightness.dark,
  accentColorBrightness: Brightness.dark,
  cardColor: Colors.black87,
  buttonColor: Colors.black54,
  disabledColor: Colors.black45,
  backgroundColor: Colors.black38,
  indicatorColor: AppColors.mainColor[800],

  textTheme: TextTheme(
    headline1: TextStyle(),
    headline2: TextStyle(fontSize: 22),
    headline3: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    headline4: TextStyle(fontSize: 16),
    caption: TextStyle(fontSize: 14, color: Colors.white60),
    headline5: TextStyle(),
    headline6: TextStyle(),
    overline: TextStyle(),
    subtitle1: TextStyle(),
    subtitle2: TextStyle(),

    bodyText1: TextStyle(
      // big button
      color: Colors.black38,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    button: TextStyle(color: Colors.black87, fontSize: 16),
    // normal
    bodyText2: TextStyle(
      // small button
      color: Colors.black87,
      fontSize: 14,
    ),
  ).apply(
    bodyColor: Colors.white54,
    displayColor: Colors.white70,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: AppColors.mainColor[700],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      textStyle: TextStyle(fontSize: 14),
    ),
  ),
  iconTheme: IconThemeData(
      color: Colors.white60
  ),
);
