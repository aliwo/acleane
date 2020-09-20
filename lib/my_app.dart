import 'package:acleane/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:acleane/theme/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: coreTheme,
      home: SplashScreen(),
    );
  }
}
