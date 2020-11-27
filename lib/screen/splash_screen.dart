import 'package:acleane/bloc_layer/bloc/authentication/authentication_bloc.dart';
import 'package:acleane/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthenticationBloc>(context).add(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) async {
        await Future.delayed(Duration(seconds: 2));
        await Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => SignInScreen()), (route) => false);
      },
      child: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  Splash({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'images/svg/logo.svg',
                    width: 174,
                    height: 188,
                  ),
                  Text(
                    '곰 보 일 기',
                    style: TextStyle(fontSize: 42, fontFamily: 'BM JUA_TTF'),
                  ),
                  Text(
                    '여드름으로 고민하는 당신을 위해',
                    style: TextStyle(fontSize: 14, fontFamily: 'NanumSquare_ac'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              alignment: Alignment.center,
              width: 322,
              padding: EdgeInsets.all(10.0),
              child: Text(
                'v1.0',
                style: TextStyle(fontSize: 12, fontFamily: 'NanumSquare_ac'),
              ),
              decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.black))),
            ),
          ],
        ));
  }
}
