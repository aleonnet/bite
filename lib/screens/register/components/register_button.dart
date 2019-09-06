import 'package:bite/theme/style.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final VoidCallback _onPressed;

  RegisterButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      disabledColor: Colors.red[400],
      color: appTheme().buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onPressed: _onPressed,
      child: Text(
        'Register',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
