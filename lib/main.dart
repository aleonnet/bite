import 'package:bite/blocs/auth/auth_delegate.dart';
import 'package:bite/blocs/auth/bloc.dart';
import 'package:bite/models/user_repo.dart';
import 'package:bite/screens/home/home.dart';
import 'package:bite/screens/splash_screen.dart';
import 'package:bite/theme/style.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

main() {
  // https://github.com/felangel/bloc/issues/411
  BlocSupervisor.delegate = AuthBlocDelegate();
  runApp(App());
}

class App extends StatefulWidget {
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final UserRepository _userRepository = UserRepository();
  AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc(userRepository: _userRepository);
    _authBloc.dispatch(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        builder: (BuildContext context) {
          return _authBloc;
        },
        child: MaterialApp(
          home: BlocBuilder(
            bloc: _authBloc,
            builder: (BuildContext context, AuthState state) {
              if (state is Uninitialized) {
                return SplashScreen();
              }
              if (state is Authenticated) {
                return Home();
              }
              return Container(color: Colors.red[300]);
            },
          ),
        ));
  }

  @override
  void dispose() {
    _authBloc.dispose();
    super.dispose();
  }
}
