import 'dart:async';
import 'package:bite/models/user_repo.dart';
import 'package:bite/services/validators.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import './bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;

  RegisterBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  RegisterState get initialState => RegisterState.empty();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is Submitted) {
      yield* _mapFormSubmittedToState(event.email, event.password);
    }
  }

  Stream<RegisterState> _mapEmailChangedToState(String email) async* {
    yield currentState.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<RegisterState> _mapPasswordChangedToState(String password) async* {
    yield currentState.update(
      isPasswordValid: Validators.isValidPassword(password),
    );
  }

  Stream<RegisterState> _mapFormSubmittedToState(
    String email,
    String password,
  ) async* {
    yield RegisterState.loading();
    try {
      await _userRepository.register(
        email: email,
        password: password,
      );
      yield RegisterState.success();
    } catch (_) {
      yield RegisterState.failure();
    }
  }
}
