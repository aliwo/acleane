import 'dart:async';

import 'package:acleane/bloc_layer/model/user.dart';
import 'package:acleane/bloc_layer/repository/auth_repository.dart';
import 'package:acleane/bloc_layer/repository/user_repository.dart';
import 'package:acleane/screen/home_screen.dart';
import 'package:acleane/screen/sign_in_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  @override
  AuthenticationBloc({@required this.authRepository, @required this.userRepository})
      : assert(authRepository != null, userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    yield await event.process(authRepository);
  }
}
