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

  @override
  Future<AuthenticationState> process(authRepository) async {
    if (user.id == 1) {
      // if (false) {
      //// 회원가입이 필요없다면
      return AuthenticationAuthenticated();
    } else {
      //// 회원가입이 필요하다면
      return AuthenticationUnsignedUp();
    }
  }

}

class SignedIn extends AuthenticationEvent {
  final token;

  const SignedIn({@required this.token});

  @override
  Future<AuthenticationState> process(authRepository) async {
    await authRepository.storeToken(token: token);
    return AuthenticationHasToken();
  }

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'Logged In {token: $token}';
}

class SignedOut extends AuthenticationEvent {

  @override
  Future<AuthenticationState> process(authRepository) async {
    await authRepository.SignOut();
    return AuthenticationUninitialized();
  }
}
