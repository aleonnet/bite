import 'package:bite/theme/style.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback _onPressed;

  LoginButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 60,
      color: appTheme().buttonColor,
      disabledColor: appTheme().disabledColor,
      onPressed: _onPressed,
      child:
          Text('Login', style: TextStyle(color: appTheme().textSelectionColor)),
    );
  }
}
