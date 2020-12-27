part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];

  Future<AuthenticationState> process(authRepository) async {
    return null;
  }

}

class AppStarted extends AuthenticationEvent {

  @override
  Future<AuthenticationState> process(authRepository) async {
    final token = await authRepository.getToken();
    print('token { ${token} }');
    if (token != null) {
      return AuthenticationHasToken();
    } else {
      return AuthenticationUnauthenticated();
    }
  }
}

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
