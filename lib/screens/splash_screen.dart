import 'package:bite/theme/style.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme().splashColor,
      body: Center(
          child: Text(
        'bite',
        style: TextStyle(color: appTheme().textSelectionColor),
      )),
    );
  }
}
