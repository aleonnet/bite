import 'package:bite/blocs/register/register_bloc.dart';
import 'package:bite/components/appbar.dart';
import 'package:bite/models/user_repo.dart';
import 'package:bite/screens/register/components/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  final UserRepository _userRepository;

  RegisterScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    _registerBloc = RegisterBloc(
      userRepository: widget._userRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(),
      body: Center(
        child: BlocProvider<RegisterBloc>(
          builder: (BuildContext context) => _registerBloc,
          child: RegisterForm(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _registerBloc.dispose();
    super.dispose();
  }
}
