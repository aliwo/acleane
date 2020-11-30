import 'dart:async';

import 'package:acleane/bloc_layer/bloc/authentication/authentication_bloc.dart';
import 'package:acleane/bloc_layer/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository authRepository;
  final AuthenticationBloc authenticationBloc;

  SignInBloc({
    @required this.authRepository,
    @required this.authenticationBloc,
  })  : assert(authRepository != null),
        assert(authenticationBloc != null);

  @override
  SignInState get initialState => SignInInitial();

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    if (event is SignInEvent) {
      try {
        yield SignInLoading();
        if (event is GoogleSignInPressed) {
          var token = await authRepository.googleSignIn();
          authenticationBloc.add(SignedIn(token: token));
        }
        yield SignInInitial();
      } catch (error) {
        yield SignInFailure(error: error.toString());
      }
    }
  }
}
