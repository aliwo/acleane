import 'dart:collection';

import 'package:acleane/bloc_layer/bloc/calendar/calendar_bloc.dart';
import 'package:acleane/bloc_layer/bloc/journal/journal_bloc.dart';
import 'package:acleane/bloc_layer/model/journal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CheckTile {

  static final TYPE_JOURNAL = 1;
  static final TYPE_ROUTINE = 2;

  bool checked;

  CheckTile({this.checked});

  String getTitle() {
    return '';
  }

  Function genOnChanged() {
    // 함수를 리턴하는 함수
    return (bool value) => {};
  }

  Widget create(BuildContext context) {
    return Container(
      child: CheckboxListTile(
        activeColor: Colors.deepOrange[400],
        title: Text(getTitle()),
        controlAffinity: ListTileControlAffinity.trailing,
        value: checked,
        onChanged: genOnChanged(),
      ),
    );
  }
}
