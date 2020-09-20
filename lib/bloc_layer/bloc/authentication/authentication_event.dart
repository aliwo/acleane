part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class CheckSignUp extends AuthenticationEvent {
  final User user;

  CheckSignUp({@required this.user});
}

class SignedIn extends AuthenticationEvent {
  final token;

  const SignedIn({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'Logged In {token: $token}';
}

class SignedOut extends AuthenticationEvent {}
