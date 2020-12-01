import 'package:acleane/bloc_layer/bloc/authentication/authentication_bloc.dart';
import 'package:acleane/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum Gender { MAN, WOMEN }

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) async {
        await state.onRoute(context);
      },
      child: _RegisterScreenScaffold(),
    );
  }
}

class _RegisterScreenScaffold extends StatefulWidget {
  _RegisterScreenScaffold({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterScreenScaffoldState();
}

class _RegisterScreenScaffoldState extends State<_RegisterScreenScaffold> {
  Gender _gender;
  int _age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        leading: FlatButton(
          onPressed: () {},
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
        title: Text(
          '사전 정보 입력',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
          children: ListTile.divideTiles(
                context: context,
                tiles: [
                  ListTile(title: InstructionBalloon('사전 정보와 피부고민을 입력해주세요')),
                  ListTile(
                    leading: Text('이름'),
                    title: Row(
                      children: [Expanded(child: TextField()), Icon(Icons.check_circle_outline)],
                    ),
                  ),
                  ListTile(
                    leading: Text('성별'),
                    title: Row(children: [
                      Text('남자'),
                      Radio(
                        value: Gender.MAN,
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                      Text('여자'),
                      Radio(
                        value: Gender.WOMEN,
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                    ]),
                  ),
                  ListTile(
                      leading: Text('나이'),
                      title: DropdownButton(
                        value: _age,
                        onChanged: (int value) {
                          setState(() => _age = value);
                        },
                        items: <int>[for (int i = 15; i <= 100; i++) i]
                            .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(value: value, child: Text(value.toString()));
                        }).toList(),
                      )),
                  ListTile(
                    leading: Text('피부고민'),
                    title: CustomCheckBoxGroup(
                      buttonTextStyle: ButtonTextStyle(
                          unSelectedColor: Colors.grey,
                          selectedColor: Colors.deepOrange,
                          textStyle: TextStyle(fontSize: 12)),
                      unSelectedColor: Colors.white,
                      selectedColor: Colors.white,
                      unSelectedBorderColor: Colors.grey,
                      selectedBorderColor: Colors.deepOrange,
                      enableShape: true,
                      enableButtonWrap: true,
                      spacing: 10,
                      width: 109,
                      // height: 27,
                      buttonLables: [
                        '지복합성 피부',
                        '지성 피부',
                        '여드름 피부',
                        '여드름 자국',
                        '건성 피부',
                        '민감성 피부',
                        '아토피 피부'
                      ],
                      buttonValuesList: [1, 2, 3, 4, 5, 6, 7],
                    ),
                  ),
                ],
              ).toList() +
              [
                Spacer(flex: 1435),
                OKButton(
                  child: Text('입력 완료하기'),
                  onPressed: null,
                ),
                Spacer(flex: 620),
              ]),
    );
  }
}
