import 'package:bite/blocs/login/bloc.dart';
import 'package:bite/components/appbar.dart';
import 'package:bite/models/user_repo.dart';
import 'package:bite/screens/login/components/login_form.dart';
import 'package:bite/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  final UserRepository _userRepository;

  LoginScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc;

  UserRepository get _userRepository => widget._userRepository;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(
      userRepository: _userRepository,
    );
  }

// LoginForm(userRepository: _userRepository)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        builder: (BuildContext context) => _loginBloc,
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image.asset(
                  'assets/images/food2.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
              LoginForm(userRepository: _userRepository),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}
