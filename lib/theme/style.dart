import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      primaryColor: Colors.white,
      primaryTextTheme: Typography.whiteCupertino,
      textTheme: Typography.whiteCupertino,
      primaryColorDark: Colors.white,
      accentColor: Colors.redAccent,
      buttonColor: Colors.redAccent,
      disabledColor: Colors.grey[400],
      splashColor: Colors.black,
      textSelectionColor: Colors.white);
}
