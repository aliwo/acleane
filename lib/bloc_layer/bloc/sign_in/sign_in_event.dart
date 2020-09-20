part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class KakaoSignInPressed extends SignInEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'KakaoSignInPressed';
}

class GoogleSignInPressed extends SignInEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'GoogleSignInPressed';
}

class NaverSignInPressed extends SignInEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'NaverSignInPressed';
}
