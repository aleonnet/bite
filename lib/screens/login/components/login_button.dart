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
      height: 50,
      color: appTheme().buttonColor,
      disabledColor: Colors.red[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onPressed: _onPressed,
      child: Text('Login', style: TextStyle(color: Colors.white)),
    );
  }
}
