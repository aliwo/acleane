import 'dart:collection';

import 'package:acleane/bloc_layer/bloc/calendar/calendar_bloc.dart';
import 'package:acleane/bloc_layer/bloc/journal/journal_bloc.dart';
import 'package:acleane/bloc_layer/model/journal.dart';
import 'package:acleane/bloc_layer/model/user_routine.dart';

import 'check_tile.dart';


class RoutineCheckTile extends CheckTile {

  final UserRoutine routine;
  final Journal journal;

  RoutineCheckTile({this.routine, this.journal, checked}) : super(checked: checked);

  @override
  Function genOnChanged() {
    return (bool value) => {};
  }

  @override
  String getTitle() {
    return routine.routineName;
  }
}
