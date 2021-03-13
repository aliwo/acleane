import 'dart:collection';

import 'package:acleane/bloc_layer/bloc/calendar/calendar_bloc.dart';
import 'package:acleane/bloc_layer/bloc/journal/journal_bloc.dart';
import 'package:acleane/bloc_layer/model/journal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'check_tile.dart';


class JournalCheckTile extends CheckTile {

  final Journal journal;

  JournalCheckTile({this.journal, checked}) : super(checked: checked);

  @override
  Function genOnChanged() {
    return null;
  }

  @override
  String getTitle() {
    return journal.routineName;
  }
}
