import 'package:bite/models/user_repo.dart';
import 'package:bite/screens/register/register_screen.dart';
import 'package:bite/theme/style.dart';
import 'package:flutter/material.dart';

class CreateAccountButton extends StatelessWidget {
  final UserRepository _userRepository;

  CreateAccountButton({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 60,
      color: appTheme().buttonColor,
      child: Text(
        'Register',
        style: TextStyle(color: appTheme().textSelectionColor),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return RegisterScreen(userRepository: _userRepository);
          }),
        );
      },
    );
  }
}
