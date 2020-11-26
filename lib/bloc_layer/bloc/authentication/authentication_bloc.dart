import 'dart:async';

import 'package:acleane/bloc_layer/model/user.dart';
import 'package:acleane/bloc_layer/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;

  @override
  AuthenticationBloc({
    @required this.authRepository,
  }) : assert(authRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final token = await authRepository.getToken();
      print('token { ${token} }');
      if (token != null) {
        yield AuthenticationHasToken();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }
    if (event is CheckSignUp) {
      try {
        // TODO;
        if (event.user.id == 1) {
          //// 회원가입이 필요없다면
          yield AuthenticationAuthenticated();
        } else {
          //// 회원가입이 필요하다면
          yield AuthenticationUnsignedUp();
        }
      } catch (e) {
        print(e.toString());
      }
    }
    if (event is SignedIn) {
      // 로컬에 토큰 저장 및 앱 스테이트에 보관
      await authRepository.storeToken(token: event.token);
      yield AuthenticationHasToken();
    }
    if (event is SignedOut) {
      // 로컬에 토큰 삭제 및 앱 스테이트에서 삭제
      await authRepository.SignOut();
      yield AuthenticationUninitialized();
    }
  }
}
