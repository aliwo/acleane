import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<JournalBloc, JournalState>(
      child: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // 메인이 아닌 screen 도 Scaffold 를 가져?
    return Scaffold();
  }
}
