import 'dart:collection';

import 'package:acleane/bloc_layer/bloc/calendar/calendar_bloc.dart';
import 'package:acleane/bloc_layer/bloc/journal/journal_bloc.dart';
import 'package:acleane/bloc_layer/model/journal.dart';
import 'package:acleane/bloc_layer/model/user_routine.dart';

import 'check_tile.dart';


class RoutineCheckTile extends CheckTile {

  final UserRoutine routine;
  final Journal journal;
  final JournalBloc journalBloc;
  final CalendarBloc calendarBloc;

  RoutineCheckTile({
    this.routine,
    this.journal,
    this.journalBloc,
    this.calendarBloc,
    checked
  }) : super(checked: checked);

  @override
  Function genOnChanged() {
    return (bool value) {
      if (value == true) {
        journalBloc.add(
            JournalCreated((calendarBloc.state as CalendarSuccess).date, routine.routineId)
        );
      } else {
        journalBloc.add(JournalDeleted(journal));
      };
      calendarBloc.add(CalendarJournalRefreshed((calendarBloc.state as CalendarSuccess).date));
    };
  }

  @override
  String getTitle() {
    return routine.routineName;
  }
}
