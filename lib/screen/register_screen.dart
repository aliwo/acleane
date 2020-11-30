import 'package:acleane/bloc_layer/bloc/authentication/authentication_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  Gender _gender = Gender.MAN;
  int _age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  ListTile(
                    title: Text('사전 정보와 피부고민을 입력해주세요'),
                  ),
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
                          unSelectedColor: Colors.grey, selectedColor: Colors.deepOrange),
                      unSelectedColor: Colors.white,
                      selectedColor: Colors.white,
                      unSelectedBorderColor: Colors.grey,
                      selectedBorderColor: Colors.deepOrange,
                      enableShape: true,
                      enableButtonWrap: true,
                      width: 73,
                      height: 27,
                      buttonLables: ['a', 'b', 'c', 'd', 'e'],
                      buttonValuesList: [1, 2, 3, 4, 5],
                    ),
                  ),
                ],
              ).toList() +
              [
                Spacer(flex: 1435),
                SizedBox(
                  width: MediaQuery.of(context).size.width * (316 / 360),
                  height: MediaQuery.of(context).size.height * (40 / 640),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(23)))),
                      onPressed: null,
                      child: Text('입력 완료하기')),
                ),
                Spacer(flex: 620),
              ]),
    );
  }
}
