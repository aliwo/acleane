part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  void onRoute(context) {}

  @override
  List<Object> get props => [];
}

/// 스크린: splash
/// 아직 아무것도 불러오지 않은 상태입니다.
class AuthenticationUninitialized extends AuthenticationState {
  @override
  void onRoute(context) async {
    // 라우팅
  }
}

/// 스크린 : splash
/// 저장된 토큰을 불러온 상태입니다.
/// splash에서 회원의 인증상태를 확인합니다.
class AuthenticationHasToken extends AuthenticationState {
  @override
  void onRoute(context) async {
    // 라우팅
  }
}

/// 스크린 : splash/signIn -> home
/// 저장된 토큰 / 받아온 토큰이 회원가입이 되어있는 상태입니다.
/// home으로 이동합니다.
class AuthenticationAuthenticated extends AuthenticationState {
  @override
  void onRoute(context) async {
    // 라우팅
  }
}

/// 스크린 : splash/signIn -> signIn
/// 토큰이 없는 상태입니다.
/// 첫번째 실행인지 확인한 후 signIn 로 이동합니다.
class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  void onRoute(context) async {
    await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => SignInScreen()), (route) => false); // 라우팅
  }
}

/// 스크린 : splash/signIn -> signUp
/// 해당 유저가 회원가입 절차를 진행하지 않은 상태입니다.
/// signUp 으로 이동합니다.
class AuthenticationUnsignedUp extends AuthenticationState {
  @override
  void onRoute(context) async {
    // 라우팅
  }
}
