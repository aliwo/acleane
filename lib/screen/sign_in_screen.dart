import 'package:flutter/material.dart';
import 'package:acleane/bloc_layer/bloc/sign_in/sign_in_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:acleane/bloc_layer/bloc/authentication/authentication_bloc.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(),
            flex: 1,
          ),
          Center(child: Title()),
          Spacer(
            flex: 2,
          ),
          BlocProvider(
              create: (BuildContext context) => SignInBloc(
                    authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
                    authRepository: BlocProvider.of<AuthenticationBloc>(context).authRepository,
                  ),
              child: GoogleLoginButton()),
          Text("개인정보 처리방침"),
          Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '곰 보 일 기',
          style: TextStyle(fontSize: 42, fontFamily: 'BM JUA_TTF'),
        ),
        Text(
          '여드름으로 고민하는 당신을 위해',
          style: TextStyle(fontSize: 14, fontFamily: 'NanumSquare_ac'),
        ),
      ],
    );
  }
}

class GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SignInBloc signInBloc = BlocProvider.of<SignInBloc>(context);
    return ElevatedButton(
        onPressed: () => signInBloc.add(GoogleSignInPressed()), child: Text("Test"));
  }
}
